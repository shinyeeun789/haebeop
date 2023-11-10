package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.AttendanceService;
import kr.ed.haebeop.util.CalendarInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {

    @Autowired
    HttpSession session;

    @Autowired
    AttendanceService attendanceService;

    @GetMapping("check")
    public String attendanceCheck(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");

        List<String> attendanceList = attendanceService.attendanceList(id);
        boolean attendChk = attendanceService.isAttendance(id);

        CalendarInfo calendarInfo = new CalendarInfo();
        calendarInfo.setCalendar();

        model.addAttribute("list", attendanceList);
        model.addAttribute("attendChk", attendChk);         // 오늘 출석체크 했는지 체크
        model.addAttribute("calendarInfo", calendarInfo);

        return "/attendance/check";
    }

    @GetMapping("addAttend")
    public String addAttend(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        String id = (String) session.getAttribute("sid");
        User user = new User();
        user.setId(id);
        int point = 0;
        if(!attendanceService.isAttendance(id)) {
            point = attendanceService.addAttend(user);
        }

        rttr.addFlashAttribute("point", point);
        return "redirect:/attendance/check";
    }

}
