/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class TypeRoom {

    private int id;
    private String name;
    private boolean isDelete;
    private Date createAt;
    private Date deleteAt;
    private Date updateAt;

    public TypeRoom(int id, String name, boolean isDelete, Date createAt, Date deleteAt, Date updateAt) {
        this.id = id;
        this.name = name;
        this.isDelete = isDelete;
        this.createAt = createAt;
        this.deleteAt = deleteAt;
        this.updateAt = updateAt;
    }

    public TypeRoom() {
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

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Date deleteAt) {
        this.deleteAt = deleteAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "TypeRoom{" + "id=" + id + ", name=" + name + ", isDelete=" + isDelete + ", createAt=" + createAt + ", deleteAt=" + deleteAt + ", updateAt=" + updateAt + '}';
    }
    
    
}
