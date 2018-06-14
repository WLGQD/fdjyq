package cn.zk.fdjyq.service;


import cn.zk.fdjyq.pojo.Role;
import java.util.List;

public interface RoleService {
    void add(Role c);
    void delete(int id);
    void update(Role c);
    Role get(int id);
    List list();
}