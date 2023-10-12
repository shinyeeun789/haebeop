package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Apply;
import kr.ed.haebeop.domain.Winner;
import kr.ed.haebeop.domain.WinnerDetail;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface WinnerService {
    public List<Apply> applyList(int eno) throws Exception;
    public List<WinnerDetail> winners(int eno) throws Exception;
    //당첨자 발표 게시글 목록
    public List<Winner> winnerList (Page page) throws Exception;
    public int winnerListCount(Page page) throws Exception;
    public Winner winnerDetail(int wno) throws Exception;
    public void winnerInsert(Winner dto) throws Exception;
    public void winnerUpdate(Winner dto) throws Exception;
    public void winnerDelete(int wno) throws Exception;

}
