package com.xmscltd.imservice.socket.service.impl;

import com.xmscltd.imservice.socket.service.IOnLineUserManager;
import io.jboot.Jboot;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by pz on 16/11/24.
 */
public class OnLineUserManager implements IOnLineUserManager {

    static final String cacheName = "LAYIM";
    static final String cacheKey = "ONLINE_USER";

    private static OnLineUserManager manager = new OnLineUserManager();

    public static OnLineUserManager getInstance(){
        return manager;
    }

    @Override
    public void addUser(String userId){
        Map map = Jboot.me().getCache().get(cacheName,cacheKey);
        if(map == null){
            map = new ConcurrentHashMap();
        }
        map.put(userId,"online");
        Jboot.me().getCache().put(cacheName,cacheKey,map);
    }

    @Override
    public void removeUser(String userId){
        Map map = Jboot.me().getCache().get(cacheName,cacheKey);

        if (map == null){ return; }

        map.remove(userId);
        Jboot.me().getCache().put(cacheName,cacheKey,map);
    }

    @Override
    public Map getOnLineUsers(){
        Map map = Jboot.me().getCache().get(cacheName,cacheKey);
        return map;
    }
    //
}
