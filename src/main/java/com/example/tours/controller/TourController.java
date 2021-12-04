package com.example.tours.controller;

import com.example.tours.dto.request.Question;
import com.example.tours.dto.request.TourDto;
import com.example.tours.dto.response.UsernameDto;
import com.example.tours.model.Tour;
import com.example.tours.model.enums.FoodType;
import com.example.tours.model.enums.TourType;
import com.example.tours.model.enums.Transport;
import com.example.tours.service.QuestionService;
import com.example.tours.service.TourService;
import com.example.tours.service.UserService;
import com.example.tours.service.UsersTourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
public class TourController {

    @Autowired
    private UserService userService;

    @Autowired
    private TourService tourService;

    @Autowired
    private UsersTourService usersTourService;

    @Autowired
    private QuestionService questionService;

    private String tempMessage = "";

    private List<Tour> searchedTours = new ArrayList<>();

    private boolean finded = false;

    private void setHomeTours(Model model) {
        if (finded) {
            model.addAttribute("tours", searchedTours);
            if (tourService.getSearchValues() != null) {
                model.addAttribute("values", tourService.getSearchValues());
            }
        } else {
            model.addAttribute("tours", tourService.getTours());
        }
        model.addAttribute("params", tourService.getSearchParams());
    }

    @GetMapping("/")
    public String index(Model model) {
        userService.setUserToModel(model);
        setHomeTours(model);
        return "home";
    }

    @GetMapping("/home")
    public String home(Model model) {
        userService.setUserToModel(model);
        setHomeTours(model);
        return "home";
    }

    private void setModelAttrs(Model model) {
        model.addAttribute("user", userService.getUsernameResponse(
                SecurityContextHolder.getContext().getAuthentication()));
    }

    private void setChangeAttrs(Model model) {
        model.addAttribute("hotels", tourService.getHotels());
        model.addAttribute("transports", Transport.values());
        model.addAttribute("tourTypes", TourType.values());
        model.addAttribute("foodTypes", FoodType.values());
    }

    @GetMapping("/add-tour")
    public String addTourPage(Model model) {
        setModelAttrs(model);
        setChangeAttrs(model);
        return "tours/addTour";
    }


    @PostMapping("/add-tour")
    public String addTour(@Valid TourDto tour, BindingResult bindingResult) throws ParseException {
        if (!bindingResult.hasErrors()) {
            tourService.addTour(tour);
        }
        return "redirect:/";
    }

    @GetMapping("/about")
    public String about(Model model) {
        setModelAttrs(model);
        return "about";
    }

    @GetMapping("/tour/{id}")
    public String tourPage(@PathVariable("id") String id, Model model) throws ParseException {
        setModelAttrs(model);
        UsernameDto user = userService.getUsernameResponse(SecurityContextHolder.getContext().getAuthentication());
        if (user != null ) {
            model.addAttribute("profile", userService.getProfile(user.getId().toString()));
        }
        if (tourService.getTourById(id) != null) {
            Tour tour = tourService.getTourById(id);
            model.addAttribute("tour", tour);
            if (tourService.compareDates(tour.getStartTime(), new Date())) {
                model.addAttribute("canBuy", true);
            }
            if (tourService.checkCanBook(tour.getEndDate())) {
                model.addAttribute("canBook", true);
            }
            return "tours/tour";
        }
        else {
            return "error";
        }
    }

    @PostMapping("/edit-price")
    public String editPrice(@RequestParam("tourId") String id, @RequestParam("price") String price) {
        tourService.editPrice(Float.parseFloat(price), id);
        return "redirect:/tour/" + id;
    }

    @GetMapping("/edit-tour")
    public String editTourPage(@RequestParam("id") String id, Model model) {
        setModelAttrs(model);
        model.addAttribute(tourService.getTourById(id));
        setChangeAttrs(model);
        return "tours/editTour";
    }

    @PostMapping("/edit-tour")
    public String editTour(@RequestParam("id") String id, @Valid TourDto dto, BindingResult bindingResult) throws ParseException {
        if (!bindingResult.hasErrors()) {
            tourService.editTour(dto, id);
        }
        return "redirect:/tour/" + id;
    }

    @PostMapping("/file-upload-tour")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file,
                         @RequestParam("tourId") String tourId) throws IOException {
        tourService.saveImage(file, tourId);
        return tourId;
    }

    @PostMapping("/delete-tour-image")
    public String deleteImg(@RequestParam("tourId") String tourId,
                            @RequestParam("imageId") String imageId) throws IOException {
        tourService.deleteImage(tourId, imageId);
        return "redirect:/tour/" + tourId;
    }

    @PostMapping("/buy-tour")
    public String buyTour(@RequestParam("userId") String userId,
                          @RequestParam("cardId") String cardId,
                          @RequestParam("tourId") String tourId,
                          @RequestParam("seats") Integer seats, Model model) {
        String message = tourService.buyTour(userId, cardId, tourId, seats);
        setTourBuyAttrs(model, message);
        model.addAttribute("tour", tourService.getTourById(tourId));
        return "tours/tour";
    }

    @GetMapping("/my-tours")
    public String myTours(Model model) {
        setModelAttrs(model);
        UsernameDto user = userService.getUsernameResponse(SecurityContextHolder.getContext().getAuthentication());
        if (user != null ) {
            model.addAttribute("profile", userService.getProfile(user.getId().toString()));
            model.addAttribute("tours", tourService.getUserTours(user.getId()));
        }
        addTempMessage(model);
        return "tours/myTours";
    }

    private void setTourBuyAttrs(Model model, String message) {
        model.addAttribute("message", message);
        setModelAttrs(model);
        UsernameDto user = userService.getUsernameResponse(SecurityContextHolder.getContext().getAuthentication());
        if (user != null ) {
            model.addAttribute("profile", userService.getProfile(user.getId().toString()));
        }
    }

    @PostMapping("/book-tour")
    public String bookTour(@RequestParam("userId") String userId,
                          @RequestParam("tourId") String tourId,
                          @RequestParam("seats") Integer seats, Model model) throws ParseException {
        String message = tourService.bookTour(userId, tourId, seats);
        setTourBuyAttrs(model, message);
        model.addAttribute("tour", tourService.getTourById(tourId));
        return "tours/tour";
    }

    private void addTempMessage(Model model) {
        if (!tempMessage.equals("")) {
            model.addAttribute("message", tempMessage);
            tempMessage = "";
        }
    }

    @GetMapping("/my-book-tours")
    public String myBookTours(Model model) {
        setModelAttrs(model);
        UsernameDto user = userService.getUsernameResponse(SecurityContextHolder.getContext().getAuthentication());
        if (user != null ) {
            model.addAttribute("profile", userService.getProfile(user.getId().toString()));
            model.addAttribute("tours", tourService.getUserBookTours(user.getId()));
        }
        model.addAttribute("title", "Booked tours");
        addTempMessage(model);
        return "tours/myTours";
    }

    @PostMapping("/pay")
    public String payTour(@RequestParam("userId") String userId,
                          @RequestParam("cardId") String cardId,
                          @RequestParam("tourId") String usersTourId, Model model) {

        String message = tourService.payTour(userId, cardId, usersTourId);
        tempMessage = message;
        if (!message.equals("Operation done successfully!")) {
            return "redirect:/my-book-tours";
        } else {
            return "redirect:/my-tours";
        }
    }

    @PostMapping("/revoke")
    public String revokeBooking(@RequestParam("userId") String id,
                                @RequestParam("tourId") String usersTourId, Model model) {
        tourService.revokeBooking(id, usersTourId);
        tempMessage = "Operation done successfully";
        return "redirect:/my-book-tours";
    }

    @GetMapping("/bought")
    @PreAuthorize("hasRole('ADMIN')")
    public String boughtPage(Model model) {
        setModelAttrs(model);
        model.addAttribute("tours", usersTourService.getBoughtTours());
        model.addAttribute("title", "purchased");
        return "tours/adminTourList";
    }

    @GetMapping("/booked")
    @PreAuthorize("hasRole('ADMIN')")
    public String bookedPage(Model model) {
        setModelAttrs(model);
        model.addAttribute("tours", tourService.getBookedTours());
        model.addAttribute("title", "booked");
        return "tours/adminTourList";
    }

    @GetMapping("/test/{number}")
    public String testPage(@PathVariable("number") Integer number, Model model) {
        setModelAttrs(model);
        questionService.setQuestion(number, model);
        return "test/test";
    }

    @PostMapping("/test")
    public String getAnswer(@Valid Question question, Model model) {
        questionService.addAnswer(question);
        if (question.getNumber() < 10) {
            return "redirect:/test/" + (question.getNumber() + 1);
        } else {
            return "redirect:/test-result/" + questionService.getResult();
        }
    }

    @GetMapping("/test-result/{index}")
    public String testResult(@PathVariable("index") Integer index, Model model) {
        setModelAttrs(model);
        model.addAttribute("type", TourType.values()[index]);
        model.addAttribute("index", index);
        return "test/testResult";
    }

    @GetMapping("/test-result/list/{index}")
    public String testResultList(@PathVariable("index") String index, Model model) {
        setModelAttrs(model);
        model.addAttribute("type", TourType.values()[Integer.parseInt(index)]);
        model.addAttribute("tours", tourService.getToursByType(Integer.parseInt(index)));
        return "test/testResultList";
    }

    @PostMapping("/find")
    public String find(@RequestParam("transport") String[] transport,
                       @RequestParam("type") String[] type,
                       @RequestParam("food") String[] food,
                       @RequestParam("minPrice") String minPrice,
                       @RequestParam("maxPrice") String maxPrice,
                       @RequestParam("minSeats") String minSeats,
                       @RequestParam("maxSeats") String maxSeats,
                       @RequestParam("minDate") String minDate,
                       @RequestParam("maxDate") String maxDate) throws ParseException {

        searchedTours = tourService.search(transport, type, food, minPrice, maxPrice, minSeats, maxSeats, minDate,
                maxDate);
        finded = true;
        return "redirect:/";
    }

    @GetMapping("/reset-find")
    public String resetFind() {
        tourService.setSearchValues();
        finded = false;
        searchedTours = null;
        return "redirect:/";
    }

    private void sortByPrice() {
        if (searchedTours != null && finded) {
            searchedTours = tourService.sortLowPrice(searchedTours);
        } else {
            searchedTours = tourService.sortLowPrice(tourService.getTours());
        }
        finded = true;
    }

    @GetMapping("/sort/low-price")
    public String sortLowPrice() {
        sortByPrice();
        return "redirect:/";
    }

    @GetMapping("/sort/high-price")
    public String sortHighPrice() {
        sortByPrice();
        Collections.reverse(searchedTours);
        return "redirect:/";
    }

}
