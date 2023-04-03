package com.bit.spring.service;

import com.bit.spring.model.CartDTO;
import com.bit.spring.model.GoodsDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CartService {
    private final String NAMESPACE = "mapper.cartMapper";
    private SqlSession session;
    @Autowired
    public CartService(SqlSession session) {this.session = session;}

    public void insert(CartDTO cartDTO) {
        session.insert(NAMESPACE + ".insert", cartDTO);
    }

    public List<CartDTO> selectAll(int id) {
        return session.selectList(NAMESPACE + ".selectAll",id);
    }
    public void delete(CartDTO cartDTO){
        session.delete(NAMESPACE + ".delete", cartDTO);
    }

}
