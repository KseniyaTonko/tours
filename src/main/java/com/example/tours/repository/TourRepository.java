package com.example.tours.repository;

import com.example.tours.model.Tour;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface TourRepository extends CrudRepository<Tour, Integer> {

    Tour findById(int id);

    Set<Tour> findAllByOrderByIdDesc();

}
