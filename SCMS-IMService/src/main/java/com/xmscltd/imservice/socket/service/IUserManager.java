package com.xmscltd.imservice.socket.service;


import com.xmscltd.imservice.model.SocketUser;

/**
 * Created by pz on 16/11/23.
 */
public interface IUserManager {

    boolean addUser(SocketUser user);

    boolean removeUser(SocketUser user);

    int getOnlineCount();

    SocketUser getUser(int userId);

}
