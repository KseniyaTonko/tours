package com.example.tours.repository;

import com.example.tours.model.Contact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Integer> {

    Contact findById(int id);

    Set<Contact> findAllByOrderByIdDesc();

}
