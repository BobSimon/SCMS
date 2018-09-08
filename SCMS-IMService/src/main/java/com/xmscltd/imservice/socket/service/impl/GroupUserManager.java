package com.xmscltd.imservice.socket.service.impl;


import com.xmscltd.imservice.socket.service.IGroupUserManager;
import io.jboot.Jboot;

import java.util.List;

/**
 * Created by pz on 16/11/28.
 */
public class GroupUserManager implements IGroupUserManager {

    private static final String cacheName = "LAYIM_GROUP";
    private static final String cacheKey = "GROUPID_";

    private static GroupUserManager manager = new GroupUserManager();

    public static GroupUserManager getInstance(){
        return manager;
    }
    //每个组存一个
    private String getCacheKey(int groupId){
        return cacheKey + groupId;
    }

    //将某个组的用户id存入缓存  key=》list
    @Override
    public boolean saveGroupMemeberIds(int groupId, List<String> userIds) {

        String key = getCacheKey(groupId);
        Jboot.me().getCache().put(cacheName,key,userIds);
        return true;
    }

    @Override
    public List<String> getGroupMembers(int groupId){
        String key = getCacheKey(groupId);
        List<String> groupList = Jboot.me().getCache().get(cacheName,key);
        if (groupList == null || groupList.size() == 0) {
            System.out.println("缓存中没有数据，需要从数据库读取");
//            LayIMDao dao = new LayIMDao();
//            List<String> memebers = dao.getMemberListOnlyIds(groupId);
            saveGroupMemeberIds(groupId, groupList);
            return groupList;
        }
//        }else{
//            System.out.println("直接从缓存中读取出来");
//        }
        return groupList;
    }
}
