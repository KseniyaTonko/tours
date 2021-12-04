package com.example.tours.repository;

import com.example.tours.model.UsersTour;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersTourRepository extends CrudRepository<UsersTour, Integer> {

    UsersTour findById(int id);

    List<UsersTour> findAllByOrderByDateAsc();
}
