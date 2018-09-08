package com.xmscltd.imservice.socket.service;


import java.util.List;

/**
 * Created by pz on 16/11/23.
 */
public interface IGroupUserManager {

    boolean saveGroupMemeberIds(int groupId, List<String> userIds);

    List<String> getGroupMembers(int groupId);

}
