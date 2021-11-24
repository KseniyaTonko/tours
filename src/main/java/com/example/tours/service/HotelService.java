package com.example.tours.service;


import com.cloudinary.utils.ObjectUtils;
import com.example.tours.dto.request.HotelDto;
import com.example.tours.model.Hotel;
import com.example.tours.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class HotelService {

    @Autowired
    private HotelRepository hotelRepository;

    @Autowired
    private ImageService imageService;

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
        if (hotel.getImagePublicId() != null) {
            imageService.cloudinary.uploader().destroy(hotel.getImagePublicId(), ObjectUtils.emptyMap());
            hotel.setImage(null);
            hotel.setImagePublicId(null);
        }
        hotelRepository.save(hotel);
    }

    public void saveImage(MultipartFile file, String id) throws IOException {
        Map uploadResult = imageService.cloudinary.uploader().upload(imageService.getFile(file), ObjectUtils.emptyMap());
        Hotel hotel = hotelRepository.findById(Integer.parseInt(id));
        deleteOldImage(hotel);
        hotel.setImage(uploadResult.get("secure_url").toString());
        hotel.setImagePublicId(uploadResult.get("public_id").toString());
        hotelRepository.save(hotel);
    }

    // -----------

}
