package com.CSC340.CatAPI;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

//table creation
@Entity
@Table(name = "Cats")
public class Cat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //generated ID
    private Long catId;

    @Column(nullable = false) 
    private String name;

    private String description; 
    private String breed;
    private double age;
    
    //blank constructor
    public Cat(){

    }

    //constructor given: ID, name, breed, and age
    public Cat(Long catId, String name, String breed, double age){
        this.catId = catId;
        this.name = name;
        this.breed = breed;
        this.age = age;
    }

    //constructor given: name, breed, and age
    public Cat(String name, String breed, double age){
        this.name = name;
        this.age = age;
        this.breed = breed;
    }

    //getters & setters
    public Long getcatID(){
        return catId;
    }

    public void setcatID(Long id){
        this.catId = id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getBreed(){
        return breed;
    }

    public void setBreed(String breed){
        this.breed = breed;
    }

    public double getAge(){
        return age;
    }

    public void setAge(double age){
        this.age = age;
    }

}
