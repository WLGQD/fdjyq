package cn.zk.fdjyq.service;

import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.pojo.Role;
import cn.zk.fdjyq.pojo.RolePrivilege;

import java.util.List;

/**
 * @author XKK
 * @create 2018-05-23 15:37
 * @desc
 **/

public interface RolePrivilegeService {
    void add(RolePrivilege c);
    void delete(int id);
    void update(RolePrivilege c);
    RolePrivilege get(int id);
    List list();

    List<Privilege>  fillPrivilegeForRole(Role role);

    void deleteAndUpdate(int[] privilegeIds, int id);
}