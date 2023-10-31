package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.FilterPage;
import kr.ed.haebeop.util.LecturePage;
import kr.ed.haebeop.util.Page;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.*;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    HttpSession session;

    @Autowired
    private UserService userService;

    @Autowired
    private ApplyService applyService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private QnaService qnaService;

    @Autowired
    private EventService eventService;

    @Autowired
    private FilterWordService filterWordService;

    @Autowired
    private WinnerService winnerService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CurriculumService curriculumService;

    @Autowired
    private RegisterService registerService;

    @RequestMapping("dashboard")
    public String dashboard(Model model) throws Exception {

        return "/admin/dashboard";
    }

    @PostMapping("userCntList")
    public void getUserCnt(HttpServletResponse response) throws Exception {
        List<Map<String, Integer>> userCntList = userService.userCntList();
        JSONArray jsonArray = new JSONArray();
        for(Map<String, Integer> userCnt : userCntList) {
            JSONObject obj = new JSONObject();
            obj.put("label", userCnt.get("label"));
            obj.put("teaCnt", userCnt.get("teaCnt"));
            obj.put("stuCnt", userCnt.get("stuCnt"));
            jsonArray.put(obj);
        }
        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }

    @PostMapping("profitYearReport")
    public void profitYearReport(HttpServletResponse response) throws Exception {
        List<Map<String, Integer>> profitList = registerService.yearProfit();
        JSONArray jsonArray = new JSONArray();
        for(Map<String, Integer> profits : profitList) {
            JSONObject obj = new JSONObject();
            obj.put("label", profits.get("label"));
            obj.put("profit", profits.get("profit"));
            jsonArray.put(obj);
        }
        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }

    @PostMapping("profitMonthReport")
    public void profitMonthReport(HttpServletResponse response) throws Exception {
        List<Map<String, Integer>> profitList = registerService.monthProfit();
        JSONArray jsonArray = new JSONArray();
        for(Map<String, Integer> profits : profitList) {
            JSONObject obj = new JSONObject();
            obj.put("label", profits.get("label"));
            obj.put("profit", profits.get("profit"));
            jsonArray.put(obj);
        }
        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }


    @GetMapping("userMgmt")
    public String userMgmt(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        Page page = new Page();
        page.setType(request.getParameter("type"));
        page.setKeyword(request.getParameter("keyword"));

        int total = userService.userCnt(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터

        List<User> userList = userService.userList(page);
        model.addAttribute("userList", userList);
        return "/admin/userMgmt";
    }

    @GetMapping("userDelete")
    public String userDelete(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        String id = request.getParameter("id");
        userService.userDelete(id);
        rttr.addFlashAttribute("msg", id);
        return "redirect:/admin/userMgmt";
    }

    @GetMapping("qnaMgmt")
    public String qnaMgmt(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        Page page = new Page();
        int total = qnaService.noAnswerCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터

        //QnaList
        List<Qna> noAnswerList = qnaService.noAnswerList(page);
        model.addAttribute("noAnswerList", noAnswerList);     //QnA 목록
        return "/admin/qnaMgmt";
    }

    // 필터링 단어 추가 페이지 로딩
    @RequestMapping(value="filtering", method= RequestMethod.GET)
    public String filterInsertGet(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        // 필터링 단어 목록 페이징 처리
        Page page = new Page();
        int total = filterWordService.getCount();
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<FilterWord> filterList = filterWordService.filterList(page);
        model.addAttribute("filterList", filterList);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        return "/admin/filterInsert";
    }

    // 필터링 단어 추가
    @RequestMapping(value="filterInsert", method= RequestMethod.POST)
    public String filterInsertGet(@RequestParam String word, Model model) throws Exception {
        filterWordService.filterInsert(word);
        return "redirect:/admin/filtering";
    }

    // 필터링 단어 삭제
    @GetMapping("filterDelete")
    public String filterDelete(@RequestParam int fno, Model model) throws Exception {
        filterWordService.filterDelete(fno);
        return "redirect:/admin/filtering";
    }

    // 커뮤니티 관리 페이지 로딩
    @RequestMapping("boardMgmt")
    public String boardMgmt(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ?Integer.parseInt(request.getParameter("page")) : 1;

        FilterPage page = new FilterPage();
        int total = filterWordService.getCountBadList();
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<BoardVO> boardList = filterWordService.badList(page);
        model.addAttribute("list", boardList);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        return "/admin/boardMgmt";
    }

    // 커뮤니티 삭제
    @RequestMapping("boardDelete")
    public String communityDelete(@RequestParam int seq, HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ?Integer.parseInt(request.getParameter("page")) : 1;
        boardService.boardDelete(seq);
        model.addAttribute("curPage", curPage);
        return "redirect:/admin/boardMgmt";
    }

    @RequestMapping("eventMgmt")
    public String getEventList(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        int total = eventService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Event> eventList = eventService.eventList(page);

        model.addAttribute("eventList", eventList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("page", page);

        return "/admin/eventMgmt";
    }

    @RequestMapping("selectWinner")
    public String selectWinner(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        int total = eventService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Event> ongoingEvents = eventService.ongoingEvents(page);
        model.addAttribute(ongoingEvents);

        return "/admin/selectWinner";
    }

    @RequestMapping("eventDelete")
    public String eventDelete(@RequestParam int eno, Model model) throws Exception {
        eventService.eventDelete(eno);
        return "redirect:/admin/eventMgmt";
    }

    @RequestMapping("winnerList")
    public String winnerList(@RequestParam int eno, Model model) throws Exception {
        List<WinnerDetail> winners = winnerService.winners(eno);
        model.addAttribute("winners", winners);
        return "/admin/winnerList";
    }

    @RequestMapping("insertWinner")
    public String insertWinner(@RequestParam int eno, Model model) throws Exception {
        List<WinnerDetail> winners = winnerService.winners(eno);
        for (WinnerDetail winner : winners) {
            String firstName = winner.getName().substring(0,1);
            String lastName = winner.getName().substring(2,3);
            winner.setName(firstName+"*"+lastName);
            winner.setId(winner.getId().substring(0, winner.getId().length()-2) + "***");
        }
        model.addAttribute("winners", winners);

        Event event = eventService.eventDetail(eno);
        model.addAttribute("event", event);

        return "/admin/insertWinner";
    }

    @GetMapping("lectureMgmt")
    public String lectureMgmt(HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String scode = request.getParameter("scode");

        LecturePage page = new LecturePage();
        page.setScode(scode);
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET

        // 페이징에 필요한 데이터 저장
        int total = lectureService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        // 강의 목록 불러오기
        List<LectureVO> lectureList = lectureService.lectureList(page);
        model.addAttribute("lectureList", lectureList);

        // 과목 목록 불러오기
        List<Subject> subjects = lectureService.subjects();
        model.addAttribute("subjects", subjects);

        model.addAttribute("curPage", curPage);
        model.addAttribute("curSubject", scode);
        model.addAttribute("page", page);

        return "/admin/lectureMgmt";
    }

    @RequestMapping("lectureInsert")
    public String lectureInsertForm(Model model) throws Exception {

        // 과목 목록 불러오기
        List<Subject> subjects = lectureService.subjects();
        model.addAttribute("subjects", subjects);

        // 강사 목록 불러오기
        List<Teacher> teachers = teacherService.teacherList();
        model.addAttribute("teachers", teachers);

        return "/admin/lectureInsert";
    }

    @RequestMapping(value="lectureInsert", method=RequestMethod.POST)
    public String lectureInsert(Lecture lecture, @RequestParam("upfile") MultipartFile file, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {

        int nextLcode = lectureService.lectureCount() + 1;
        lecture.setLcode(lecture.getScode() + nextLcode);

        String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/lecture/");           // 업로드 경로 설정
        File folder = new File(realPath);
        if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
            folder.mkdirs();
        }

        String originalFileName = file.getOriginalFilename();       // 첨부파일의 실제 파일명
        if(!originalFileName.isEmpty()) {
            String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
            lecture.setSaveFile(saveFileName);
            file.transferTo(new File(folder, saveFileName));        // 파일을 업로드 폴더에 저장
        }

        lectureService.lectureInsert(lecture);

        return "redirect:/admin/lectureMgmt";
    }

    @RequestMapping("closeLectureMgmt")
    public String closeLectureMgmt(HttpServletRequest request, Model model) throws Exception {

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        LecturePage page = new LecturePage();

        // 페이징에 필요한 데이터 저장
        int total = lectureService.getCloseCount();
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<CloseLecture> closeList = lectureService.closeList(page);
        model.addAttribute("closeList", closeList);

        model.addAttribute("curPage", curPage);
        model.addAttribute("page", page);

        return "/admin/closeLectureMgmt";
    }

    @RequestMapping("closeLecture")
    public String closeLecture(@RequestParam String lcode, @RequestParam String state, RedirectAttributes rttr) throws Exception {

        lectureService.closeLecture(lcode, state);
        if(state.equals("close")) {
            rttr.addFlashAttribute("msg", "강의가 폐강되었습니다.");
        } else {
            rttr.addFlashAttribute("msg", "폐강 취소되었습니다.");
        }

        return "redirect:/admin/closeLectureMgmt";
    }

    @RequestMapping("lectureEdit")
    public String lectureEditForm(@RequestParam String lcode, HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        LectureVO lecture = lectureService.lectureDetail(lcode);
        model.addAttribute("detail", lecture);

        // 과목 목록 불러오기
        List<Subject> subjects = lectureService.subjects();
        model.addAttribute("subjects", subjects);

        // 강사 목록 불러오기
        List<Teacher> teachers = teacherService.teacherList();
        model.addAttribute("teachers", teachers);

        model.addAttribute("curPage", curPage);

        return "/admin/lectureEdit";
    }

    @RequestMapping(value="lectureEdit", method=RequestMethod.POST)
    public String lectureEdit(Lecture lecture, @RequestParam("upfile") MultipartFile file, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        String realPath = request.getRealPath("/resources/upload/lecture/");           // 업로드 경로 설정
        File folder = new File(realPath);
        if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
            folder.mkdirs();
        }

        // 파일이 새롭게 업로드되었다면 기존 파일 삭제
        LectureVO oldLecture = lectureService.lectureDetail(lecture.getLcode());
        if(file.getSize() != 0) {
            ServletContext application = request.getSession().getServletContext();
            File oldFile = new File(application.getRealPath("/") + "/resources/upload/lecture/" + oldLecture.getSaveFile());
            if (oldFile.exists()) {
                oldFile.delete();
            }
        }

        String originalFileName = file.getOriginalFilename();       // 첨부파일의 실제 파일명
        if(!originalFileName.isEmpty()) {
            String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
            lecture.setSaveFile(saveFileName);
            file.transferTo(new File(folder, saveFileName));        // 파일을 업로드 폴더에 저장
        } else {
            lecture.setSaveFile(oldLecture.getSaveFile());          // 새로운 파일이 업로드되지 않았다면 VO에 기존 파일 데이터 저장
        }

        lectureService.lectureEdit(lecture);
        model.addAttribute("page", curPage);

        return "redirect:/admin/lectureMgmt";
    }

    @PostMapping("findTeacher")
    public void findTeacher(@RequestParam String tname, HttpServletResponse response) throws Exception {
        List<Teacher> teachers = teacherService.findTeacher(tname);

        JSONArray jsonArray = new JSONArray();
        for(Teacher teacher : teachers) {
            JSONObject obj = new JSONObject();
            obj.put("tcode", teacher.getTcode());
            obj.put("tname", teacher.getTname());
            jsonArray.put(obj);
        }

        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }

    @RequestMapping("teacherMgmt")
    public String teacherMgmt(HttpServletRequest request, Model model) throws Exception {

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET

        // 페이징에 필요한 데이터 저장
        int total = teacherService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Teacher> teacherList = teacherService.teacherList(page);
        model.addAttribute("teacherList", teacherList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("page", page);

        return "/admin/teacherMgmt";
    }

    @RequestMapping(value = "findID", method = RequestMethod.POST)
    public void findID(@RequestParam String keyword, HttpServletResponse response) throws Exception {
        List<User> teachers = userService.findID(keyword);

        JSONArray jsonArray = new JSONArray();
        for(User teacher : teachers) {
            JSONObject obj = new JSONObject();
            obj.put("id", teacher.getId());
            obj.put("name", teacher.getName());
            obj.put("tel", teacher.getTel());
            obj.put("email", teacher.getEmail());
            jsonArray.put(obj);
        }

        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }

    @RequestMapping("teacherInsert")
    public String teacherInsert(Model model) throws Exception {
        List<User> teacherInfoList = userService.teacherInfoList();
        model.addAttribute("teachers", teacherInfoList);
        return "/admin/teacherInsert";
    }

    @RequestMapping(value="teacherInsert", method=RequestMethod.POST)
    public String teacherInsertPost(Teacher teacher, @RequestParam("upfile") MultipartFile file, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {

        String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/teacher/");           // 업로드 경로 설정
        File folder = new File(realPath);
        if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
            folder.mkdirs();
        }
        String originalFileName = file.getOriginalFilename();       // 첨부파일의 실제 파일명
        if(!originalFileName.isEmpty()) {
            String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
            teacher.setSaveFile(saveFileName);
            file.transferTo(new File(folder, saveFileName));        // 파일을 업로드 폴더에 저장
        }
        teacherService.teacherInsert(teacher);
        return "redirect:/admin/teacherMgmt";
    }

    @RequestMapping("teacherEdit")
    public String teacherEditForm(@RequestParam String tcode, HttpServletRequest request, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        Teacher teacher = teacherService.teacherDetail(tcode);
        model.addAttribute("detail", teacher);
        model.addAttribute("curPage", curPage);

        return "/admin/teacherEdit";
    }

    @RequestMapping(value="teacherEdit", method=RequestMethod.POST)
    public String teacherEdit(Teacher teacher, @RequestParam("upfile") MultipartFile file, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/teacher/");           // 업로드 경로 설정
        File folder = new File(realPath);
        if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
            folder.mkdirs();
        }

        // 파일이 새롭게 업로드되지 않았다면 삭제하지 않도록 처리
        if(file.getSize() != 0) {
            Teacher oldTeacher = teacherService.teacherDetail(teacher.getTcode());
            ServletContext application = request.getSession().getServletContext();
            File oldFile = new File(application.getRealPath("/") + "/resources/upload/teacher/" + oldTeacher.getSaveFile());
            if (oldFile.exists()) {
                oldFile.delete();
            }
        }

        String originalFileName = file.getOriginalFilename();       // 첨부파일의 실제 파일명
        if(!originalFileName.isEmpty()) {
            String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
            teacher.setSaveFile(saveFileName);
            file.transferTo(new File(folder, saveFileName));        // 파일을 업로드 폴더에 저장
        }

        teacherService.teacherEdit(teacher);
        model.addAttribute("page", curPage);

        return "redirect:/admin/teacherMgmt";
    }

    @RequestMapping("curriculumInsert")
    public String curriculumInsertForm(@RequestParam String lcode, Model model) throws Exception {

        LectureVO lecture = lectureService.lectureDetail(lcode);
        model.addAttribute("lecture", lecture);

        List<Curriculum> curriculumList = curriculumService.curriculumList(lcode);
        model.addAttribute("curriculumList", curriculumList);

        return "/admin/curriculumInsert";
    }

    @RequestMapping(value = "curriculumInsert", method = RequestMethod.POST)
    public String curriculumInsert(@RequestParam(value="upfile", required=false) MultipartFile[] files, @RequestParam String lcode, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
        String[] cnames = request.getParameterValues("cname");

        String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/curriculum/");           // 업로드 경로 설정
        String saveFolder = realPath + lcode;
        File folder = new File(saveFolder);
        if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
            folder.mkdirs();
        }
        List<Curriculum> curriculumList = new ArrayList<>();        // 첨부파일 정보를 리스트로 생성
        for(int idx = 0; idx < cnames.length; idx++) {
            Curriculum curriculum = new Curriculum();
            // 첨부파일이 있는 경우
            if (files != null) {
                String originalFileName = files[idx].getOriginalFilename();   // 첨부파일의 실제 파일명
                if(!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
                    curriculum.setCvideo(saveFileName);                       // 동영상 정보 저장
                    files[idx].transferTo(new File(folder, saveFileName));    // 파일을 업로드 폴더에 저장
                }
            }
            curriculum.setLcode(lcode);
            curriculum.setCname(cnames[idx]);
            curriculumList.add(curriculum);
        }
        curriculumService.curriculumInsert(curriculumList);

        rttr.addFlashAttribute("msg", "success");

        return "redirect:/admin/lectureMgmt";
    }

}
