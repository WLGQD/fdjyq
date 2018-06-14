package cn.zk.fdjyq.mapper;

import cn.zk.fdjyq.pojo.Privilege;
import cn.zk.fdjyq.pojo.PrivilegeExample;
import java.util.List;

public interface PrivilegeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Privilege record);

    int insertSelective(Privilege record);

    List<Privilege> selectByExample(PrivilegeExample example);

    Privilege selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Privilege record);

    int updateByPrimaryKey(Privilege record);
}