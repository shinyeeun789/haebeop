package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;
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
        return lectureMapper.lectureDetail(lcode);
    }

    @Override
    public void lectureInsert(Lecture dto) throws Exception {
        lectureMapper.lectureInsert(dto);
    }

    @Override
    public List<CloseLecture> closeList(Page page) throws Exception {
        return lectureMapper.closeList(page);
    }
    @Override
    public int getCloseCount() throws Exception {
        return lectureMapper.getCloseCount();
    }

    @Override
    public void closeLecture(String lcode, String state) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("state", state);
        lectureMapper.closeLecture(data);
    }

    @Override
    public void lectureEdit(Lecture dto) throws Exception {
        lectureMapper.lectureEdit(dto);
    }

    @Override
    public List<Subject> subjects() throws Exception {
        return lectureMapper.subjects();
    }

    @Override
    public boolean comparePeriod(String lcode) throws Exception {
        return lectureMapper.comparePeriod(lcode);
    }
}
