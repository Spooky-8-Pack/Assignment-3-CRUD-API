package com.CSC340.CatAPI;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;


@Service
public class CatService {
    @Autowired
    private CatRepository catRepository;

    //get all cats
    public Object getAllCats(){
        return catRepository.findAll();
    }

    //get cat by ID
    public Cat getCatById(@PathVariable long catId){
        return catRepository.findById(catId).orElse(null);
    }

    //get cats by breed
    public Object getCatsByBreed(String breed){
        return catRepository.getCatsByBreed(breed);
    }

    //get cats by name
    public Object getCatsByName(String name){
        return catRepository.getCatsByName(name);
    }

    //get all cats above a certain age (elderly)
    public Object getElderlyCats(double age){
        return catRepository.getElderlyCats(age);
    }

    //add cat
    public Cat addCat(Cat cat){
        return catRepository.save(cat);
    }

    //update cat
    public Cat updateCat(Long catId, Cat cat){
        return catRepository.save(cat);
    }

    //delete cat
    public void deleteCat(Long catId){
        catRepository.deleteById(catId);
    }

    }
