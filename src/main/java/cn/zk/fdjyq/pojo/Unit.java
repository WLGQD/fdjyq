package cn.zk.fdjyq.pojo;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Unit {
    private Integer id;

    private String name;

    private String bmCode;// 编码

    private Long unitLayer;

    private String code;// 代码

    private Integer parentId;

    private Unit parent;//非数据库字段
    private List<Unit> children ;

    public Unit getParent() {
        return parent;
    }

    public void setParent(Unit parent) {
        this.parent = parent;
    }

    public List<Unit> getChildren() {
        return children;
    }

    public void setChildren(List<Unit> children) {
        this.children = children;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? "" : name.trim();
    }

    public String getBmCode() {
        return bmCode;
    }

    public void setBmCode(String bmCode) {
        this.bmCode = bmCode == null ? "" : bmCode.trim();
    }

    public Long getUnitLayer() {
        return unitLayer;
    }

    public void setUnitLayer(Long unitLayer) {
        this.unitLayer = unitLayer;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? "" : code.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}