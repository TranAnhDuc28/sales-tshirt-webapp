package com.poly.salestshirt.dto.auth.response;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AuthenticationResponse {

    private String token;
}
