package com.bit.spring.model;

import lombok.Data;

@Data
public class CartDTO {
    private int id;
    private int userId;
    private int goodsId;
    private int count;
    private int price;
    private String image;

}
