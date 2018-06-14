package cn.zk.fdjyq.mapper;

import cn.zk.fdjyq.pojo.Unit;
import cn.zk.fdjyq.pojo.UnitExample;
import java.util.List;

public interface UnitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Unit record);

    int insertSelective(Unit record);

    List<Unit> selectByExample(UnitExample example);

    Unit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Unit record);

    int updateByPrimaryKey(Unit record);
}