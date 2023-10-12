package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface BoardMapper {
    public List<BoardVO> boardList(Page page) throws Exception;
    public BoardVO boardDetail(int seq) throws Exception;
    public void boardInsert(Board dto) throws Exception;
    public void boardDelete(int seq) throws Exception;
    public void boardEdit(Board dto) throws Exception;
    public List<Category> categories() throws Exception;
    public int getCount(Page page) throws Exception;
    public void countUp(int seq) throws Exception;
}
