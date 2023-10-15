package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface RegisterService {

    public boolean isReg(String lcode, String id) throws Exception;
    public String registerInsert(String id, String lcode) throws Exception;
    public int isPeriod(String lcode) throws Exception;
    public List<LectureVO> myLectures(Page page) throws Exception;

}
