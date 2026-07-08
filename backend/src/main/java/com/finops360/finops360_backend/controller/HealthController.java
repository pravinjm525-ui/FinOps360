package com.finops360.finops360_backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    @GetMapping("/")
    public String home() {
        return "FinOps360 Backend Running";
    }

    @GetMapping("/health")
    public String health() {
        return "Application Healthy";
    }
}
