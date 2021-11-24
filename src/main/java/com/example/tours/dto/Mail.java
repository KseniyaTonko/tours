package com.example.tours.dto;


import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.web.bind.annotation.RequestParam;

@Data
@ToString
@RequiredArgsConstructor
public class Mail {

    @NonNull
    private String emailTo;

    @NonNull
    private String topic;

    @NonNull
    private String mailContent;
}

