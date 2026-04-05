package com.morninggrind.backend.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "${cors.origins}")
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello MorningGrind";
    }
}