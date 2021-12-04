package com.example.tours.dto.response;

import lombok.Data;
import lombok.NonNull;

@Data
public class SearchValues {

    @NonNull
    String[] transport;

    @NonNull
    String[] type;

    @NonNull
    String[] food;

    @NonNull
    String minPrice;

    @NonNull
    String maxPrice;

    @NonNull
    String minSeats;

    @NonNull
    String maxSeats;

    @NonNull
    String minDate;

    @NonNull
    String maxDate;
}
