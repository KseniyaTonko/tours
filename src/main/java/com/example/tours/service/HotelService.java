package com.example.tours.service;


import com.cloudinary.utils.ObjectUtils;
import com.example.tours.dto.request.HotelDto;
import com.example.tours.model.*;
import com.example.tours.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@Service
public class HotelService {

    @Autowired
    private HotelRepository hotelRepository;

    @Autowired
    private ImageService imageService;

    @Autowired
    private UserService userService;

    @Autowired
    private ReviewService reviewService;

    public void addHotel(HotelDto hotelDto) {
        Hotel hotel = new Hotel(hotelDto.getName(), hotelDto.getStarsCount(), hotelDto.getLocation(),
                hotelDto.getLocationType());
        hotelRepository.save(hotel);
    }

    public Hotel getHotelById(String id) {
        return hotelRepository.findById(Integer.parseInt(id));
    }

    public void editHotel(Hotel newHotel) {
        Hotel hotel = hotelRepository.findById((int)newHotel.getId());
        hotel.setName(newHotel.getName());
        hotel.setLocation(newHotel.getLocation());
        hotel.setLocationType(newHotel.getLocationType());
        hotel.setStarsCount(newHotel.getStarsCount());
        hotelRepository.save(hotel);
    }

    // upload image

    public void deleteOldImage(Hotel hotel) throws IOException {
        if (hotel.getImage() != null) {
            imageService.cloudinary.uploader().destroy(hotel.getImage().getImagePublicId(), ObjectUtils.emptyMap());
            Image image = hotel.getImage();
            hotel.setImage(null);
            hotelRepository.save(hotel);
            imageService.removeImage(image.getId());
        }
        hotelRepository.save(hotel);
    }

    public void saveImage(MultipartFile file, String id) throws IOException {
        Map uploadResult = imageService.cloudinary.uploader().upload(imageService.getFile(file), ObjectUtils.emptyMap());
        Hotel hotel = hotelRepository.findById(Integer.parseInt(id));
        deleteOldImage(hotel);
        Image image = new Image(uploadResult.get("secure_url").toString(), uploadResult.get("public_id").toString());
        hotel.setImage(image);
        hotelRepository.save(hotel);
    }

    // -----------

    public List<Hotel> getHotels() {
        return (List<Hotel>) hotelRepository.findAll();
    }

    public boolean wasInHotel(String hotelId) {
        int id = Integer.parseInt(hotelId);
        User user = userService.getCurrentUser(SecurityContextHolder.getContext().getAuthentication());
        Hotel hotel = hotelRepository.findById(id);
        if ((user == null) || (reviewService.findByUserAndHotel(user, hotel) != null)) {
            return false;
        }

        int year = Calendar.getInstance().get(Calendar.YEAR);
        int month = Calendar.getInstance().get(Calendar.MONTH);
        int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
        for (UsersTour tour: user.getTours()) {
            int tourDay = Integer.parseInt(tour.getTour().getEndDate().substring(0, 2));
            int tourMonth = Integer.parseInt(tour.getTour().getEndDate().substring(3, 5));
            int tourYear = Integer.parseInt(tour.getTour().getEndDate().substring(6, 10));
            if ((tour.getTour().getHotel().getId() == id) && (tourYear <= year) &&
                    (tourMonth <= month) && (tourDay <= day)){
                return true;
            }
        }
        return false;
    }

    public void countReviews(String hotelId, Model model) {
        Hotel hotel = hotelRepository.findById(Integer.parseInt(hotelId));
        int[] count = new int[5];
        Arrays.fill(count, 0);
        int rating = 0;
        for (Review review: hotel.getReviews()) {
            count[review.getMark()-1] += 1;
            rating += review.getMark();
        }
        model.addAttribute("oneStar", count[0]);
        model.addAttribute("twoStars", count[1]);
        model.addAttribute("threeStars", count[2]);
        model.addAttribute("fourStars", count[3]);
        model.addAttribute("fiveStars", count[4]);
        int size = hotel.getReviews().size();
        if (size == 0) {
            size = 1;
        }
        model.addAttribute("rating", rating / size);
        model.addAttribute("starsCount", size);
    }
}
