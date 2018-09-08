package com.xmscltd.imservice.socket;


import com.xmscltd.imservice.model.SocketUser;
import com.xmscltd.imservice.model.message.ToServerTextMessage;
import com.xmscltd.imservice.socket.sender.MessageSender;
import com.xmscltd.imservice.socket.service.IUserManager;
import io.jboot.component.jwt.JwtManager;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Created by pz on 16/11/23.
 */
@ServerEndpoint("/imserver/{token}/{userid}")
public class LayIMServer {

    static Map<String, CopyOnWriteArraySet<Session>> onlineCount = new ConcurrentHashMap<>();

    @OnOpen
    public void open(Session session, @PathParam("token") String token, @PathParam("userid") String userid){

        Map attrMap = JwtManager.me().parseJwtToken(token);

        userid = (userid == null)?"":userid;
        System.out.println("有新的连接进来");
        //判断token用户与当前登陆用户是否同一个
        if(attrMap != null && userid.equals((String) attrMap.get("userId"))){
            System.out.println("验证通过");

            IUserManager manager = LayIMFactory.createManager();
            SocketUser user = manager.getUser(Integer.parseInt(userid));
            //缓存总没有该用户添加,有则更新
            if(user != null) {
                manager.removeUser(user);
            }
//            SocketUser user = new SocketUser();
            user.setSession(session);
//            user.setUserId(Integer.parseInt(userid));
            //保存在线列表
            manager.addUser(user);

            print("当前在线用户："+manager.getOnlineCount());
            print("缓存中的用户个数："+LayIMFactory.createOnlineUserManager().getOnLineUsers().size());

        }else{
            //强制关闭socket
            System.out.println("验证不通过");
            try{
                session.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    @OnMessage
    public void receiveMessage(String message,Session session){

        try {

            ToServerTextMessage toServerTextMessage =
                    LayIMFactory.createSerializer().toObject(message,ToServerTextMessage.class);

            //得到接收的对象
            MessageSender sender = new MessageSender();

            sender.sendMessage(toServerTextMessage);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @OnError
    public void error(Throwable t) {
        print(t.getMessage());
    }

    @OnClose
    public void close(Session session){

        SocketUser user = new SocketUser();
        user.setSession(session);
        user.setUserId(0);
        print("用户掉线");
        //移除该用户
        LayIMFactory.createManager().removeUser(user);
        print("当前在线用户："+LayIMFactory.createManager().getOnlineCount());

    }

    private void print(String msg){
        System.out.println(msg);
    }
}
