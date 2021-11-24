package com.example.tours.service.interfaces;


import com.example.tours.dto.Mail;

import javax.validation.constraints.NotNull;

public interface MailService {

    void sendActiveMail(@NotNull Mail mail);

}
