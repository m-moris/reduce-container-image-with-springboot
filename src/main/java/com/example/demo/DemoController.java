package com.example.demo;

import java.util.Date;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @RequestMapping("/")
    public ResponseEntity<Message> Get() {

        var message = new Message();
        message.setDate(new Date());
        message.setMessage("hello spring boot");

        return ResponseEntity.ok(message);
    }

}
