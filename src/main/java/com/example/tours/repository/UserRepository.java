package com.example.tours.repository;

import com.example.tours.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

    User findByEmail(String email);
    User findById(int Id);
    List<User> findAllByOrderByIdAsc();

}
