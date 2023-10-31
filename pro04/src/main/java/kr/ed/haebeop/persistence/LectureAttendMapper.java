package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.LectureAttendVO;
import kr.ed.haebeop.domain.LectureVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface LectureAttendMapper {
    public List<LectureAttendVO> attendListTeacher(Map<String, Object> data) throws Exception;
    public List<LectureAttendVO> attendListStudent(Map<String, String> data) throws Exception;
    public void insertAttend(Map<String, Object> dataArray) throws Exception;
    public void insertAttendOne(Map<String, String> data) throws Exception;
    public void saveAttendCode(String lcode) throws Exception;
    public int getAttendCode(String lcode) throws Exception;
    public void delAttendCode(String lcode) throws Exception;
    public List<String> absentStudents(String lcode) throws Exception;
    public void insertAbsents(Map data) throws Exception;
    public List<LectureVO> teacherLectureList(String tid) throws Exception;

}
