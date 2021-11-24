package com.example.tours.controller;

import com.example.tours.dto.request.RegisterDto;
import com.example.tours.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String index(Model model) {
        userService.setUserToModel(model);
        return "home";
    }

    @GetMapping("/home")
    public String home(Model model) {
        userService.setUserToModel(model);
        return "home";
    }

    @GetMapping("/login")
    public String loginPage(HttpServletRequest request, Model model) {
        if (userService.getCurrentUser(SecurityContextHolder.getContext().getAuthentication()) != null) {
            return "redirect:/home";
        }
        userService.getLoginMessage(request, model);
        return "login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return userService.getCurrentUser(SecurityContextHolder.getContext().getAuthentication()) == null?
                "register":"redirect:/home";
    }

    @PostMapping("/register")
    public String register(@Valid RegisterDto registerDto, Model model) {
        return userService.registerResult(registerDto, model);
    }

    @GetMapping("/admin")
    @PreAuthorize("hasRole('ADMIN')")
    public String adminPage(Model model) {
        userService.setUserToModel(model);
        userService.setUserList(model);
        return "admin";
    }

    @GetMapping("/profile/{userId}")
    public String profilePage(@PathVariable String userId, Model model) {
        userService.setUserToModel(model);
        userService.setProfile(model, userId);
        return "profile/profile";
    }

    @PostMapping("/delete/{userId}")
    public String deleteUser(@PathVariable String userId, HttpServletRequest request, HttpServletResponse response,
                             Model model) {
        userService.deleteUser(request, response, SecurityContextHolder.getContext().getAuthentication(), userId);
        userService.setUserToModel(model);
        model.addAttribute("operationMessage", "User successfully deleted!");
        return "operationMessage";
    }

    @PostMapping("/lock/{userId}")
    public String lockUser(@PathVariable String userId, @RequestParam("option") String option,
                           HttpServletRequest request, HttpServletResponse response, Model model) {
        userService.lockUser(request, response, SecurityContextHolder.getContext().getAuthentication(), userId, option);
        userService.setUserToModel(model);
        userService.setProfile(model, userId);
        return "profile/profile";
    }

    @PostMapping("/changeRole/{userId}")
    public String changeRole(@PathVariable String userId, Model model) {
        userService.makeAdmin(userId, "");
        userService.setUserToModel(model);
        userService.setProfile(model, userId);
        return "profile/profile";
    }

    @PostMapping("/admin")
    public String changeUsers(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam("action") String action,
                              @RequestParam("checkbox") String[] checked,
                              Model model) {
        userService.changeUserList(request, response, action, checked,
                SecurityContextHolder.getContext().getAuthentication(), model);

        return userService.isAdmin(userService.getCurrentUser(SecurityContextHolder.getContext().getAuthentication())
                .getRoles())?"admin":"home";
    }

    @GetMapping("/activate/{userId}/{code}")
    public String activate(@PathVariable("userId") String userId,
                           @PathVariable("code") String code,
                           Model model) {
        if (userService.activateUser(userId, code)) {
            model.addAttribute("message", "Activation done successfully!");
        } else {
            model.addAttribute("message", "Incorrect activation code!");
        }
        return "activate";
    }

    @PostMapping("/file-upload-user")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file,
                         @RequestParam("userId") String userId) throws IOException {
        userService.saveImage(file, userId);
        return userId;
    }

    @PostMapping("/delete-user-image")
    public String deleteImg(@RequestParam("userId") String userId) throws IOException {
        userService.deleteOldImage(userService.getUserById(userId));
        return "redirect:/profile/" + userId;
    }

}
