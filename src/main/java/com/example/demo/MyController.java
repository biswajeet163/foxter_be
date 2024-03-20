package com.example.myecommerceapp.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World!";
    }

  @GetMapping("/")
    public String hello() {
        return "Hello, World! Biswa";
    }
}
