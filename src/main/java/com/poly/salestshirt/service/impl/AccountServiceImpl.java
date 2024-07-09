package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Account;
import com.poly.salestshirt.repository.AccountRepository;
import com.poly.salestshirt.service.AccountService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService {

    private final AccountRepository accountRepository;

    @Override
    public Account getByUsername(String username) {
        return accountRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Username not found"));
    }
}
