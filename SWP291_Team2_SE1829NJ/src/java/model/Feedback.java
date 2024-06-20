/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hieum
 */
public class Feedback {
    private int id;
    private String img;
    private String description;
    private String createAt;

    public Feedback() {
    }

    public Feedback(int id, String img, String description, String createAt) {
        this.id = id;
        this.img = img;
        this.description = description;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", img=" + img + ", description=" + description + ", createAt=" + createAt + '}';
    }
    
}
