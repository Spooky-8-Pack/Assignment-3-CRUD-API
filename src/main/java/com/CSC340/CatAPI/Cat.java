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
    private String catPicturePath;


    public Cat(String name, String description, String breed, double age) {
        this.name = name;
        this.description = description;
        this.breed = breed;
        this.age = age;
    }

    public Cat(){

    }

    public Cat(Long catId, String name, String description, String breed, double age, String catPicturePath) {
        this.catId = catId;
        this.name = name;
        this.description = description;
        this.breed = breed;
        this.age = age;
        this.catPicturePath = catPicturePath;
    }
    
    public Cat(String name, String description, String breed, double age, String catPicturePath) {
        this.name = name;
        this.description = description;
        this.breed = breed;
        this.age = age;
        this.catPicturePath = catPicturePath;
    }
    

    //getters & setters
    public Long getCatId(){
        return catId;
    }

    public void setCatId(Long catId){
        this.catId = catId;
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

    public String getCatPicturePath() {
        return catPicturePath;
    }

    public void setCatPicturePath(String catPicturePath) {
        this.catPicturePath = catPicturePath;
    }


}
