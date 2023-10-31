package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.LectureAttendVO;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.service.LectureAttendService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.util.CalendarInfo;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/lectureAttend/*")
public class LectureAttendController {

    @Autowired
    private LectureService lectureService;

    @Autowired
    private LectureAttendService lectureAttendService;

    @GetMapping("studentAttend")
    public String lectureAttend(@RequestParam String lcode, Model model, HttpServletRequest request) throws Exception {
        // 해당 강의에 대한 정보
        LectureVO lecture = lectureService.lectureDetail(lcode);
        model.addAttribute("lecture", lecture);

        // 해당 강의에 대한 출석 정보
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        List<LectureAttendVO> attendList = lectureAttendService.attendListStudent(lcode, id);
        model.addAttribute("attendList", attendList);

        // 달력 정보 생성
        CalendarInfo calendarInfo = new CalendarInfo();
        calendarInfo.setCalendar();
        model.addAttribute("calendarInfo", calendarInfo);

        return "/lectureAttend/studentAttend";
    }

    @PostMapping("studentAttend")
    public String studentAttend(@RequestParam String attendCode, @RequestParam String lcode, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        lectureAttendService.insertAttendOne(id, lcode, attendCode);

        return "redirect:studentAttend?lcode=" + lcode;
    }

    @RequestMapping("teacherAttend")
    public String teacherAttend(@RequestParam String lcode, Model model) throws Exception {
        LectureVO lecture = lectureService.lectureDetail(lcode);
        model.addAttribute("lecture", lecture);

        List<LectureAttendVO> attendList = lectureAttendService.attendListTeacher(lcode);
        model.addAttribute("attendList", attendList);

        return "/lectureAttend/teacherAttend";
    }

    @PostMapping("reloadTeacherTable")
    public void reloadTeacherTable(@RequestParam String lcode, HttpServletResponse response) throws Exception {
        List<LectureAttendVO> attendList = lectureAttendService.attendListTeacher(lcode);

        JSONArray jsonArray = new JSONArray();
        for(LectureAttendVO lecture : attendList) {
            JSONObject obj = new JSONObject();
            obj.put("lcode", lecture.getLcode());
            obj.put("id", lecture.getId());
            obj.put("name", lecture.getName());
            obj.put("adate", lecture.getAdate());
            obj.put("atime", lecture.getAtime());
            obj.put("atype", lecture.getAtype());
            jsonArray.put(obj);
        }

        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }

    @PostMapping("insertAttend")
    public void insertAttend(@RequestParam Map<String, Object> paramMap, HttpServletResponse response) throws Exception {
        String jsonData = paramMap.get("dataArray").toString();
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(jsonData);
        paramMap.put("dataArray", obj);

        lectureAttendService.insertAttend(paramMap);
        JSONObject result = new JSONObject();
        result.put("result", "success");
        PrintWriter out = response.getWriter();
        out.println(result);
    }

    @PostMapping("saveAttendCode")
    public void saveAttendCode(@RequestParam String lcode, HttpServletResponse response) throws Exception {
        int attendCode = lectureAttendService.getAttendCode(lcode);
        JSONObject obj = new JSONObject();
        obj.put("attendCode", attendCode);
        PrintWriter out = response.getWriter();
        out.println(obj);
    }

    @PostMapping("delAttendCode")
    public void delAttendCode(@RequestParam String lcode, HttpServletResponse response) throws Exception {
        lectureAttendService.delAttendCode(lcode);

        List<LectureAttendVO> attendList = lectureAttendService.attendListTeacher(lcode);
        JSONObject result = new JSONObject();
        result.put("result", "success");
        PrintWriter out = response.getWriter();
        out.println(result);
    }

    @GetMapping("teacherLecture")
    public String teacherLecture(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        List<LectureVO> lectureList = lectureAttendService.teacherLectureList(id);
        model.addAttribute("lectureList", lectureList);
        return "/lectureAttend/teacherLecture";
    }

}
