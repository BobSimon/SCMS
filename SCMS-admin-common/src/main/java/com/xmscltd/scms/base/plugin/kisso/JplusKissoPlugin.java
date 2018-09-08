/**
 * Copyright (c) 2015-2018,Retire 吴益峰 (372310383@qq.com).
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.xmscltd.scms.base.plugin.kisso;

import com.baomidou.kisso.web.WebKissoConfigurer;
import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;

public class JplusKissoPlugin implements IPlugin{

    private static final Log log = Log.getLog(JplusKissoPlugin.class);

    /**

     * 初始化

     */
    @Override
    public boolean start() {
        WebKissoConfigurer ssoConfig = new WebKissoConfigurer("sso.properties");
        // 此处可以实现自己的 KISSO 插件，也可动态注入 SSO 配置属性。

        // ssoConfig.setPluginList(pluginList);
        //运行模式设置，可选择指定模式的配置
        ssoConfig.setRunMode("test_mode");
        ssoConfig.initKisso();
        return true;
    }


    /**

     * 销毁

     */
    @Override
    public boolean stop() {
        log.info("Uninstalling Kisso ");
        return true;
    }
}
