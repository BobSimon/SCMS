package com.xmscltd.scms.admin.support.log;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.UserAgent;
import io.jboot.Jboot;
import com.xmscltd.scms.base.web.base.BaseController;
import com.xmscltd.scms.base.service.LogService;
import com.xmscltd.scms.base.model.Log;
import com.xmscltd.scms.base.model.User;
import com.xmscltd.scms.admin.support.auth.AuthUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.util.Date;

/**
 * 系统日志拦截器
 * @author Rlax
 *
 */
public class LogInterceptor implements Interceptor {

	private final static com.jfinal.log.Log logger = com.jfinal.log.Log.getLog(LogInterceptor.class);

	@Override
	public void intercept(Invocation inv) {
		if (inv.getController() instanceof BaseController) {
			BaseController c = (BaseController) inv.getController();
			User user = AuthUtils.getLoginUser();
			UserAgent userAgent = UserAgent.parseUserAgentString(c.getRequest().getHeader("User-Agent"));
			Browser browser = userAgent.getBrowser();
			ApiOperation ApiOperation = inv.getMethod().getAnnotation(ApiOperation.class);
			Log log = new Log();
			log.setUid(user.getId());
			log.setBrowser(browser.getName());
			log.setOperation(c.getRequest().getMethod());
			log.setFrom(c.getReferer());
			log.setIp(c.getIPAddress());
			log.setUrl(c.getRequest().getRequestURI());
			log.setCreateDate(new Date());
			log.setLastUpdAcct(user.getId() == null ? "guest" : user.getUsername());
			log.setLastUpdTime(new Date());
			log.setNote(ApiOperation==null?"方法没有描述":ApiOperation.value());

			try {
				LogService logService = Jboot.service(LogService.class);
				logService.save(log);
			} catch (Exception e) {
				logger.error(e.getMessage());
				e.printStackTrace();
			} finally {
				inv.invoke();
			}
		} else {
			inv.invoke();
		}
	}

}
