package com.CSC340.CatAPI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {

    @GetMapping({"", "/", "/home"})
    public String redirectToCats(){
        return "redirect:/cats";
    }

}
