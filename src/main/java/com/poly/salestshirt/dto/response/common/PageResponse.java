package com.poly.salestshirt.dto.response.common;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class PageResponse<T> {
    private int pageNo;
    private int pageSize;
    private long totalPages;
    private boolean first;
    private boolean last;
    private T items;
}
