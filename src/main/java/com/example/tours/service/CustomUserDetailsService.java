package com.example.tours.service;

import com.example.tours.model.Role;
import com.example.tours.model.User;
import com.example.tours.model.enums.Status;
import com.example.tours.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    private void checkUserExisting(User user) {
        if (user == null) {
            throw new BadCredentialsException("User not found!");
        }
    }

    private void checkUserStatus(User user) {
        if (user.getStatus() == Status.BLOCKED) {
            throw new BadCredentialsException("User is blocked!");
        }
    }

    private void checkUserActivation(User user) {
        if (user.getActivationCode() != null) {
            throw new BadCredentialsException("Account is not activated!");
        }
    }

    private void getException(User user) {
        checkUserExisting(user);
        checkUserStatus(user);
        checkUserActivation(user);
    }

    private Set<GrantedAuthority> getAuthorities(User user) {
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for (Role role: user.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(String.valueOf(role.getName())));
        }
        return grantedAuthorities;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email);

        getException(user);

        return new org.springframework.security.core.userdetails.User(
                user.getEmail(), user.getPassword(), getAuthorities(user));
    }
}