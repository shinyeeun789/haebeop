package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Attendance;
import kr.ed.haebeop.domain.User;

import java.util.List;

public interface AttendanceService {
    public List<String> attendanceList(String id) throws Exception;
    public boolean isAttendance(String id) throws Exception;
    public int addAttend(User user) throws Exception;
    public List<Attendance> attendaceDetail(String id) throws Exception;
}
