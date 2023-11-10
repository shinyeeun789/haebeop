package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Attendance;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.persistence.AttendanceMapper;
import kr.ed.haebeop.persistence.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    private AttendanceMapper attendanceMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<String> attendanceList(String id) throws Exception {
        return attendanceMapper.attendanceList(id);
    }

    @Override
    public boolean isAttendance(String id) throws Exception {
        boolean result = false;
        if(attendanceMapper.getAttendance(id) != null) {
            result = true;
        }
        return result;
    }

    @Override
    public int addAttend(User user) throws Exception {
        attendanceMapper.addAttend(user.getId());

        // 랜덤 포인트 (10~100)
        Random random = new Random();
        int point = (int) (random.nextInt(10) + 1) * 10;
        user.setPt(point);
        userMapper.updatePt(user);

        return point;
    }

    @Override
    public List<Attendance> attendaceDetail(String id) throws Exception {
        return attendanceMapper.attendaceDetail(id);
    }
}
