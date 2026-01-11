package com.url.shortner.dto;

import java.time.LocalDate;

public class ClickEventDto {
    private LocalDate clickDate;
    private Long count;

    public ClickEventDto(LocalDate clickDate, Long count) {
        this.clickDate = clickDate;
        this.count = count;
    }

    public ClickEventDto() {
    }

    public LocalDate getClickDate() {
        return clickDate;
    }

    public void setClickDate(LocalDate clickDate) {
        this.clickDate = clickDate;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}
