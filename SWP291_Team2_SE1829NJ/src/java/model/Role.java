/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.security.Timestamp;

/**
 *
 * @author hieum
 */
public class Role {
    private int id;
    private String name;
    private Timestamp createAt;
    private Timestamp deleteAt;
    private Timestamp updateAt;

    public Role() {
    }

    public Role(int id, String name, Timestamp createAt, Timestamp deleteAt, Timestamp updateAt) {
        this.id = id;
        this.name = name;
        this.createAt = createAt;
        this.deleteAt = deleteAt;
        this.updateAt = updateAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Timestamp deleteAt) {
        this.deleteAt = deleteAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "Role{" + "id=" + id + ", name=" + name + ", createAt=" + createAt + ", deleteAt=" + deleteAt + ", updateAt=" + updateAt + '}';
    }
    
}
