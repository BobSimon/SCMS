package com.xmscltd.scms.base.service.impl;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.xmscltd.scms.base.model.UserRole;
import com.xmscltd.scms.base.service.UserRoleService;
import com.xmscltd.scms.status.system.UserOnlineStatus;
import io.jboot.aop.annotation.Bean;
import com.xmscltd.scms.base.service.UserService;
import com.xmscltd.scms.base.model.User;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;

import javax.inject.Inject;
import javax.inject.Singleton;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Bean
@Singleton
@JbootrpcService
public class UserServiceImpl extends JbootServiceBase<User> implements UserService {

    @Inject
    private UserRoleService userRoleService;

    @Override
    public Page<User> findPage(int pageNumber, int pageSize, String sortName,  String sortOrder, String searchText) {
    	if(searchText!=null) {
			Columns columns = Columns.create();
			columns.like("username", "%"+searchText+"%");
			return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), sortName + " " + sortOrder);
		}else {
			return DAO.paginate(pageNumber, pageSize, sortName + " " + sortOrder);
		}
    }

    @Override
    public boolean hasUser(String name) {
        return findByUserName(name) != null;
    }

    @Override
    public User findByUserName(String name) {
        return DAO.findFirstByColumn("username", name);
    }

    @Override
    public boolean saveUser(User user, Long[] roles) {
        String pwd = user.getPwd();

        if (StrKit.notBlank(pwd)) {
            String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
            SimpleHash hash = new SimpleHash("md5", pwd, salt2, 2);
            pwd = hash.toHex();
            user.setPwd(pwd);
            user.setSalt2(salt2);
        }

        user.setOnlineStatus(UserOnlineStatus.OFFLINE);
        user.setCreatedate(new Date());
        user.setLastUpdTime(new Date());
        user.setNote("保存系统用户");

        return Db.tx(new IAtom() {
            @Override
            public boolean run() throws SQLException {
                if (!user.save()) {
                    return false;
                }

                if (roles != null) {
                    List<UserRole> list = new ArrayList<UserRole>();
                    for (Long roleId : roles) {
                        UserRole userRole = new UserRole();
                        userRole.setUserId(user.getId());
                        userRole.setRoleId(roleId);
                        list.add(userRole);
                    }
                    int[] rets = userRoleService.batchSave(list);

                    for (int ret : rets) {
                        if (ret < 1) {
                            return false;
                        }
                    }
                }
                return true;
            }
        });
    }

    @Override
    public boolean updateUser(User user, Long[] roles) {
        String pwd = user.getPwd();
        if (StrKit.notBlank(pwd)) {
            String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
            SimpleHash hash = new SimpleHash("md5", pwd, salt2, 2);
            pwd = hash.toHex();
            user.setPwd(pwd);
            user.setSalt2(salt2);
        } else {
            user.remove("pwd");
        }

        user.setLastUpdTime(new Date());
        user.setNote("修改系统用户");

        return Db.tx(new IAtom() {
            @Override
            public boolean run() throws SQLException {
                if (!user.update()) {
                    return false;
                }

                userRoleService.deleteByUserId(user.getId());

                if (roles != null) {
                    List<UserRole> list = new ArrayList<UserRole>();
                    for (Long roleId : roles) {
                        UserRole userRole = new UserRole();
                        userRole.setUserId(user.getId());
                        userRole.setRoleId(roleId);
                        list.add(userRole);
                    }

                    int[] rets = userRoleService.batchSave(list);
                    for (int ret : rets) {
                        if (ret < 1) {
                            return false;
                        }
                    }
                }
                return true;
            }
        });
    }

}