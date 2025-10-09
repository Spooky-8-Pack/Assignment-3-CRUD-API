package com.CSC340.CatAPI;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CatRepository extends JpaRepository<Cat, Long> {

    //get cats by breed
    List<Cat> getCatsByBreed(String breed);

    //custom query to get elderly cats
    @Query(value = "select * from cats s where s.age >= ?1", nativeQuery = true)
    List<Cat> getElderlyCats(double age);

    //custom query to get cats by name
    @Query(value = "select * from cats s where s.name like %?1%", nativeQuery = true)
    List<Cat> getCatsByName(String name);
}    
