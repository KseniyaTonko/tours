package com.example.tours.controller;

import com.example.tours.dto.request.ReviewDto;
import com.example.tours.service.HotelService;
import com.example.tours.service.ReviewService;
import com.example.tours.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class ReviewController {

    @Autowired
    private UserService userService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private HotelService hotelService;

    @PostMapping("/add-review")
    public String addReview(@Valid ReviewDto dto) {
        reviewService.addReview(dto);
        return "redirect:/hotel/" + dto.getHotelId();
    }

    @GetMapping("/like/{reviewId}/{hotelId}")
    public String likeGet(@PathVariable("reviewId") String id,
                       @PathVariable("hotelId") String hotelId, Model model) {
        reviewService.like(id);
        return "redirect:/hotel/" + hotelId + "?id=#reviewsSection";
    }

    @PostMapping("/delete-review")
    public String deleteReview(@RequestParam("reviewId") String id,
                               @RequestParam("hotelId") String hotelId) {
        reviewService.deleteReview(id);
        return "redirect:/hotel/" + hotelId + "?id=#reviewsSection";
    }
}
