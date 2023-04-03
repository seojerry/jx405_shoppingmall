package com.bit.spring.controller;

import com.bit.spring.model.CartDTO;
import com.bit.spring.model.GoodsDTO;
import com.bit.spring.model.UserDTO;
import com.bit.spring.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart/")
public class CartController {
    private CartService cartService;

    @Autowired
    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("show")
    public String showPage(Model model,HttpSession session) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        int id = logIn.getId();
        List<CartDTO> list = cartService.selectAll(id);
        int totalPrice=0;
        for (CartDTO c: list
             ) {
            totalPrice += c.getPrice();
        }
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("list", list);
//        model.addAttribute("list", cartService.selectAll(id));
        return "cart/show";
    }
    @GetMapping("register/{id}")
    public String register(@PathVariable int id, GoodsDTO goodsDTO) {
        CartDTO cartDTO = new CartDTO();
        cartService.insert(cartDTO);

        return "redirect:/goods/showOne/"+id;
    }
    @PostMapping("register")
    public String register(GoodsDTO goodsDTO, HttpSession session,String pop_out) {
        System.out.println(1);
        int logInId = ((UserDTO) session.getAttribute("logIn")).getId();
        CartDTO cartDTO = new CartDTO();
        cartDTO.setUserId(logInId);
        cartDTO.setGoodsId(goodsDTO.getId());
        int count = Integer.parseInt(pop_out);
        cartDTO.setCount(count);
        cartDTO.setPrice(count * goodsDTO.getPrice());
        cartDTO.setImage(goodsDTO.getImage());
        cartService.insert(cartDTO);
        System.out.println(2);
        return "redirect:/goods/showOne/"+goodsDTO.getId();
    }

    @PostMapping("delete")
    public String delete(String id ,Model model) {
        int itemId = Integer.parseInt(id);
        System.out.println(id);
        CartDTO cartDTO = new CartDTO();
        cartDTO.setId(itemId);
        cartService.delete(cartDTO);
        return "cart/show";
    }
}
