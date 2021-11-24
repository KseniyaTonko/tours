package com.example.tours.controller;

import com.example.tours.dto.request.HotelDto;
import com.example.tours.dto.request.TourDto;
import com.example.tours.service.TourService;
import com.example.tours.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class TourController {

    @Autowired
    private UserService userService;

    @Autowired
    private TourService tourService;


    private void setModelAttrs(Model model) {
        model.addAttribute("user", userService.getUsernameResponse(
                SecurityContextHolder.getContext().getAuthentication()));
    }

    @GetMapping("/tours")
    private String toursPage(Model model) {
        setModelAttrs(model);
        return "home";
    }

    @GetMapping("/add-tour")
    public String addHotelPage() {
        return "tours/addTour";
    }

    @PostMapping("/add-tour")
    public String addHotel(@Valid TourDto tour, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            tourService.addTour(tour);
        }
        return "redirect:/tours";
    }

}
