package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.MauSac;
import com.poly.salestshirt.model.request.MauSacRequest;
import com.poly.salestshirt.model.response.MauSacReponse;
import com.poly.salestshirt.model.response.common.PageResponse;

import java.util.List;

public interface MauSacService {

    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai);

    String create(MauSacRequest request);

    String update(int msId, MauSacRequest request);

    boolean changeStatus(int msId, int status);

    MauSacReponse getMauSacResponse(int msId);

    MauSac getMauSacById(int msId);

    List<MauSacReponse> getAllByTrangThai(int trangThai);
}
