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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    @RequestMapping("dashboard")
    public String dashboard(Model model) throws Exception {
        // 회원 수
//        int userCnt = userService.userCnt();
//        model.addAttribute("userCnt", userCnt);
//
//        // 게시글 수
//        int boardCnt = boardService.boardCnt();
//        model.addAttribute("boardCnt", boardCnt);
//
//        // 이벤트 참여자 수
//        int applyCnt = applyService.applyCnt();
//        model.addAttribute("applyCnt", applyCnt);
//
//        // 미답변 질문 수
//        int noAnswerCnt = qnaService.noAnswerCount();
//        model.addAttribute("noAnswerCnt", noAnswerCnt);
//
//        // 진행 중인 이벤트 목록
//        List<Event> ongoingEvents = eventService.ongoingEvents();
//        model.addAttribute("ongoingEvents", ongoingEvents);

        return "/admin/dashboard";
    }


    /* 관리자가 볼 수 있는 회원 목록 */
    @GetMapping("userList")
    public String userList(Model model) throws Exception {
        List<User> userList = userService.userList();
        model.addAttribute("userList", userList);
        return "/admin/userList";
    }

    @GetMapping("userMgmt")
    public String userMgmt(Model model) throws Exception {
        List<User> userList = userService.userList();
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
    public String lectureInsert(Model model) throws Exception {

        // 과목 목록 불러오기
        List<Subject> subjects = lectureService.subjects();
        model.addAttribute("subjects", subjects);

        // 강사 목록 불러오기
        List<Teacher> teachers = teacherService.teacherList();
        model.addAttribute("teachers", teachers);

        return "/admin/lectureInsert";
    }

    @RequestMapping(value="lectureInsert", method=RequestMethod.POST)
    public String lectureInsertPost(Lecture lecture, Teacher teacher, @RequestParam("upfile") MultipartFile file, HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {

        int nextLcode = lectureService.lectureCount() + 1;
        lecture.setLcode(lecture.getScode() + nextLcode);

        String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/lecture/");           // 업로드 경로 설정
        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = realPath + today;
        File folder = new File(saveFolder);
        if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
            folder.mkdirs();
        }

        String originalFileName = file.getOriginalFilename();       // 첨부파일의 실제 파일명
        if(!originalFileName.isEmpty()) {
            String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
            lecture.setSaveFolder(today);
            lecture.setOriginFile(originalFileName);
            lecture.setSaveFile(saveFileName);
            file.transferTo(new File(folder, saveFileName));        // 파일을 업로드 폴더에 저장
        }

        lectureService.lectureInsert(lecture);

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

}
