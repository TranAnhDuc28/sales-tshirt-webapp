package com.poly.salestshirt.model.request;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Builder
public class SanPhamChiTietRequest {

    @NotBlank(message = "Vui lòng nhập mã sản phẩm.")
    @Size(min = 3, max = 10, message = "Mã phải có 3 đến 10 ký tự.")
    private String maSPCT;

    private Integer idSanPham;

    private Integer idKichThuoc;

    private Integer idMauSac;

    @NotNull(message = "Vui lòng nhập số lượng.")
    @Min(value = 1, message = "Số lượng phải lớn hơn 0.")
    private Integer soLuong;

    @NotNull(message = "Vui lòng nhập đơn giá.")
    @Min(value = 0, message = "Đơn giá phải lớn hơn hoặc bằng 0.")
    @Digits(integer = 10, fraction = 2, message = "Đơn giá không hợp lệ.")
    private Double donGia;

    private Integer trangThai;
}
