package com.example.tours.service;

import com.example.tours.dto.request.ReviewDto;
import com.example.tours.model.Hotel;
import com.example.tours.model.Review;
import com.example.tours.model.User;
import com.example.tours.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Date;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private UserService userService;

    public void addReview(ReviewDto dto) {
        User user = userService.getUserById(dto.getUserId());
        Hotel hotel = hotelService.getHotelById(dto.getHotelId());
        Date now = new Date();
        Review review = new Review(user, dto.getRecommend(), dto.getResidenceTime(), now, dto.getText(), dto.getMark(), hotel);
        reviewRepository.save(review);
    }

    public Review findByUserAndHotel(User user, Hotel hotel) {
        return reviewRepository.findByUserAndHotel(user, hotel);
    }

    public void like(String reviewId) {
        Review review = reviewRepository.findById(Integer.parseInt(reviewId));
        User user = userService.getCurrentUser(SecurityContextHolder.getContext().getAuthentication());
        changeLike(user, review);
        reviewRepository.save(review);
    }

    private void changeLike(User user, Review review) {
        if (review.getLikes().contains(user)) {
            review.getLikes().remove(user);
        } else {
            review.getLikes().add(user);
        }
    }

    public void deleteReview(String reviewId) {
        Review review = reviewRepository.findById(Integer.parseInt(reviewId));
        for (User like: review.getLikes()) {
            review.getLikes().remove(like);
        }
        reviewRepository.delete(review);
    }
}
