package com.example.tours.controller;

import com.example.tours.dto.request.HotelDto;
import com.example.tours.model.Hotel;
import com.example.tours.service.HotelService;
import com.example.tours.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;

@Controller
public class HotelController {

    @Autowired
    private HotelService hotelService;

    @Autowired
    private UserService userService;

    private void setModelAttrs(Model model) {
        model.addAttribute("user", userService.getUsernameResponse(
                SecurityContextHolder.getContext().getAuthentication()));
        model.addAttribute("userFull", userService.getCurrentUser(
                SecurityContextHolder.getContext().getAuthentication()));
    }

    @GetMapping("/add-hotel")
    public String addHotelPage() {
        return "hotels/addHotel";
    }

    @PostMapping("/add-hotel")
    public String addHotel(@Valid HotelDto hotel, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            hotelService.addHotel(hotel);
        }
        return "redirect:/";
    }

    @GetMapping("/hotel/{id}")
    public String hotelPage(@PathVariable("id") String hotelId, Model model) {
        setModelAttrs(model);
        if (hotelService.getHotelById(hotelId) != null) {
            model.addAttribute("hotel", hotelService.getHotelById(hotelId));
            if (hotelService.wasInHotel(hotelId)) {
                model.addAttribute("wasInHotel", true);
            }
            hotelService.countReviews(hotelId, model);
            return "hotels/hotel";
        }
        else {
            return "error";
        }
    }

    @GetMapping("/edit-hotel")
    public String editHotelPage(@RequestParam("id") String hotelId, Model model) {
        setModelAttrs(model);
        model.addAttribute("hotel", hotelService.getHotelById(hotelId));
        return "hotels/editHotel";
    }

    @PostMapping("edit-hotel")
    public String editHotel(@Valid Hotel hotel) {
        hotelService.editHotel(hotel);
        return "redirect:/hotel/" + hotel.getId();
    }

    @PostMapping("/file-upload-hotel")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file,
                               @RequestParam("hotelId") String hotelId) throws IOException {
        hotelService.saveImage(file, hotelId);
        return hotelId;
    }

    @PostMapping("/delete-hotel-image")
    public String deleteImg(@RequestParam("hotelId") String hotelId) throws IOException {
        hotelService.deleteOldImage(hotelService.getHotelById(hotelId));
        return "redirect:/hotel/" + hotelId;
    }

}
