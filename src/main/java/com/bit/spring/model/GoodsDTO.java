package com.bit.spring.model;

import lombok.Data;

@Data
public class GoodsDTO {
    private int id;
    private String name;
    private String category;
    private String stock;
    private String image;
    private int userId;
    private int price;

    private String explanation;
}
