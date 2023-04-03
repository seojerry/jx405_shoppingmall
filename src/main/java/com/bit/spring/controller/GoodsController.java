package com.bit.spring.controller;

import com.bit.spring.model.GoodsDTO;
import com.bit.spring.model.UserDTO;
import com.bit.spring.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/goods/")
public class GoodsController {

    GoodsService goodsService;

    @Autowired
    public GoodsController(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @GetMapping("showAll/{pageNo}")
    public String showAll(Authentication authentication, Model model, @PathVariable int pageNo) {

        model.addAttribute("list", goodsService.selectAll(pageNo));
        model.addAttribute("paging", setPages(pageNo, goodsService.selectLastPage()));
        model.addAttribute("pagingAddr", "/goods/showAll");
        return "/goods/showAll";
    }

    @GetMapping("showOne/{id}")
    public String showOne(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id, Authentication authentication) {
//        int logInId = ((UserDTO) session.getAttribute("logIn")).getId();
        GoodsDTO g = goodsService.selectOne(id);
//        if (g == null) {
//            redirectAttributes.addFlashAttribute("message", "존재하지 않는 글 번호입니다.");
//            return "redirect:/goods/showAll/1";
//        }
        model.addAttribute("result", g);

        return "/goods/showOne";
    }

    //
    @GetMapping("update/{id}")
    public String showUpdate(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            redirectAttributes.addFlashAttribute("message", "다시 로그인해주세요.");
            return "redirect:/";
        }

        GoodsDTO g = goodsService.selectOne(id);
        if (g == null || g.getUserId() != logIn.getId()) {
            redirectAttributes.addFlashAttribute("message", "유효하지 않은 접근입니다.");
            return "redirect:/board/showAll/1";
        }

        model.addAttribute("goods", g);
        return "/goods/upsert";
    }

    @GetMapping("write")
    public String showWrite() {
        return "goods/upsert";
    }

    @PostMapping("upsert")
    public String upsert(MultipartFile file, HttpSession session, String attemptId, GoodsDTO goodsDTO, HttpServletRequest request,Model model) {
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (file == null) {
//            goodsDTO.setId(Integer.parseInt(attemptId));
//            goodsDTO.setId(Integer.parseInt(attemptId));
//            GoodsDTO origin = goodsService.selectOne(goodsDTO.getId());
//            origin.setName(goodsDTO.getName());
//            origin.setPrice(goodsDTO.getPrice());
            goodsService.update(goodsDTO);
            model.addAttribute("msg", "상품정보 수정을 완료하였습니다.");
            model.addAttribute("url","/goods/update/"+ goodsDTO.getId());
            return "alert";
        } else {
            String fileRealName = file.getOriginalFilename();
            long size = file.getSize();

            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
            String uploadFolder = request.getServletContext().getRealPath("/resources/images/goods/");
            String imgPath = uploadFolder.substring(uploadFolder.lastIndexOf("resources")-1,uploadFolder.length()).replace("\\","/");
            UUID uuid = UUID.randomUUID();

            String[] uuids = uuid.toString().split("-");

            String uniqueName = uuids[0];

            File saveFile = new File(uploadFolder + uniqueName + fileExtension);
            goodsDTO.setUserId(logIn.getId());
            goodsDTO.setImage(imgPath + uniqueName + fileExtension);

            try {
                file.transferTo(saveFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            goodsService.insert(goodsDTO);
            model.addAttribute("msg", "상품 등록을 완료하였습니다.");
            model.addAttribute("url","/goods/showAll/1");
            return "alert";
        }
    }

    @GetMapping("category/{pageNo}")
    public String categoryShowAll(@PathVariable int pageNo, String category, Model model) {
        Map<String, Object> map = goodsService.selectByCategory(category, pageNo);

        model.addAttribute("list", map.get("list"));

        model.addAttribute("pagingAddr", "/goods/category");
        model.addAttribute("category", category);
        model.addAttribute("paging", setPages(pageNo, goodsService.countCategoryResult(category)));
        return "/goods/showAll";
    }

    @GetMapping("search/{pageNo}")
    public String search(@PathVariable int pageNo, String keyword, Model model) {
        Map<String, Object> map = goodsService.selectByKeyword(keyword, pageNo);

        model.addAttribute("list", map.get("list"));

        model.addAttribute("pagingAddr", "/goods/search");
        model.addAttribute("keyword", keyword);
        model.addAttribute("paging", setPages(pageNo, goodsService.countSearchResult(keyword)));
        return "/goods/showAll";
    }

    private HashMap<String, Integer> setPages(int pageNo, int totalPage) {
        HashMap<String, Integer> paging = new HashMap();
        int start = 0;
        int end = totalPage;

        if (totalPage < 5) {
            start = 1;
            end = totalPage;
        } else if (pageNo < 3) {
            start = 1;
            end = 5;
        } else if (pageNo > totalPage - 3) {
            start = totalPage - 4;
            end = totalPage;
        } else {
            start = pageNo - 2;
            end = pageNo + 2;
        }

        paging.put("start", start);
        paging.put("end", end);
        paging.put("totalPage", totalPage);
        paging.put("current", pageNo);

        return paging;
    }
}
