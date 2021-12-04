package com.example.tours.dto.request;

import com.example.tours.model.enums.FoodType;
import com.example.tours.model.enums.TourType;
import com.example.tours.model.enums.Transport;
import lombok.Data;
import lombok.NonNull;

import java.util.List;

@Data
public class SearchParams {

    @NonNull
    private List<Transport> transports;

    @NonNull
    private List<TourType> types;

    @NonNull
    private List<FoodType> foodTypes;

    @NonNull
    private Float minPrice;

    @NonNull
    private Float maxPrice;

    @NonNull
    private Integer minSeats;

    @NonNull
    private Integer maxSeats;

}
