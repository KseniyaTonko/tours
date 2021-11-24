package com.example.tours.model;


import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @NonNull
    private Boolean recommend;

    @NonNull
    @Size(max = 30)
    private String residenceTime;

    @NonNull
    private Date date;

    @NonNull
    @Size(max = 500)
    @Type(type = "org.hibernate.type.TextType")
    private String text;

    @NonNull
    private Integer mark;

    @NotBlank
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "hotel_id")
    private Hotel hotel;

    public Review() {

    }
}
