/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Blog {
    private int id,flag;

    
    private String title,detail,briefinfo,image;
    private Account account;
    private String createAt;

    public Blog() {
    }
    public Blog(int id, int flag, String title, String detail, String briefinfo, String image, Account account, String createAt) {
        this.id = id;
        this.flag = flag;
        this.title = title;
        this.detail = detail;
        this.briefinfo = briefinfo;
        this.image = image;
        this.account = account;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public int getFlag() {
        return flag;
    }

    public String getTitle() {
        return title;
    }

    public String getDetail() {
        return detail;
    }

    public String getBriefinfo() {
        return briefinfo;
    }

    public String getImage() {
        return image;
    }

    public Account getAccount() {
        return account;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setBriefinfo(String briefinfo) {
        this.briefinfo = briefinfo;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", flag=" + flag + ", title=" + title + ", detail=" + detail + ", briefinfo=" + briefinfo + ", image=" + image + ", account=" + account + ", createAt=" + createAt + '}';
    }

}
