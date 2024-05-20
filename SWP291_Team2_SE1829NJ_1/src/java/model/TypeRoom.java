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
public class TypeRoom {
    private int id;
    private String name;
    private Timestamp createAt;
    private Timestamp updateAt;
    private Timestamp delateAt;
    private boolean isDelete;

    public TypeRoom() {
    }

    public TypeRoom(int id, String name, Timestamp createAt, Timestamp updateAt, Timestamp delateAt, boolean isDelete) {
        this.id = id;
        this.name = name;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.delateAt = delateAt;
        this.isDelete = isDelete;
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

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    public Timestamp getDelateAt() {
        return delateAt;
    }

    public void setDelateAt(Timestamp delateAt) {
        this.delateAt = delateAt;
    }

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "TypeRoom{" + "id=" + id + ", name=" + name + ", createAt=" + createAt + ", updateAt=" + updateAt + ", delateAt=" + delateAt + ", isDelete=" + isDelete + '}';
    }

    
    
    
}
