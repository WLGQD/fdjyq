package cn.zk.fdjyq.pojo;

public class RolePrivilege {
    private Integer id;

    private Integer roleId;

    private Integer privilegeId;

    public RolePrivilege(Integer roleId, Integer privilegeId) {
        this.roleId = roleId;
        this.privilegeId = privilegeId;
    }
    public RolePrivilege() {
    }
    private Role role;
    private Privilege privilege;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Privilege getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Privilege privilege) {
        this.privilege = privilege;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(Integer privilegeId) {
        this.privilegeId = privilegeId;
    }
}