package com.finops360.finops360_backend.repository;

import com.finops360.finops360_backend.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

}
