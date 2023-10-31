package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.domain.Winner;
import kr.ed.haebeop.domain.WinnerDetail;
import kr.ed.haebeop.persistence.WinnerMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WinnerServiceImpl implements WinnerService{
    @Autowired
    private WinnerMapper winnerMapper;

    @Override
    public int getCount(int eno) throws Exception {
        return winnerMapper.getcount(eno);
    }

    @Override
    public List<Apply> applyList(Page page) throws Exception {
        return winnerMapper.applyList(page);
    }

    @Override
    @Transactional
    public List<WinnerDetail> winners(int eno) throws Exception {
        winnerMapper.random(eno);
        winnerMapper.closeEvent(eno);
        return winnerMapper.winners(eno);
    }

    @Override
    public List<Winner> winnerList(Page page) throws Exception {
        return winnerMapper.winnerList(page);
    }

    @Override
    public int winnerListCount(Page page) throws Exception {
        return winnerMapper.winnerListCount(page);
    }

    @Override
    public Winner winnerDetail(int wno) throws Exception {
        return winnerMapper.winnerDetail(wno);
    }

    @Override
    public void winnerInsert(Winner dto) throws Exception {
        winnerMapper.winnerInsert(dto);
    }

    @Override
    public void winnerDelete(int wno) throws Exception {
        winnerMapper.winnerDelete(wno);
    }

    @Override
    public Winner winnerRef(int wno, String type) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("wno", wno);
        data.put("type", type);
        return winnerMapper.winnerRef(data);
    }
}
