package com.poly.salestshirt.service;

import com.poly.salestshirt.dto.response.StaffResponse;

public interface SalesService {
    String addProductToCart(Integer orderId, Integer detailProductId, int quantity);
    String plusAndMinusProductInCart(String action, Integer orderId, Integer productDetailId);
    double getTotalBill(Integer orderId);
    void removeProductFromCart(Integer orderId, Integer detailProductId);
    String pay(Integer orderId);
    StaffResponse getSalesStaff();
}
