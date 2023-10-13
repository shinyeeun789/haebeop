package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Teacher;

import java.util.List;

public interface TeacherService {
    public List<Teacher> teacherList();
    public List<Teacher> findTeacher(String tname);

}
