package com.xmscltd.imservice.socket.service;


import java.util.Map;

/**
 * Created by pz on 16/11/23.
 */
public interface IOnLineUserManager {

    void addUser(String userId);

    void removeUser(String userId);

    Map getOnLineUsers();


}
