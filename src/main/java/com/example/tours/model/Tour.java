package com.example.tours.model;

import com.example.tours.model.enums.FoodType;
import com.example.tours.model.enums.TourType;
import com.example.tours.model.enums.Transport;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class Tour {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @Size(max = 50)
    public String name;

    @NonNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "hotel_id")
    private Hotel hotel;

    @NonNull
    @Size(max = 50)
    private String country;

    @NonNull
    @Size(max = 50)
    private String resort;

    @NonNull
    @Size(max = 50)
    private String townFrom;

    @NonNull
    @Size(max = 20)
    private String lasting;

    @NonNull
    private String startTime;

    @NonNull
    private String endDate;

    @NonNull
    @Size(max = 30)
    private Transport transport;

    @NonNull
    private TourType type;

    @NonNull
    private FoodType foodType;

    @NonNull
    private Float price;

    @NonNull
    @Size(max = 500)
    @Type(type = "org.hibernate.type.TextType")
    private String description;

    @NonNull
    private Integer remainingSeats;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_id")
    private List<Image> images=new ArrayList<>();

    public Tour() {

    }
}
