package com.example.tours.service;

import com.cloudinary.utils.ObjectUtils;
import com.example.tours.dto.Mail;
import com.example.tours.dto.request.RegisterDto;
import com.example.tours.dto.response.ProfileDto;
import com.example.tours.dto.response.UsernameDto;
import com.example.tours.model.Contact;
import com.example.tours.model.Image;
import com.example.tours.model.Role;
import com.example.tours.model.User;
import com.example.tours.model.enums.ERole;
import com.example.tours.model.enums.Status;
import com.example.tours.repository.RoleRepository;
import com.example.tours.repository.UserRepository;
import com.example.tours.service.interfaces.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private MailService mailService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    private RoleService roleService;

    //---------------------------------------------------

    public User getUserById(String id) {
        return userRepository.findById(Integer.parseInt(id));
    }

    //---------------------------------------------------

    public void setUserToModel(Model model) {
        model.addAttribute("user", getUsernameResponse(SecurityContextHolder.getContext().getAuthentication()));
    }

    //---------------------------------------------------

    public User findUser(Authentication auth) {
        return userRepository.findByEmail(auth.getName());
    }

    // get authenticated user
    public User getCurrentUser(Authentication auth) {
        if (!(auth instanceof AnonymousAuthenticationToken) && auth != null) {
            return findUser(auth);
        }
        return null;
    }

    public boolean isAdmin(Set<Role> roles) {
        return roles.contains(roleRepository.findByName(ERole.ROLE_ADMIN));
    }

    // if authenticated user exists then get it username & email
    public UsernameDto getUsernameResponse(Authentication auth) {
        User u = getCurrentUser(auth);
        if (u != null) {
            return new UsernameDto(u.getId(), u.getUsername(), u.getEmail(), u.getRoles(), isAdmin(u.getRoles()));
        }
        return null;
    }

    //---------------------------------------------------

    private void findLoginException(HttpSession se, Model model) {
        AuthenticationException ex = (AuthenticationException) se.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        if (ex != null) {
            model.addAttribute("message", ex.getMessage());
        }
    }

    public void getLoginMessage(HttpServletRequest request, Model model) {
        HttpSession se = request.getSession(false);
        if (se != null) {
            findLoginException(se, model);
        }
    }

    //---------------------------------------------------

    private boolean passwordsMatch(RegisterDto registerDto, Model model) {
        if (!registerDto.getPassword().equals(registerDto.getPasswordConfirm())) {
            model.addAttribute("message", "Passwords doesn't match!");
            return true;
        }
        return false;
    }

    private boolean checkUserExisting(RegisterDto registerDto, Model model) {
        if (userRepository.findByEmail(registerDto.getEmail()) != null) {
            model.addAttribute("message", "User with this email already exists!");
            return true;
        }
        return false;
    }

    private boolean registerMessageExists(RegisterDto registerDto, Model model) {
       if (!checkUserExisting(registerDto, model)) {
           return passwordsMatch(registerDto, model);
       }
       return true;
    }


    private Set<Role> getRegisterUserRoles(boolean admin) {
        roleService.initRoles();
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.findByName(ERole.ROLE_USER));
        if (admin) roles.add(roleRepository.findByName(ERole.ROLE_ADMIN));
        return roles;
    }

    // if there's some message then registration cannot be done
    public String registerResult(RegisterDto req, Model model) {
        if (registerMessageExists(req, model)) return "register";

        User user = new User(req.getUsername(), req.getEmail(), req.getFirstName(), req.getLastName(),
                req.getMiddleName(), req.getPhone(), encoder().encode(req.getPassword()),
                getRegisterUserRoles(req.getEmail().equals("kseniya.tonko@gmail.com")));
        user.setActivationCode(UUID.randomUUID().toString());

        userRepository.save(user);

        mailService.sendActiveMail(new Mail(user.getEmail(), "Account activation", "Link to activate " +
                "your account: https://spring-tours.herokuapp.com/activate/" + user.getId() + "/" + user.getActivationCode()));

        return "follow_link";
    }

    public void setUserList(Model model) {
        model.addAttribute("users", userRepository.findAllByOrderByIdAsc());
    }


    public void setProfile(Model model, String userId) {
        model.addAttribute("profile", getProfile(userId));
    }

    public ProfileDto getProfile(String userId) {
        User u = userRepository.findById(Integer.parseInt(userId));
        ProfileDto profileDto = new ProfileDto(u.getUsername(), u.getFirstName(), u.getLastName(), u.getMiddleName(),
                u.getPhone(), u.getEmail(), u.getId(), isAdmin(u.getRoles()), u.getStatus(), u.getCards());
        profileDto.setImage(u.getImage()!=null?u.getImage().getImage():null);
        return profileDto;
    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response, Authentication auth, String id) {
        logoutUser(auth, id, request, response);
        if (userRepository.findById(Integer.parseInt(id)) != null) {
            userRepository.deleteById(Integer.parseInt(id));
        }
    }

    private void logoutUser(Authentication auth, String id, HttpServletRequest request, HttpServletResponse response) {
        if (getCurrentUser(auth).getId() == Integer.parseInt(id)) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
    }

    private void changeStatus(User user, Status status) {
        user.setStatus(status);
        userRepository.save(user);
    }

    public void lockUser(HttpServletRequest request, HttpServletResponse response, Authentication auth, String id,
                         String option) {
        if (option.equals("0")) {
            logoutUser(auth, id, request, response);
        }
        changeStatus(userRepository.findById(Integer.parseInt(id)), Status.values()[Integer.parseInt(option)]);
    }

    //-------------------------------------
    //admin table functions


    private void deleteUsers(HttpServletRequest request, HttpServletResponse response,
                             String[] checked, Authentication auth) {
        for (String item: checked) {
            deleteUser(request, response, auth, item);
        }
    }

    private void lockUsers(HttpServletRequest request, HttpServletResponse response,
                             String[] checked, Authentication auth, String option) {
        for (String item: checked) {
            lockUser(request, response, auth, item, option);
        }
    }

    private void deleteAction(HttpServletRequest request, HttpServletResponse response,
                                String action, String[] checked, Authentication auth) {
        if (!action.equals("delete")) return;
        deleteUsers(request, response, checked, auth);
    }

    private void lockAction(HttpServletRequest request, HttpServletResponse response,
                              String action, String[] checked, Authentication auth) {
        if (action.equals("block")) {
            lockUsers(request, response, checked, auth, "0");
        } else if (action.equals("unblock")) {
            lockUsers(request, response, checked, auth, "1");
        }
    }

    private void makeAdminAction(HttpServletRequest request, HttpServletResponse response,
                                 String action, String[] checked, Authentication auth) {
        if (action.equals("admin") || action.equals("not admin")) {
            for (String id: checked) {
                makeAdmin(id, action);
            }
        }
    }


    private void changeActions(HttpServletRequest request, HttpServletResponse response,
                               String action, String[] checked, Authentication auth) {
        deleteAction(request, response, action, checked, auth);
        lockAction(request, response, action, checked, auth);
        makeAdminAction(request, response, action, checked, auth);
    }

    public void changeUserList(HttpServletRequest request, HttpServletResponse response,
                               String action, String[] checked, Authentication auth, Model model) {
        changeActions(request, response, action, checked, auth);
        setUserToModel(model);
        setUserList(model);
    }

    //------------------------------

    private void addOrRemoveAdmin(User user, String option, Role role) {
        if ((user.getRoles().contains(role) && !option.equals("admin")) || option.equals("not admin")) {
            user.getRoles().remove(role);
        } else if (option.equals("admin") || !user.getRoles().contains(role)){
            user.getRoles().add(role);
        }
    }

    public void makeAdmin(String id, String option) {
        if (userRepository.findById(Integer.parseInt(id)) != null) {
            User user = userRepository.findById(Integer.parseInt(id));
            addOrRemoveAdmin(user, option, roleRepository.findByName(ERole.ROLE_ADMIN));
            userRepository.save(user);
            changeAuthorities(getCurrentUser(SecurityContextHolder.getContext().getAuthentication()));
        }
    }

    private Set<GrantedAuthority> getAuthorities(User user) {
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for (Role role: user.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(String.valueOf(role.getName())));
        }
        return grantedAuthorities;
    }

    private void changeAuthorities(User user) {
        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(
                        SecurityContextHolder.getContext().getAuthentication().getPrincipal(),
                        SecurityContextHolder.getContext().getAuthentication().getCredentials(),
                        getAuthorities(user)));
    }

    public boolean activateUser(String userId, String code) {
        User user = userRepository.findById(Integer.parseInt(userId));

        if (user.getActivationCode() != null && user.getActivationCode().equals(code)) {
            user.setActivationCode(null);
            userRepository.save(user);
            return true;
        } else {
            return false;
        }
    }

    // upload image

    public void deleteOldImage(User user) throws IOException {
        if (user.getImage() != null) {
            imageService.cloudinary.uploader().destroy(user.getImage().getImagePublicId(), ObjectUtils.emptyMap());
            Image image = user.getImage();
            user.setImage(null);
            userRepository.save(user);
            imageService.removeImage(image.getId());
        }
        userRepository.save(user);
    }

    public void saveImage(MultipartFile file, String id) throws IOException {
        Map uploadResult = imageService.cloudinary.uploader().upload(imageService.getFile(file), ObjectUtils.emptyMap());
        User user = userRepository.findById(Integer.parseInt(id));
        deleteOldImage(user);
        Image image = new Image(uploadResult.get("secure_url").toString(), uploadResult.get("public_id").toString());
        user.setImage(image);
        userRepository.save(user);
    }

    // ----------- edit profile:

    private boolean passwordCorrect(String password, String realPassword) {
        return encoder().matches(password, realPassword);
    }

    public String editPhone(String phone, String password, String id) {
        User user = userRepository.findById(Integer.parseInt(id));
        if (!passwordCorrect(password, user.getPassword())) {
            return "Incorrect password!";
        }
        user.setPhone(phone);
        userRepository.save(user);
        return "Phone successfully changed!";
    }

    public String editNames(String username, String firstName, String lastName, String middleName, String password, String id) {
        User user = userRepository.findById(Integer.parseInt(id));
        if (!passwordCorrect(password, user.getPassword())) {
            return "Incorrect password!";
        }
        user.setUsername(username);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setMiddleName(middleName);
        userRepository.save(user);
        return "Name successfully changed!";
    }

    public String editPassword(String oldPassword, String newPassword, String confirmNewPassword, String id) {
        User user = userRepository.findById(Integer.parseInt(id));
        if (!passwordCorrect(oldPassword, user.getPassword())) {
            return "Incorrect current password!";
        }
        if (!newPassword.equals(confirmNewPassword)) {
            return "New passwords doesn't match!";
        }
        user.setPassword(encoder().encode(newPassword));
        userRepository.save(user);
        return "Password successfully changed!";
    }

    public String editEmail(String email, String password, String id) {
        User user = userRepository.findById(Integer.parseInt(id));
        if (!passwordCorrect(password, user.getPassword())) {
            return "Incorrect current password!";
        }
        user.setNewEmail(email);
        user.setActivationCode(UUID.randomUUID().toString());
        userRepository.save(user);

        mailService.sendActiveMail(new Mail(email, "Confirm new email", "Link to confirm " +
                "your email: https://spring-tours.herokuapp.com/confirm/" + user.getId() + "/" + user.getActivationCode()));

        return "We sent a link to your new email to confirm it!";
    }

    public String confirmNewEmail(String id, String code) {
        if (userRepository.findById(Integer.parseInt(id)) == null) {
            return "No such user!";
        }
        User user = userRepository.findById(Integer.parseInt(id));
        if (!user.getActivationCode().equals(code)) {
            return "Incorrect confirmation code!";
        }
        if (user.getNewEmail() == null) {
            return "Email already confirmed!";
        }
        user.setActivationCode(null);
        user.setEmail(user.getNewEmail());
        user.setNewEmail(null);
        userRepository.save(user);
        return "Email successfully changed!";
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }
}
