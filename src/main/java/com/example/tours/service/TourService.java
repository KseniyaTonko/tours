package com.example.tours.service;

import com.example.tours.dto.request.TourDto;
import com.example.tours.model.Hotel;
import com.example.tours.model.Tour;
import com.example.tours.repository.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TourService {

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private HotelService hotelService;

    public void addTour(TourDto dto) {
        Hotel hotel = hotelService.getHotelById(dto.getHotelId());
        Tour tour = new Tour(dto.getName(), hotel, dto.getCountry(),
                dto.getResort(), dto.getTownFrom(), dto.getLasting(), dto.getStartTime(), dto.getEndDate(),
                dto.getTransport(), dto.getType(), dto.getFoodType(), dto.getPrice(), dto.getDescription(),
                dto.getRemainingSeats());
        tourRepository.save(tour);
    }

    public void editTour(TourDto dto, String id) {
        Hotel hotel = hotelService.getHotelById(dto.getHotelId());
        Tour tour = tourRepository.findById(Integer.parseInt(id));
        tour.setName(dto.getName());
        tour.setHotel(hotel);
        tour.setCountry(dto.getCountry());
        tour.setResort(dto.getResort());
        tour.setTownFrom(dto.getTownFrom());
        tour.setLasting(dto.getLasting());
        tour.setStartTime(dto.getStartTime());
        tour.setEndDate(dto.getEndDate());
        tour.setTransport(dto.getTransport());
        tour.setType(dto.getType());
        tour.setFoodType(dto.getFoodType());
        tour.setPrice(dto.getPrice());
        tour.setDescription(dto.getDescription());
        tour.setRemainingSeats(dto.getRemainingSeats());
        tourRepository.save(tour);
    }

}
