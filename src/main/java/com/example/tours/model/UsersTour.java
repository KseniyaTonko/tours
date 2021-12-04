package com.example.tours.model;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
public class UsersTour {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id")
    private Tour tour;

    @NonNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @NonNull
    private Integer seats;

    @NonNull
    private Float price;

    @NonNull
    private Date date;

    private Date endBookDate;

    public UsersTour() {

    }
}
