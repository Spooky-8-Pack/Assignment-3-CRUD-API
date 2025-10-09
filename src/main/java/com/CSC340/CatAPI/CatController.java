package com.CSC340.CatAPI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CatController {
    @Autowired
    private CatService catService;

    //get all students
    @GetMapping("/cats")
    public Object getAllCats(){
        return catService.getAllCats();
    }

    //get cat by ID
    @GetMapping("/cats/{id}")
    public Cat getCatById(@PathVariable long id){
        return catService.getCatById(id);
    }

    //get cat by name
    @GetMapping("/cats/name")
    public Object getStudentByName(@RequestParam String key){
        if(key != null){
            return catService.getCatsByName(key);
        }
        else{
            return catService.getAllCats();
        }
    }

    //get cats by breed
    @GetMapping("/cats/breed/{breed}")
    public Object getCatsByBreed(@PathVariable String breed){
        return catService.getCatsByBreed(breed);
    }

    //get cats above a certain age (elderly cats)
    @GetMapping("/cats/elderly")
    public Object getElderlyCats(@RequestParam(name = "age", defaultValue = "8")double age){
        return new ResponseEntity<>(catService.getElderlyCats(age), HttpStatus.OK);
    }

    //add new cat
    @PostMapping("/cats")
    public Object addCat(@RequestBody Cat cat){
        return catService.addCat(cat);
    }

    //update a cat
    @PutMapping("/cats/{id}")
    public Cat updateCat(@PathVariable Long id, @RequestBody Cat cat){
        catService.updateCat(id, cat);
        return catService.getCatById(id);
    }
    
    //delete a cat
    @DeleteMapping("/cats/{id}")
    public Object deleteCat(@PathVariable Long id){
        catService.deleteCat(id);
        return catService.getAllCats();
    }

    

}
