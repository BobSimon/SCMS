package com.xmscltd.scms.admin.controller.system;

import com.xmscltd.scms.base.web.base.BaseController;
import io.jboot.web.controller.annotation.RequestMapping;

/**
 * QuartzController
 * com.xmscltd.scms.admin.controller.system
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-02
 * Time: 15:39
 * Version: V1.0.0
 */
@RequestMapping("/system/quartz")
public class QuartzController extends BaseController {

    public void index() {
        render("main.html");
    }
}
