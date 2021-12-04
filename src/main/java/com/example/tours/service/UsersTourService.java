package com.example.tours.service;

import com.example.tours.model.UsersTour;
import com.example.tours.repository.UsersTourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UsersTourService {

    @Autowired
    private UsersTourRepository usersTourRepository;

    public UsersTour getById(String id) {
        return usersTourRepository.findById(Integer.parseInt(id));
    }

    public List<UsersTour> getBoughtTours() {
        return usersTourRepository.findAllByOrderByDateAsc().stream()
                .filter(el->el.getEndBookDate()==null)
                .collect(Collectors.toList());
    }
}
