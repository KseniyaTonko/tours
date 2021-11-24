package com.example.tours.dto.response;

import com.example.tours.model.Role;
import lombok.Data;

import java.util.Set;

@Data
public class UsernameDto {

    private Integer id;

    private String username;

    private String email;

    private Set<Role> roles;

    private Boolean isAdmin;

    public UsernameDto(Integer id, String username, String email, Set<Role> roles, Boolean isAdmin) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.roles = roles;
        this.isAdmin = isAdmin;
    }

}
