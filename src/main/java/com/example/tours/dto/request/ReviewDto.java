package com.example.tours.dto.request;

import lombok.Data;
import lombok.NonNull;

@Data
public class ReviewDto {

    @NonNull
    private String userId;

    @NonNull
    private String hotelId;

    @NonNull
    private Boolean recommend;

    @NonNull
    private String residenceTime;

    @NonNull
    private String text;

    @NonNull
    private Integer mark;

}
