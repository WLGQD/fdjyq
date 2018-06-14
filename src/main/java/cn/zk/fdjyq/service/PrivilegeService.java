package cn.zk.fdjyq.service;

import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.pojo.Role;

import java.util.Collection;
import java.util.List;

/**
 * @author XKK
 * @create 2018-05-21 16:42
 * @desc
 **/

public interface PrivilegeService {

    void add(Privilege c);
    void delete(int id);
    void update(Privilege c);
    Privilege get(int id);
    List list();
    void fillParent(Privilege u);
    void fillChildren(Privilege u);
    List<Privilege> fillUp(List<Privilege> topList);



    /**
     * 查询所有顶级的权限
     *
     * @return
     */
    List<Privilege> getTopList();

    List<Privilege> getTreePrivileges(List<Privilege> topList);

    /**
     * 查询所有权限对于的URl集合
     *
     * @return
     */
    Collection<Privilege> getAllPrivilegeUrls();

}