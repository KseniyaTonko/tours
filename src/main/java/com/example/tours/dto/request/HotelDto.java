package com.example.tours.dto.request;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.validation.constraints.Size;

@Data
@RequiredArgsConstructor
public class HotelDto {

    @NonNull
    @Size(max = 100)
    private String name;

    @NonNull
    private Integer starsCount;

    @NonNull
    @Size(max = 150)
    private String location;

    @NonNull
    @Size(max = 100)
    private String locationType;

}
