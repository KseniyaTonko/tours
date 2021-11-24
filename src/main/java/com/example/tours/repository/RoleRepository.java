package com.example.tours.repository;

import com.example.tours.model.Role;
import com.example.tours.model.enums.ERole;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends CrudRepository<Role, Integer> {

    Role findByName(ERole name);

}
