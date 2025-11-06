package com.CSC340.CatAPI;


import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;


@Service
public class CatService {
    @Autowired
    private CatRepository catRepository;
    private static final String UPLOAD_DIR = "src/main/resources/static/cat-pictures";

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
    public Cat addCat(Cat cat, MultipartFile catPicture){
        Cat newCat = catRepository.save(cat);
        String originalFileName = catPicture.getOriginalFilename();
        try{
            if(originalFileName != null && originalFileName.contains(".")){
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."), + 1);
                String fileName = String.valueOf(newCat.getCatId()) + "." + fileExtension;
                Path filePath = Paths.get(UPLOAD_DIR + fileName);

                InputStream inputStream = catPicture.getInputStream();

                Files.createDirectories(Paths.get(UPLOAD_DIR));
                Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                newCat.setCatPicturePath(fileName);
                   
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return catRepository.save(newCat);
    }

    //update cat
    public Cat updateCat(Long catId, Cat cat, MultipartFile catPicture){
        String originalFileName = catPicture.getOriginalFilename();
        try {
            if(originalFileName != null && originalFileName.contains(".")){
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."), + 1);
                String fileName = String.valueOf(catId) + "." + fileExtension;
                Path filePath = Paths.get(UPLOAD_DIR + fileName);

                InputStream inputStream = catPicture.getInputStream();

                Files.createDirectories(Paths.get(UPLOAD_DIR));
                Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
                cat.setCatPicturePath(fileName);
                   } 
        } catch(Exception e){
            e.printStackTrace();
        }
        return catRepository.save(cat);
    }

    //delete cat
    public void deleteCat(Long catId){
        catRepository.deleteById(catId);
    }

    }
