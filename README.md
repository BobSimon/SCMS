### 项目介绍
    
　　SCMS-admin是基于[jboot](https://github.com/yangfuhai/jboot)全家桶构建的微服务实战项目，以微服务快速迭代开发为架构思想，目前包含后台管理模块、微信公众号模块，将来计划按照电商业务加入秒杀、商品、订单、app、小程序等模块。微服务模块分为api层、实体层、调用层、实现层、基础层，包含代码生成、用户角色权限、数据字典、日志管理、服务治理、服务监控、链路跟踪等功能。无论是学习jboot还是作为项目脚手架开发都是一个很好的选择。

　　SCMS-admin主要的开发理念就是简单快速，所以框架里还包含一些其他特性，比如：

 - 简单好用的代码生成：微服务每个模块每层都可自动生成，只做核心代码开发，省去大量开发时间。
 - 牛逼的统一异常：分为业务、校验、系统异常，任何地方抛出异常都常可直接转化为前端提示，无需过多编码。
 - 快速的数据字典：将字典通过管理端配置，任何模块都可直接使用。
 - 业务状态管理：业务状态单独管理，即解耦了业务与状态又满足了分布式项目使用，在任何需要转码的地方都可直接使用。
 
 还有很多很多期待你在使用中发现。

 **感兴趣有疑问的可以加jboot群交流：601440615** 

### 技术选型

 - 核心框架：jboot 1.6.0
 - 模版引擎：jfinal 3.4
 - 安全框架：shiro
 - 缓存框架：ehcache/redis
 - 容错隔离：hystrix
 - 调用监控：hystrix-dashboard
 - 链路跟踪：zipkin
 - 页面ui：bootstrap
 - 后台UI模板：nitfy V2.5

### 模块说明

项目为使用maven构建的多模块项目

 - SCMS-parent：父模块，主要管理依赖
 - SCMS-admin：后台管理客户端模块
 - SCMS-admin-base：基础model,service
 - SCMS-admin-common：框架相关代码
 - SCMS-IMService：LayIM模块
 - SCMS-wechat：微信公众号客户端模块
### 重要更新



 
### 项目使用

**请使用jdk8及以上版本，数据库为mysql。** 

运行SCMS-admin 下的Starter
打开：http://127.0.0.1/
用户名：admin 密码：123123
    
### 代码生成

对jboot 代码生成进行了配置文件的封装，使用更简单方便

1、配置代码生成配置文件，包含数据库配置与代码生成包相关配置
    
    配置文件位置：
    各模块 resources/jboot.properties

2、执行代码生成类

    代码生成入口：
    com.xmscltd.scms.CodeGen
            genModel();
            genService();
            genServiceImpl();

provider实现类生成配置文件示例：
   
    #---------------------------------------------------------------------------------#
    # Generator Config
    # jboot.admin.serviceimpl.ge.entity.package: the entity package;
    # jboot.admin.serviceimpl.ge.servicepackage：service 接口 package
    # jboot.admin.serviceimpl.ge.serviceimplpackage：service 实现类 package
    # jboot.admin.serviceimpl.ge.localdev.removedtablenameprefixes: 需要移除表名前缀只留下后部分，多个逗号隔开
    # jboot.admin.serviceimpl.ge.localdev.excludedtable: 生成时不包含表名列表，多个逗号隔开
    # jboot.admin.serviceimpl.ge.excludedtableprefixes: 生成时不包含表前缀，多个逗号隔开
    #---------------------------------------------------------------------------------#
    jboot.admin.serviceimpl.ge.modelpackage=io.jboot.admin.service.entity.model
    jboot.admin.serviceimpl.ge.servicepackage=io.jboot.admin.service.api
    jboot.admin.serviceimpl.ge.serviceimplpackage=io.jboot.admin.service.provider
    jboot.admin.serviceimpl.ge.removedtablenameprefixes=sys_
    jboot.admin.serviceimpl.ge.excludedtable=
    jboot.admin.serviceimpl.ge.excludedtableprefixes=temp_,v_
    
### 页面展示
#### 登录页面
![image](./img/login.png)
#### 后台首页(暂时没有dashboard,日志页面放在首页)
![image](./img/dashboard.png)
#### 部门管理
![image](./img/department.png)
#### SwaggerUI
![image](./img/swaggerui.png)
#### LayIM(LayIM为收费,本项目仅仅测试使用,如果需要请自行购买)
![image](./img/layim.png)

SCMS-admin 目前仅仅只是半成品后续会继续完善，欢迎大家指正批评！！！！
改项目在完成过程中参考以下项目代码：
### 感谢

 - jboot：https://gitee.com/fuhai/jboot
 - jfinal：http://git.oschina.net/jfinal/jfinal
 - Jplus：https://gitee.com/retire/jplus
 - jboot-admin：https://gitee.com/rlaxuc/jboot-admin
 - layui：https://github.com/sentsin/layui
