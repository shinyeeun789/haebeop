package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureService {

    public List<LectureVO> lectureList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public int lectureCount() throws Exception;
    public LectureVO lectureDetail(String lcode) throws Exception;
    public void lectureInsert(Lecture dto) throws Exception;
    public List<CloseLecture> closeList(Page page) throws Exception;
    public int getCloseCount() throws Exception;
    public void closeLecture(String lcode, String state) throws Exception;
    public void lectureEdit(Lecture dto) throws Exception;
    public List<Subject> subjects() throws Exception;
    public boolean comparePeriod(String lcode) throws Exception;

}
