package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.NhanVien;
import com.poly.salestshirt.model.request.NhanVienRequest;
import com.poly.salestshirt.model.response.NhanVienReponse;
import com.poly.salestshirt.model.response.common.PageResponse;

import java.util.List;

public interface NhanVienService {

    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai);

    String create(NhanVienRequest request);

    String update(int nvId, NhanVienRequest request);

    boolean changeStatus(int nvId, int status);

    NhanVienReponse getNhanVienReponseById(int nvId);

    NhanVienReponse getNhanVienReponseByAccountId(int accountId);

    NhanVien getNhanVienById(int nvId);

    List<NhanVienReponse> getAllByTrangThai(int trangThai);
}
