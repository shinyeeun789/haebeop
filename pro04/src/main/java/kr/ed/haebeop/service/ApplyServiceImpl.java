package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.persistence.ApplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ApplyServiceImpl implements ApplyService{

    @Autowired
    private ApplyMapper applyMapper;

    @Override
    public Apply getApply(String id, int eno) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("id", id);
        data.put("eno", eno);
        return applyMapper.getApply(data);
    }

    @Override
    public boolean appCheck(String id, int eno) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("id", id);
        data.put("eno", eno);
        Apply apply = applyMapper.getApply(data);

        if (apply!= null && apply.getEno() == eno) {
            return false;
        }

        return true;
    }

    @Override
    public int getCount(int appno) throws Exception {
        return applyMapper.getCount(appno);
    }

    @Override
    public void applyInsert(Apply apply) throws Exception {
        applyMapper.applyInsert(apply);
    }

    @Override
    public void applyDelete(int appno) throws Exception {
        applyMapper.applyDelete(appno);
    }

    @Override
    public int applyCnt() throws Exception {
        return applyMapper.applyCnt();
    }
}
