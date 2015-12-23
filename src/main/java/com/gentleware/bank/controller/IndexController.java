package com.gentleware.bank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    public IndexController() {
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String registration(Model model) {
        return "redirect:/clients";
    }

}
