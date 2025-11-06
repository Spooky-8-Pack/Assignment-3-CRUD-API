package com.CSC340.CatAPI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CatController {
    @Autowired
    private CatService catService;

    //get all cats
    @GetMapping({"/cats", "/cats/"})
    public Object getAllCats(Model model){
        //return catService.getAllCats();
        model.addAttribute("catList", catService.getAllCats());
        model.addAttribute("title", "All Cats");
        return "cat-list"; 
    }

    //get cat by ID
    @GetMapping("/cats/{id}")
    public Object getCatById(@PathVariable long id, Model model){
        //return catService.getCatById(id);
        model.addAttribute("cat", catService.getCatById(id));
        model.addAttribute("title", "Cat #: " + id);
        return "cat-details";
    }

    //get cat by name
    @GetMapping("/cats/name")
    public Object getCatByName(@RequestParam String key, Model model){
        if(key != null){
            //return catService.getCatsByName(key);
            model.addAttribute("catList", catService.getCatsByName(key));
            model.addAttribute("title", "Cats By Name: " + key);
            return "cat-list";
        }
        else{
            return "redirect:/cats/";
        }
    }

    //get cats by breed
    @GetMapping("/cats/breed/{breed}")
    public Object getCatsByBreed(@PathVariable String breed, Model model){
        //return catService.getCatsByBreed(breed);
        model.addAttribute("catList", catService.getCatsByBreed(breed));
        model.addAttribute("title", "Cats By Breed: " + breed);
        return "cat-list";
    }

    //get cats above a certain age (elderly cats)
    @GetMapping("/cats/elderly")
    public Object getElderlyCats(@RequestParam(name = "age", defaultValue = "8")double age, Model model){
        //return new ResponseEntity<>(catService.getElderlyCats(age), HttpStatus.OK);
        model.addAttribute("catList", catService.getElderlyCats(age));
        model.addAttribute("title", "Elderly Cats with Age Above: " + age);
        return "cat-list";
    }

    //show create form for new cat
    @GetMapping("/cats/createForm")
    public Object showCreateForm(Model model){
        Cat cat = new Cat();
        model.addAttribute("student", cat);
        model.addAttribute("title", "Create New Cat");
        return "cat-create";
    }

    //add new cat
    @PostMapping("/cats")
    public Object addCat(Cat cat, @RequestParam MultipartFile picture){
        //return catService.addCat(cat);
        Cat newCat = catService.addCat(cat, picture);
        return "redirect:/cats/" + newCat.getcatID();
    }

    //show update form
    @GetMapping("/cats/updateForm/{id}")
    public Object showUpdateForm(@PathVariable Long id, Model model) {
        Cat cat = catService.getCatById(id);
        model.addAttribute("cat", cat);
        model.addAttribute("title", "Update Cat: " + id);
        return "cat-update";
  }

    //update a cat
    @PostMapping("/cats/update/{id}")
    public Object updateCat(@PathVariable Long id, Cat cat, @RequestParam MultipartFile picture){
        catService.updateCat(id, cat, picture);
        return "redirect:/cats/" + id;
    }
    
    //delete a cat
    @DeleteMapping("/cats/delete/{id}")
    public Object deleteCat(@PathVariable Long id){
        catService.deleteCat(id);
        return "redirect:/cats/";
    }

    

}
