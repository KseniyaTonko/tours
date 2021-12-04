package com.example.tours.dto.request;

import lombok.Data;
import lombok.NonNull;

@Data
public class CardDto {

    @NonNull
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

}
