package com.bit.spring.controller;

import com.bit.spring.model.UserDTO;
import com.bit.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {

    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("logIn")
    public String moveLoginPage(@RequestParam(value = "error", required = false)String error, Model model) {
        if(error != null) {
            model.addAttribute("msg", "로그인에 실패하였습니다. 다시 로그인해주세요.");
            model.addAttribute("url", "/user/logIn");
            return "alert";
        }
        return "user/login";
    }


    //로그인
    @PostMapping("auth")
    public String auth(HttpSession session, Model model, UserDTO attempt) {
//        userService.register(attempt);
        UserDTO result = userService.auth(attempt);

        if (result != null) {
            session.setAttribute("logIn", result);
            return "redirect:/board/showAll/1";   //페이지 url까지 바꿔줌
        } else {
            model.addAttribute("message", "로그인 정보를 다시 확인해주세요.");
            return "index";
        }
    }

    @GetMapping("register")
    public String showRegister() {
        return "user/register";
    }

    @PostMapping("register")
    public String register(UserDTO attempt, Model model) {
        if (userService.register(attempt)) {
            model.addAttribute("msg", "회원가입을 완료하였습니다.");
            model.addAttribute("url","/user/logIn");
            return "alert";
        } else {
            model.addAttribute("msg", "중복된 아이디로 가입하실 수 없습니다.");
            model.addAttribute("url", "/user/register");
            return "alert";
        }
    }
}
