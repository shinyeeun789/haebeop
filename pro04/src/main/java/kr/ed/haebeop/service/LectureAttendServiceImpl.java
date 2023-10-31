package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LectureAttendVO;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.persistence.LectureAttendMapper;
import kr.ed.haebeop.persistence.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@EnableScheduling
public class LectureAttendServiceImpl implements LectureAttendService {

    @Autowired
    private LectureAttendMapper lectureAttendMapper;

    @Autowired
    private RegisterMapper registerMapper;

    @Override
    public List<LectureAttendVO> attendListTeacher(String lcode) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("total", registerMapper.regStudentCnt(lcode));
        return lectureAttendMapper.attendListTeacher(data);
    }

    @Override
    public List<LectureAttendVO> attendListStudent(String lcode, String id) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("id", id);
        return lectureAttendMapper.attendListStudent(data);
    }

    @Override
    public void insertAttendOne(String id, String lcode, String attendCode) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("id", id);
        data.put("lcode", lcode);
        data.put("attendCode", attendCode);
        lectureAttendMapper.insertAttendOne(data);
    }

    @Override
    public void insertAttend(Map<String, Object> dataArray) throws Exception {
        lectureAttendMapper.insertAttend(dataArray);
    }

    @Override
    public int getAttendCode(String lcode) throws Exception {
        lectureAttendMapper.saveAttendCode(lcode);
        return lectureAttendMapper.getAttendCode(lcode);
    }

    @Override
    @Transactional
    public void delAttendCode(String lcode) throws Exception {
        // 1. 출결코드 데이터 삭제
        lectureAttendMapper.delAttendCode(lcode);

        // 2. 출석하지 않은 사람들 모두 결석 처리
        List<String> absentStudents = lectureAttendMapper.absentStudents(lcode);
        if(absentStudents.size() > 0) {
            List<String> atype = new ArrayList<>();
            for(int i=0; i<absentStudents.size(); i++) { atype.add("결석"); }
            Map data = new HashMap();
            data.put("lcode", lcode);
            data.put("idList", absentStudents);
            data.put("atype", atype);
            lectureAttendMapper.insertAbsents(data);
        }
    }

    @Override
    public List<LectureVO> teacherLectureList(String tid) throws Exception {
        return lectureAttendMapper.teacherLectureList(tid);
    }
}
