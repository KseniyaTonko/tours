package com.example.tours.service;

import com.example.tours.dto.request.Question;
import com.example.tours.model.Tour;
import com.example.tours.model.enums.TourType;
import com.example.tours.repository.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
public class QuestionService {

    private final List<Question> questions = new ArrayList<>();


    public void setQuestion(Integer number, Model model) {
        model.addAttribute("number", number);
        model.addAttribute("answer1", "Answer1" + number.toString());
        model.addAttribute("answer2", "Answer2");
        model.addAttribute("answer3", "Answer3");
        model.addAttribute("answer4", "Answer4");
        model.addAttribute("answer5", "Answer5");
        model.addAttribute("answer6", "Answer6");
    }


    public void addAnswer(Question question) {
        if (questions.size() < question.getNumber()) {
            questions.add(question);
        } else {
            questions.set(question.getNumber() - 1, question);
        }
    }

    public int getResult() {
        int sum = 0;
        for (Question question: questions) {
            sum += Integer.parseInt(question.getAnswer());
        }
        if (sum < 17) {
            return 0;
        }
        if (sum < 25) {
            return 1;
        }
        if (sum < 35) {
            return 2;
        }
        if (sum < 43) {
            return 3;
        }
        if (sum < 52) {
            return 4;
        }
        return 5;
    }
}
