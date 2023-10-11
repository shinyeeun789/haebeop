package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Board;
import kr.ed.haebeop.domain.BoardVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.persistence.BoardMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<BoardVO> boardList(Page page) throws Exception {
        return boardMapper.boardList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return boardMapper.getCount(page);
    }

    @Override
    public BoardVO boardDetail(int seq) throws Exception {
        return boardMapper.boardDetail(seq);
    }

    @Override
    public void boardInsert(Board dto) throws Exception {
        boardMapper.boardInsert(dto);
    }

    @Override
    public void boardDelete(int seq) throws Exception {
        boardMapper.boardDelete(seq);
    }

    @Override
    public void boardEdit(Board dto) throws Exception {
        boardMapper.boardEdit(dto);
    }

    @Override
    public List<Category> categories() throws Exception {
        return boardMapper.categories();
    }
}
