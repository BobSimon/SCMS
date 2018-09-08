package com.xmscltd.mp.controller;

import com.jfinal.core.paragetter.Para;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.xmscltd.mp.utils.ApiConfigUtils;
import com.xmscltd.scms.base.common.RestResult;
import com.xmscltd.scms.base.model.Weixin;
import com.xmscltd.scms.base.service.WeixinService;
import com.xmscltd.scms.base.web.base.BaseController;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;

/**
 * MainController
 * com.xmscltd.mp.controller
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-20
 * Time: 15:47
 * Version: V1.0.0
 */
@RequestMapping("/mp")
public class MainController extends BaseController{

    @JbootrpcService
    private WeixinService weixinService;
    /**
     * 公众号列表
     */
    public void index(){
        render("index.html");
    }

    /**
     * 添加页面
     */
    public void add(){
        render("add.html");
    }

    /**
     * 新增提交
     * @param weixin
     */
    public void postAdd(@Para("")Weixin weixin){

        Boolean result = weixinService.save(weixin);
        //加入到ApiConfig以便调用
        if(result){
            ApiConfigKit.putApiConfig(ApiConfigUtils.weiXin2ApiConfig(weixin));
            RestResult.buildSuccess("添加成功！");
        }else{
            RestResult.buildError("添加失败！");
        }
    }

    /**
     * 删除微信
     */
    public void delect(){
        String id = getPara("id");
        Boolean result = weixinService.deleteById(id);
        if(result){
            RestResult.buildSuccess("删除成功！");
        }else{
            RestResult.buildError("删除失败！");
        }
    }
}
