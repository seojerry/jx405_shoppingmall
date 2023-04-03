package com.bit.spring.service;

import com.bit.spring.model.GoodsDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GoodsService {
    private final String NAMESPACE = "mapper.goodsMapper";
    private final int PAGE_SIZE = 12;
    private SqlSession session;
    @Autowired
    public GoodsService(SqlSession session){
        this.session = session;
    }
    public List<GoodsDTO> selectAll(int pageNo) {
        HashMap<String, Integer> params = new HashMap<>();
        params.put("start", (pageNo - 1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        return session.selectList(NAMESPACE + ".selectAll", params);
    }

    public GoodsDTO selectOne(int id) {
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    public void insert(GoodsDTO goodsDTO) {
        session.insert(NAMESPACE + ".insert", goodsDTO);
    }

    public int selectLastPage() {
        int count = session.selectOne(NAMESPACE + ".count");
        int total = count / PAGE_SIZE;
        if (count % PAGE_SIZE != 0) {
            total++;
        }
        return total;
    }

    public Map<String, Object> selectByKeyword(String keyword, int pageNo) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        params.put("start", (pageNo - 1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        params.put("keyword", keyword);

        result.put("list", session.selectList(NAMESPACE + ".selectByKeyword", params));
        result.put("totalPage", countSearchResult(keyword));
        return result;
    }
    public Map<String, Object> selectByCategory(String category, int pageNo) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        params.put("start", (pageNo - 1) * PAGE_SIZE);
        params.put("size", PAGE_SIZE);
        params.put("category", category);

        result.put("list", session.selectList(NAMESPACE + ".selectByCategory", params));
        result.put("totalPage", countCategoryResult(category));
        return result;
    }

    public int countSearchResult(String keyword) {
        int temp = session.selectOne(NAMESPACE + ".countSearchResult", keyword);
        int totalPage = temp / PAGE_SIZE;
        if (temp % PAGE_SIZE != 0) {
            totalPage++;
        }
        return totalPage;
    }
    public int countCategoryResult(String category) {
        int temp = session.selectOne(NAMESPACE + ".countCategoryResult", category);
        int totalPage = temp / PAGE_SIZE;
        if (temp % PAGE_SIZE != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public void update(GoodsDTO attempt){
        session.update(NAMESPACE + ".update", attempt);
    }


}
