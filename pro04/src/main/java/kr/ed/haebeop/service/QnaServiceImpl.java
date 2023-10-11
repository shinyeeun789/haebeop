package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Qna;
import kr.ed.haebeop.persistence.QnaMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService{

    @Autowired
    private QnaMapper qnaMapper;

    @Override
    public List<Qna> qnaList(Page page) throws Exception {
        return qnaMapper.qnaList(page);
    }

    @Override
    public List<Qna> noAnswerList(Page page) throws Exception {
        return qnaMapper.noAnswerList(page);
    }

    @Override
    public int noAnswerCount() throws Exception {
        return qnaMapper.noAnswerCount();
    }

    @Override
    public Qna qnaDetail(int qno) throws Exception {
        return qnaMapper.qnaDetail(qno);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return qnaMapper.getCount(page);
    }

    @Override
    public int noAnswerCount(Page page) throws Exception {
        return qnaMapper.noAnswerCount(page);
    }

    @Override
    @Transactional
    public void questionInsert(Qna dto) throws Exception {
        qnaMapper.questionInsert(dto);
        qnaMapper.parUpdate(dto);
    }

    @Override
    public void answerInsert(Qna dto) throws Exception {
        qnaMapper.answerInsert(dto);
    }

    @Override
    public void qnaDelete(int qno) throws Exception {
        qnaMapper.qnaDelete(qno);
    }

    @Override
    public void qnaEdit(Qna dto) throws Exception {
        qnaMapper.qnaEdit(dto);
    }
}
