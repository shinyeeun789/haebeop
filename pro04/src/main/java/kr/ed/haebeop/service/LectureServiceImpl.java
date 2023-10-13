package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.persistence.LectureMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LectureServiceImpl implements LectureService {

    @Autowired
    private LectureMapper lectureMapper;

    @Override
    public List<LectureVO> lectureList(Page page) throws Exception {
        return lectureMapper.lectureList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return lectureMapper.getCount(page);
    }

    @Override
    public int lectureCount() throws Exception {
        return lectureMapper.lectureCount();
    }

    @Override
    @Transactional
    public LectureVO lectureDetail(String lcode) throws Exception {
        lectureMapper.countUp(lcode);
        return lectureMapper.lectureDetail(lcode);
    }

    @Override
    public void lectureInsert(Lecture dto) throws Exception {
        lectureMapper.lectureInsert(dto);
    }

    @Override
    public void lectureDelete(String lcode) throws Exception {
        lectureMapper.lectureDelete(lcode);
    }

    @Override
    public void lectureEdit(Lecture dto) throws Exception {
        lectureMapper.lectureEdit(dto);
    }

    @Override
    public List<Subject> subjects() throws Exception {
        return lectureMapper.subjects();
    }

}
