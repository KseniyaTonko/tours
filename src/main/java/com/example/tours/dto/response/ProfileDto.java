package com.example.tours.dto.response;

import com.example.tours.model.enums.Status;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class ProfileDto {

    @NonNull
    private String username;

    @NonNull
    private String firstName;

    @NonNull
    private String lastName;

    @NonNull
    private String middleName;

    @NonNull
    private String phone;

    @NonNull
    private String email;

    @NonNull
    private Integer id;

    @NonNull
    private Boolean isAdmin;

    @NonNull
    private Status Status;

    private String image;
}
