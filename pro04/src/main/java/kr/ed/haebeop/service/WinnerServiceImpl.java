package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.domain.Winner;
import kr.ed.haebeop.domain.WinnerDetail;
import kr.ed.haebeop.persistence.WinnerMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WinnerServiceImpl implements WinnerService{
    @Autowired
    private WinnerMapper winnerMapper;

    @Override
    public List<Apply> applyList(int eno) throws Exception {
        return winnerMapper.applyList(eno);
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
    public void winnerUpdate(Winner dto) throws Exception {
        winnerMapper.winnerUpdate(dto);
    }

    @Override
    public void winnerDelete(int wno) throws Exception {
        winnerMapper.winnerDelete(wno);
    }
}
