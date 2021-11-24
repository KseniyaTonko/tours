package com.example.tours.repository;

import com.example.tours.model.Hotel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HotelRepository extends CrudRepository<Hotel, Integer> {

    Hotel findById(int id);

}
