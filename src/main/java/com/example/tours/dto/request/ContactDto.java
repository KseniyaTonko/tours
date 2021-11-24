package com.example.tours.dto.request;

import com.example.tours.model.enums.Operator;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class ContactDto {

    @NonNull
    private String firstName;

    @NonNull
    private String lastName;

    @NonNull
    private String middleName;

    @NonNull
    private String phone;

    @NonNull
    private Operator mobileOperator;

    @NonNull
    private String email;

}
