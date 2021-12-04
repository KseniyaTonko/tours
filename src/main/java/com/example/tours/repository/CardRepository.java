package com.example.tours.repository;

import com.example.tours.model.Card;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CardRepository extends CrudRepository<Card, Integer> {

    Card findById(int id);

    List<Card> findAllByOrderByNameAsc();

}
