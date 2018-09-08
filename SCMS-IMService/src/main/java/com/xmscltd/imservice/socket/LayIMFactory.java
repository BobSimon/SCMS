package com.xmscltd.imservice.socket;


import com.xmscltd.imservice.socket.service.IGroupUserManager;
import com.xmscltd.imservice.socket.service.IOnLineUserManager;
import com.xmscltd.imservice.socket.service.IUserManager;
import com.xmscltd.imservice.socket.service.impl.GroupUserManager;
import com.xmscltd.imservice.socket.service.impl.OnLineUserManager;
import com.xmscltd.imservice.socket.service.impl.UserManager;
import com.xmscltd.imservice.util.serializer.FastJsonSerializer;
import com.xmscltd.imservice.util.serializer.IJsonSerializer;

/**
 * Created by pz on 16/11/23.
 */
public class LayIMFactory {
    //创建序列化器
    public static IJsonSerializer createSerializer(){
        return new FastJsonSerializer();
    }

    //创建在线人员管理工具
    public static IUserManager createManager(){
        return UserManager.getInstance();
    }

    //创建群人员管理工具
    public static IGroupUserManager createGroupUserManager(){
        return GroupUserManager.getInstance();
    }
    //创建缓存在线人员管理工具
    public static IOnLineUserManager createOnlineUserManager(){
        return OnLineUserManager.getInstance();
    }
}
