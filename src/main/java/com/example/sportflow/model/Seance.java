package com.example.sportflow.model;

import java.sql.Date;

public class Seance {
    private int id;
    private int  idMembre;
    private int idEntraineur;
    private Date dateTime;

    public Seance(int id, int idMembre, int idEntraineur, Date dateTime) {
        this.id = id;
        this.idMembre = idMembre;
        this.idEntraineur = idEntraineur;
        this.dateTime = dateTime;
    }

    public Seance(int idMembre, int idEntraineur, Date dateTime) {
        this.idMembre = idMembre;
        this.idEntraineur = idEntraineur;
        this.dateTime = dateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdMembre() {
        return idMembre;
    }

    public void setIdMembre(int idMembre) {
        this.idMembre = idMembre;
    }

    public int getIdEntraineur() {
        return idEntraineur;
    }

    public void setIdEntraineur(int idEntraineur) {
        this.idEntraineur = idEntraineur;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
}
