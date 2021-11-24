package com.example.tours.dto.request;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class RegisterDto {

    @NonNull
    private String username;

    @NonNull
    private String email;

    @NonNull
    private String firstName;

    @NonNull
    private String lastName;

    @NonNull
    private String middleName;

    @NonNull
    private String password;

    @NonNull
    private String passwordConfirm;

    @NonNull
    private String phone;

}
