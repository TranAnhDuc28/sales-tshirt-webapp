package com.poly.salestshirt.service.impl;

import com.poly.salestshirt.entity.Account;
import com.poly.salestshirt.entity.CustomUserDetails;
import com.poly.salestshirt.service.AccountService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailService implements UserDetailsService {

    private final AccountService accountService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountService.getByUsername(username);
        return new CustomUserDetails(account);
    }
}
