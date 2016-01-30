package com.riverlog.viewpos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
@RequestMapping("/report")
public class ReportController {
 
      @RequestMapping(method = RequestMethod.GET)
        public String getWelcomePage() {
            return "Report";
        }
    
  }
