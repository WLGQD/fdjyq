package cn.zk.fdjyq.mapper;

import cn.zk.fdjyq.pojo.RolePrivilege;
import cn.zk.fdjyq.pojo.RolePrivilegeExample;
import java.util.List;

public interface RolePrivilegeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RolePrivilege record);

    int insertSelective(RolePrivilege record);

    List<RolePrivilege> selectByExample(RolePrivilegeExample example);

    RolePrivilege selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RolePrivilege record);

    int updateByPrimaryKey(RolePrivilege record);
}