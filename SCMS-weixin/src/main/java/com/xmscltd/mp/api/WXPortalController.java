package com.xmscltd.mp.api;


import com.alibaba.fastjson.JSONObject;
import com.jfinal.weixin.iot.msg.InEquDataMsg;
import com.jfinal.weixin.iot.msg.InEqubindEvent;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.UserApi;
import com.jfinal.weixin.sdk.jfinal.MsgController;

import com.jfinal.weixin.sdk.msg.in.*;
import com.jfinal.weixin.sdk.msg.in.card.*;
import com.jfinal.weixin.sdk.msg.in.event.*;
import com.jfinal.weixin.sdk.msg.in.speech_recognition.InSpeechRecognitionResults;
import com.jfinal.weixin.sdk.msg.out.OutTextMsg;
import com.xmscltd.scms.base.model.WXMpUser;
import com.xmscltd.scms.base.service.WXMpUserService;
import com.xmscltd.scms.base.service.WeixinService;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * WXPortalController
 * com.xmscltd.mp.api
 * Created with IntelliJ IDEA.
 * Description:
 * Author: Administrator-cmchen
 * Date: 2018-03-19
 * Time: 17:13
 * Version: V1.0.0
 */
@RequestMapping("/wxapi/protal")
public class WXPortalController extends MsgController {

    private static final Logger logger = LoggerFactory.getLogger(WXPortalController.class);

    @JbootrpcService
    private WeixinService weixinService;

    @JbootrpcService
    private WXMpUserService wxMpUserService;

    @Override
    protected void processInTextMsg(InTextMsg inTextMsg) {

    }

    @Override
    protected void processInImageMsg(InImageMsg inImageMsg) {

    }

    @Override
    protected void processInVoiceMsg(InVoiceMsg inVoiceMsg) {

    }

    @Override
    protected void processInVideoMsg(InVideoMsg inVideoMsg) {

    }

    @Override
    protected void processInShortVideoMsg(InShortVideoMsg inShortVideoMsg) {

    }

    @Override
    protected void processInLocationMsg(InLocationMsg inLocationMsg) {

    }

    @Override
    protected void processInLinkMsg(InLinkMsg inLinkMsg) {

    }

    @Override
    protected void processInCustomEvent(InCustomEvent inCustomEvent) {

    }

    @Override
    protected void processInFollowEvent(InFollowEvent inFollowEvent) {
        //关注事件
        if (InFollowEvent.EVENT_INFOLLOW_SUBSCRIBE.equals(inFollowEvent.getEvent()))
        {
            //1、获取openid
            logger.debug("关注：" + inFollowEvent.getFromUserName());
            String openId = inFollowEvent.getFromUserName();
            //2、获取unionid
            ApiResult apiResult = UserApi.getUserInfo(openId);
            JSONObject json = JSONObject.parseObject(apiResult.getJson());
            String unionid = json.getString("unionid");
            //判断是否有用户存在
            WXMpUser mpUser = wxMpUserService.findByUnionId(unionid);
            //新用户
            if(mpUser == null){
                //保存用户  sys_user weixin_user mp_user
            }else{
                //更新weixin_user
            }
            OutTextMsg outMsg = new OutTextMsg(inFollowEvent);
            outMsg.setContent("哟,关注成功");
            render(outMsg);
        }
        // 如果为取消关注事件，将无法接收到传回的信息
        if (InFollowEvent.EVENT_INFOLLOW_UNSUBSCRIBE.equals(inFollowEvent.getEvent()))
        {
            logger.debug("取消关注：" + inFollowEvent.getFromUserName());
        }
    }

    @Override
    protected void processInQrCodeEvent(InQrCodeEvent inQrCodeEvent) {

    }

    @Override
    protected void processInLocationEvent(InLocationEvent inLocationEvent) {

    }

    @Override
    protected void processInMassEvent(InMassEvent inMassEvent) {

    }

    @Override
    protected void processInMenuEvent(InMenuEvent inMenuEvent) {

    }

    @Override
    protected void processInSpeechRecognitionResults(InSpeechRecognitionResults inSpeechRecognitionResults) {

    }

    @Override
    protected void processInTemplateMsgEvent(InTemplateMsgEvent inTemplateMsgEvent) {

    }

    @Override
    protected void processInShakearoundUserShakeEvent(InShakearoundUserShakeEvent inShakearoundUserShakeEvent) {

    }

    @Override
    protected void processInVerifySuccessEvent(InVerifySuccessEvent inVerifySuccessEvent) {

    }

    @Override
    protected void processInVerifyFailEvent(InVerifyFailEvent inVerifyFailEvent) {

    }

    @Override
    protected void processInPoiCheckNotifyEvent(InPoiCheckNotifyEvent inPoiCheckNotifyEvent) {

    }

    @Override
    protected void processInWifiEvent(InWifiEvent inWifiEvent) {

    }

    @Override
    protected void processInUserCardEvent(InUserCardEvent inUserCardEvent) {

    }

    @Override
    protected void processInUpdateMemberCardEvent(InUpdateMemberCardEvent inUpdateMemberCardEvent) {

    }

    @Override
    protected void processInUserPayFromCardEvent(InUserPayFromCardEvent inUserPayFromCardEvent) {

    }

    @Override
    protected void processInMerChantOrderEvent(InMerChantOrderEvent inMerChantOrderEvent) {

    }

    @Override
    protected void processIsNotDefinedEvent(InNotDefinedEvent inNotDefinedEvent) {

    }

    @Override
    protected void processIsNotDefinedMsg(InNotDefinedMsg inNotDefinedMsg) {

    }

    @Override
    protected void processInUserGiftingCardEvent(InUserGiftingCardEvent msg) {

    }

    @Override
    protected void processInUserGetCardEvent(InUserGetCardEvent msg) {

    }

    @Override
    protected void processInUserConsumeCardEvent(InUserConsumeCardEvent msg) {

    }

    @Override
    protected void processInCardSkuRemindEvent(InCardSkuRemindEvent msg) {

    }

    @Override
    protected void processInCardPayOrderEvent(InCardPayOrderEvent msg) {

    }

    @Override
    protected void processInCardPassCheckEvent(InCardPassCheckEvent msg) {

    }

    @Override
    protected void processInEqubindEvent(InEqubindEvent msg) {

    }

    @Override
    protected void processInEquDataMsg(InEquDataMsg msg) {

    }
}
