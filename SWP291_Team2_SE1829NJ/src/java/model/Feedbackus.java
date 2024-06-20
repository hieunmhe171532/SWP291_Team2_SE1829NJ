package model;

import java.util.Date;

public class Feedbackus {
    private int id;
    private String name;
    private String email;
    private String message;
    private Date createdAt;

    public Feedbackus() {
        // Default constructor
    }

    public Feedbackus(String name, String email, String message) {
        this.name = name;
        this.email = email;
        this.message = message;
        this.createdAt = new Date(); // Set current date/time automatically
    }

    // Getters and setters
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Feedbackus{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", message='" + message + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
