package com.example.tours.model;


import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class Hotel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @Size(max = 100)
    private String name;

    @NonNull
    private Integer starsCount;

    @NonNull
    @Size(max = 150)
    private String location;

    @NonNull
    @Size(max = 100)
    private String locationType;

    @OneToMany(mappedBy = "hotel", cascade = CascadeType.ALL)
    private Set<Review> reviews = new HashSet<>();

//    private String image;
//
//    private String imagePublicId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id")
    private Image image;

    @OneToMany(mappedBy = "hotel", cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
    private Set<Tour> tours = new HashSet<>();

    public Hotel() {

    }

    public int getRating() {
        int rating = 0;
        for (Review review: reviews) {
            rating += review.getMark();
        }
        return rating;
    }

}
