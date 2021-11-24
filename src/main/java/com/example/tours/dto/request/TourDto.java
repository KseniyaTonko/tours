package com.example.tours.dto.request;

import com.example.tours.model.enums.FoodType;
import com.example.tours.model.enums.TourType;
import com.example.tours.model.enums.Transport;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.hibernate.annotations.Type;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;

@Data
@RequiredArgsConstructor
public class TourDto {

    @NonNull
    @Size(max = 50)
    public String name;

    @NonNull
    private String hotelId;

    @NonNull
    @Size(max = 50)
    private String country;

    @NonNull
    @Size(max = 50)
    private String resort;

    @NonNull
    @Size(max = 50)
    private String townFrom;

    @NonNull
    @Size(max = 20)
    private String lasting;

    @NonNull
    private Date startTime;

    @NonNull
    private Date endDate;

    @NonNull
    @Size(max = 30)
    private Transport transport;

    @NonNull
    private TourType type;

    @NonNull
    private FoodType foodType;

    @NonNull
    private Float price;

    @NotBlank
    @Size(max = 500)
    @Type(type = "org.hibernate.type.TextType")
    private String description;

    @NonNull
    private Integer remainingSeats;

}
