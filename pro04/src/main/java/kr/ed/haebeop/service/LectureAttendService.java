package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LectureAttendVO;
import kr.ed.haebeop.domain.LectureVO;

import java.util.List;
import java.util.Map;

public interface LectureAttendService {
    public List<LectureAttendVO> attendListTeacher(String lcode) throws Exception;
    public List<LectureAttendVO> attendListStudent(String lcode, String id) throws Exception;
    public void insertAttend(Map<String, Object> dataArray) throws Exception;
    public void insertAttendOne(String id, String lcode, String attendCode) throws Exception;
    public int getAttendCode(String lcode) throws Exception;
    public void delAttendCode(String lcode) throws Exception;
    public List<LectureVO> teacherLectureList(String tid) throws Exception;

}
