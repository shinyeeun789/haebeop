package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Category;
import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface LectureService {

    public List<LectureVO> lectureList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public int lectureCount() throws Exception;
    public LectureVO lectureDetail(String lcode) throws Exception;
    public void lectureInsert(Lecture dto) throws Exception;
    public void lectureDelete(String lcode) throws Exception;
    public void lectureEdit(Lecture dto) throws Exception;
    public List<Subject> subjects() throws Exception;

}
