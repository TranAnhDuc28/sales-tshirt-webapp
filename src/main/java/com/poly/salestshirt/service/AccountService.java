package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.Account;

public interface AccountService {

    Account getByUsername(String username);
}
