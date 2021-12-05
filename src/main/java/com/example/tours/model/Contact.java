package com.example.tours.model;

import com.example.tours.model.enums.Operator;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class Contact {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NonNull
    @Size(max = 40)
    private String firstName;

    @NonNull
    @Size(max = 40)
    private String lastName;

    @NonNull
    @Size(max = 40)
    private String middleName;

    @NonNull
    private String phone;

    @NonNull
    private Operator mobileOperator;

    @NonNull
    @Email
    @Size(max = 50)
    private String email;

//    private String image;
//
//    private String imagePublicId;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id")
    private Image image;

    public Contact() {

    }
}
