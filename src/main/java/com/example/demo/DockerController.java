package com.example.demo;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DockerController {

    @GetMapping("/")
    public ResponseEntity<String> main() {

        return ResponseEntity.ok("hello docker");
    }

    @GetMapping("/hello")
    public String hello(){
        return "hello";
    }
}
