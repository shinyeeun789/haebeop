package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Teacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeacherMapper {
    public List<Teacher> teacherList();
    public List<Teacher> findTeacher(String tname);

}
