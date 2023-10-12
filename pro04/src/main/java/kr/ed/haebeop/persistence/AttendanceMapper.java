package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Attendance;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AttendanceMapper {
    public List<String> attendanceList(String id) throws Exception;
    public Attendance getAttendance(String id) throws Exception;
    public void addAttend(String id) throws Exception;
    public List<Attendance> attendaceDetail(String id) throws Exception;
}
