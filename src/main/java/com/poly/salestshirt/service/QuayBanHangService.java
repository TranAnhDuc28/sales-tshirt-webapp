package com.poly.salestshirt.service;

import com.poly.salestshirt.model.response.NhanVienReponse;

public interface QuayBanHangService {

    String addProductToCart(Integer idHoaDon, Integer idSPCT, int soLuong);

    String plusAndMinusProductInCart(String action, Integer idHoaDon, Integer idSPCT);

    double getTongTienHoaDon(Integer idHoaDon);

    String removeProductFromCart(Integer idHoaDon, Integer idSPCT);

    String thanhToan(Integer idHoaDon);

    NhanVienReponse getNhanVienBanHang();
}
