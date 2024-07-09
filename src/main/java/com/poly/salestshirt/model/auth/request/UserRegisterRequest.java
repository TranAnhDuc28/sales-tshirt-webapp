package com.poly.salestshirt.model.auth.request;

import com.poly.salestshirt.model.request.KhachHangRequest;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class UserRegisterRequest {

    private KhachHangRequest khachHangRequest;

    private AccountRequest accountRequest;
}
