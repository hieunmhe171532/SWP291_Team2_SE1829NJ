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
public class Status {
    private int id;
    private String statusmame;
    private Timestamp createAt;
    private Timestamp updateAt;
    private boolean isDelete;

    public Status() {
    }

    public Status(int id, String statusmame, Timestamp createAt, Timestamp updateAt, boolean isDelete) {
        this.id = id;
        this.statusmame = statusmame;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.isDelete = isDelete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusmame() {
        return statusmame;
    }

    public void setStatusmame(String statusmame) {
        this.statusmame = statusmame;
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

    public boolean isIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Status{" + "id=" + id + ", statusmame=" + statusmame + ", createAt=" + createAt + ", updateAt=" + updateAt + ", isDelete=" + isDelete + '}';
    }

    
    
    
}
