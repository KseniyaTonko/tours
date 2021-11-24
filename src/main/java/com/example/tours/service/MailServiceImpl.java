package com.example.tours.service;

import com.example.tours.dto.Mail;
import com.example.tours.service.interfaces.MailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;

@Slf4j
@Component
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String username;

    @Override
    public void sendActiveMail(@NotNull Mail mail) {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(username);
        message.setTo(mail.getEmailTo());
        message.setSubject(mail.getTopic());
        message.setText(mail.getMailContent());

        javaMailSender.send(message);
    }

}

