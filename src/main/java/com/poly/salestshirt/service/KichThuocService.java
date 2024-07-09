package com.poly.salestshirt.service;

import com.poly.salestshirt.entity.KichThuoc;
import com.poly.salestshirt.model.request.KichThuocRequest;
import com.poly.salestshirt.model.response.KichThuocReponse;
import com.poly.salestshirt.model.response.common.PageResponse;

import java.util.List;

public interface KichThuocService {

    PageResponse<?> getAllByStatusAndSearch(int pageNo, int pageSize, String keyword, Integer trangThai);

    String create(KichThuocRequest request);

    String update(int ktId, KichThuocRequest request);

    boolean changeStatus(int ktId, int status);

    KichThuocReponse getKichThuocReponse(int ktId);

    KichThuoc getKichThuocById(int ktId);

    List<KichThuocReponse> getAllByTrangThai(int trangThai);
}
