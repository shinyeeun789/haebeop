package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.persistence.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> teacherList() {
        return teacherMapper.teacherList();
    }

    @Override
    public List<Teacher> findTeacher(String tname) {
        return teacherMapper.findTeacher(tname);
    }
}
