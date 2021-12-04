package com.example.tours.repository;

import com.example.tours.model.Hotel;
import com.example.tours.model.Review;
import com.example.tours.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Integer> {

    List<Review> findAllByOrderByDateAsc();

    Review findByUserAndHotel(User user, Hotel hotel);

    Review findById(int id);

}
