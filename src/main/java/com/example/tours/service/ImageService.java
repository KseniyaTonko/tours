package com.example.tours.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.tours.model.Image;
import com.example.tours.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Objects;

@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dwfvcpiak",
            "api_key", "544579893856949",
            "api_secret", "rp-PqRNUOUcVrRhR711bQElaKAw"));


    private void writeFile(File convFile, MultipartFile file) throws IOException {
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
    }

    public File getFile(MultipartFile file) throws IOException {
        File convFile = new File(Objects.requireNonNull(file.getOriginalFilename()));
        convFile.createNewFile();
        writeFile(convFile, file);
        return convFile;
    }

    public Image getById(String id) {
        return imageRepository.findById(Integer.parseInt(id));
    }

    public void removeImage(Integer id) {
        imageRepository.deleteById(id);
    }

    public void saveImage(Image image) {
        imageRepository.save(image);
    }
}
