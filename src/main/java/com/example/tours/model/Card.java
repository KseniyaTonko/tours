package com.example.tours.model;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Setter
@Getter
@RequiredArgsConstructor
@Entity
public class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @Size(max = 30)
    private String name;

    @NonNull
    private String number;

    @NonNull
    private String month;

    @NonNull
    private String year;

    @NonNull
    private String ccv;

    @NonNull
    private String manName;

    private Float money;


    public Card() {

    }
}
