package com.cybershop.models;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DeniedForm implements Serializable{
    @Id
    private int id;
    private String reason;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "DeniedForm{" + "id=" + id + ", reason=" + reason + '}';
    }
    
    
}
