package com.example.tours.dto.request;

import lombok.Data;
import lombok.NonNull;

@Data
public class Question {

    @NonNull
    private Integer number;

    @NonNull
    private String answer;

}
