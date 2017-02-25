/*
 * Copyright (c) 2017 Central Iowa Java Users Group (CIJUG)
 */

package com.cijug.website;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @RequestMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }

}
