package com.example.tours.repository;

import com.example.tours.model.Tour;
import com.example.tours.model.enums.TourType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface TourRepository extends CrudRepository<Tour, Integer> {

    Tour findById(int id);

    Set<Tour> findAllByOrderByIdDesc();

    List<Tour> findAllByOrderByStartTimeAsc();

    List<Tour> findAllByTypeOrderByStartTimeAsc(TourType type);

}
