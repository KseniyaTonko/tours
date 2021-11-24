package com.example.tours.service;

import com.example.tours.model.Role;
import com.example.tours.model.enums.ERole;
import com.example.tours.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {

    @Autowired
    private RoleRepository roleRepository;

    private void getRoles() {
        roleRepository.save(new Role(ERole.ROLE_USER));
        roleRepository.save(new Role(ERole.ROLE_ADMIN));
    }

    public void initRoles() {
        if (((List<Role>) roleRepository.findAll()).size() == 0) {
            getRoles();
        }
    }

}
