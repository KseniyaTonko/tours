package com.example.tours.controller;


import com.example.tours.dto.request.ContactDto;
import com.example.tours.model.Contact;
import com.example.tours.model.enums.Operator;
import com.example.tours.service.ContactService;
import com.example.tours.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;

@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @Autowired
    private UserService userService;

    private void setModelAttrs(Model model) {
        model.addAttribute("user", userService.getUsernameResponse(
                SecurityContextHolder.getContext().getAuthentication()));
        model.addAttribute("contacts", contactService.getContacts());
        model.addAttribute("operators", Operator.values());
    }

    @GetMapping("/contacts")
    public String contactsPage(Model model) {
        setModelAttrs(model);
        return "contacts/contacts";
    }

    @GetMapping("/add-contact")
    public String addContactForm() {
        return "contacts/addContactForm";
    }

    @PostMapping("/add-contact")
    public String addContact(@Valid ContactDto contactDto, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            contactService.addContact(contactDto);
        }
        return "redirect:/contacts";
    }

    @PostMapping("/delete-contact")
    public String deleteContact(@RequestParam("contactId") String contactId) {
        contactService.deleteContact(contactId);
        return "redirect:/contacts";
    }

    @GetMapping("/edit-contact")
    public String editContactPage(@RequestParam("contactId") String contactId, Model model) {
        setModelAttrs(model);
        model.addAttribute("contact", contactService.getContactById(contactId));
        return "contacts/editContactForm";
    }

    @PostMapping("/edit-contact")
    public String editContact(@Valid Contact contact, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            contactService.editContact(contact);
        }
        return "redirect:/contacts";
    }

    @PostMapping("/file-upload-contact")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file,
                         @RequestParam("contactId") String contactId, Model model) throws IOException {
        contactService.saveImage(file, contactId);
        return "";
    }

    @PostMapping("/delete-contact-image")
    public String deleteImg(@RequestParam("contactId") String contactId, Model model) throws IOException {
        contactService.deleteOldImage(contactService.getContactById(contactId));
        setModelAttrs(model);
        model.addAttribute("contact", contactService.getContactById(contactId));
        return "contacts/editContactForm";
    }

}
