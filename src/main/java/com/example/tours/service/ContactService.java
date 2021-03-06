package com.example.tours.service;

import com.cloudinary.utils.ObjectUtils;
import com.example.tours.dto.request.ContactDto;
import com.example.tours.model.Contact;
import com.example.tours.model.Hotel;
import com.example.tours.model.Image;
import com.example.tours.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class ContactService {

    @Autowired
    private ContactRepository contactRepository;

    @Autowired
    private ImageService imageService;

    public Iterable<Contact> getContacts() {
        return contactRepository.findAllByOrderByIdDesc();
    }

    public void addContact(ContactDto contactDto) {
        Contact contact = new Contact(contactDto.getFirstName(), contactDto.getLastName(), contactDto.getMiddleName(),
                contactDto.getPhone(), contactDto.getMobileOperator(), contactDto.getEmail());
        contactRepository.save(contact);
    }

    public void deleteContact(String id) {
        Contact contact = contactRepository.findById(Integer.parseInt(id));
        if (contact != null) {
            contactRepository.delete(contact);
        }
    }

    public Contact getContactById(String id) {
        return contactRepository.findById(Integer.parseInt(id));
    }

    public void editContact(Contact contact) {
        Contact oldContact = contactRepository.findById((int) contact.getId());
        oldContact.setPhone(contact.getPhone());
        oldContact.setMobileOperator(contact.getMobileOperator());
        oldContact.setEmail(contact.getEmail());
        oldContact.setMiddleName(contact.getMiddleName());
        oldContact.setLastName(contact.getLastName());
        oldContact.setFirstName(contact.getFirstName());
        contactRepository.save(oldContact);
    }

    // upload image

    public void deleteOldImage(Contact contact) throws IOException {
        if (contact.getImage() != null) {
            imageService.cloudinary.uploader().destroy(contact.getImage().getImagePublicId(), ObjectUtils.emptyMap());
            Image image = contact.getImage();
            contact.setImage(null);
            contactRepository.save(contact);
            imageService.removeImage(image.getId());
        }
        contactRepository.save(contact);
    }

    public void saveImage(MultipartFile file, String id) throws IOException {
        Map uploadResult = imageService.cloudinary.uploader().upload(imageService.getFile(file), ObjectUtils.emptyMap());
        Contact contact = contactRepository.findById(Integer.parseInt(id));
        deleteOldImage(contact);
        Image image = new Image(uploadResult.get("secure_url").toString(), uploadResult.get("public_id").toString());
        contact.setImage(image);
        contactRepository.save(contact);
    }

    // -----------


}
