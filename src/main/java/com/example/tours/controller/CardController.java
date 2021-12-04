package com.example.tours.controller;

import com.example.tours.dto.request.CardDto;
import com.example.tours.service.CardService;
import com.example.tours.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class CardController {

    @Autowired
    private CardService cardService;

    @Autowired
    private UserService userService;

    @GetMapping("/add-card")
    public String addCardPage(Model model) {
        userService.setUserToModel(model);
        return "card/addCard";
    }

    @PostMapping("/add-card")
    public String addCard(@Valid CardDto dto, @RequestParam("userId") String userId) {
        cardService.addCard(dto, userId);
        return "redirect:/cards";
    }

    @GetMapping("/cards")
    public String cards(Model model) {
        userService.setUserToModel(model);
        model.addAttribute("cards", cardService.getAll());
        return "card/cards";
    }

    @PostMapping("/delete-card")
    public String deleteCard(@RequestParam("cardId") String cardId,
                             @RequestParam("userId") String userId) {
        cardService.deleteCard(cardId, userId);
        return "redirect:/cards";
    }

    @PostMapping("/add-money")
    public String addMoney(@RequestParam("cardId") String cardId,
                           @RequestParam("userId") String userId,
                           @RequestParam("money") Float money) {
        cardService.addMoney(cardId, userId, money);
        return "redirect:/cards";
    }

}
