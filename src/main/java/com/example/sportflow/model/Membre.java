package com.example.sportflow.model;

import java.sql.Date;

public class Membre {
    private int id;
    private String nom;
    private String SportPratique;
    private Date naissance;

    public Membre() {
    }

    public Membre(int id, String nom, String sportPratique, Date naissance) {
        this.id = id;
        this.nom = nom;
        SportPratique = sportPratique;
        this.naissance = naissance;
    }

    public Membre(String nom, String sportPratique, Date naissance) {
        this.nom = nom;
        SportPratique = sportPratique;
        this.naissance = naissance;
    }

    public Membre(String nom, Date naissance, String sportpratique) {
        this.nom = nom;
        this.SportPratique = sportpratique;
        this.naissance = naissance;

    }

    public Membre(int id, String nom, Date naissance, String sportpratique) {
        this.id = id;
        this.nom = nom;
        this.SportPratique = sportpratique;
        this.naissance = naissance;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSportPratique() {
        return SportPratique;
    }

    public void setSportPratique(String sportPratique) {
        SportPratique = sportPratique;
    }

    public Date getNaissance() {
        return naissance;
    }

    public void setNaissance(Date naissance) {
        this.naissance = naissance;
    }
}
