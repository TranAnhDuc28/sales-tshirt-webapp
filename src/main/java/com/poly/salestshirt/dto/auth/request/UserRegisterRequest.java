package com.poly.salestshirt.dto.auth.request;

import com.poly.salestshirt.dto.request.CustomerRequest;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class UserRegisterRequest {

    private CustomerRequest customerRequest;
    private AccountRequest accountRequest;
}
