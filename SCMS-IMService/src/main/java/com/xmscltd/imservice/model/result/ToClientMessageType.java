package com.xmscltd.imservice.model.result;

/**
 * Created by pz on 16/11/24.
 */
public enum ToClientMessageType {

    TYPE_SYSTEM("系统消息",0)

    ,TYPE_TEXT_MESSAGE("普通文本消息",1)

    ,TYPE_FILE_MESSAGE("文件消息",2)

    ,TYPE_IMAGE_MESSAGE("图片消息",3)

    ,TYPE_VIDEO_MESSAGE("视频消息",4)

    ,TYPE_ONLINE("上线提示",5)

    ,TYPE_OFFLINE("下线提示",6);

    ToClientMessageType(String s,int i){

    }
}
