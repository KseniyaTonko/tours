package com.example.tours.service;

import com.example.tours.dto.request.CardDto;
import com.example.tours.model.Card;
import com.example.tours.model.User;
import com.example.tours.repository.CardRepository;
import org.springframework.beans.CachedIntrospectionResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private UserService userService;

    public void addCard(CardDto dto, String userId) {
        Card card = new Card(dto.getName(), dto.getNumber(), dto.getMonth(), dto.getYear(), dto.getCcv(),
                dto.getManName());
        card.setMoney((float)0);
        User user = userService.getUserById(userId);
        user.getCards().add(card);
        cardRepository.save(card);
        userService.saveUser(user);
    }

    public List<Card> getAll() {
        return cardRepository.findAllByOrderByNameAsc();
    }

    public void deleteCard(String cardId, String userId) {
        User user = userService.getUserById(userId);
        Card card = cardRepository.findById(Integer.parseInt(cardId));
        user.getCards().remove(card);
        userService.saveUser(user);
    }

    public void addMoney(String cardId, String userId, Float money) {
        Card card = cardRepository.findById(Integer.parseInt(cardId));
        card.setMoney(card.getMoney() + money);
        cardRepository.save(card);
    }

    public Card getCardById(String id) {
        return cardRepository.findById(Integer.parseInt(id));
    }

    public void saveCard(Card card) {
        cardRepository.save(card);
    }
}
