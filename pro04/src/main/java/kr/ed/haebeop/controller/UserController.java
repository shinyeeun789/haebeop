package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.domain.UserProgress;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.RegisterService;
import kr.ed.haebeop.service.UserService;
import kr.ed.haebeop.util.LecturePage;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/user/*")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private LectureService lectureService;
    @Autowired
    private RegisterService registerService;
    @Autowired
    private HttpSession session;

    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    // 로그인 폼 로딩
    @GetMapping("login")
    public String login(HttpServletRequest request, Model model) throws Exception {
        model.addAttribute("warning", request.getParameter("warning"));
        return "/user/login";
    }

    // 로그인 처리
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@RequestParam String id, @RequestParam String pw, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
        boolean ps = userService.loginCheck(id, pw);
        String saveId = request.getParameter("saveId");

        // 로그인 성공 시 쿠키에 아이디 저장하기
        Cookie cookie = new Cookie("userID", id);
        if(ps && saveId != null) {
            response.addCookie(cookie);
        } else if(ps && saveId == null) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        if(ps){
            session.setAttribute("sid", id);
            userService.updateVisited(id);
            rttr.addFlashAttribute("msg", 1);
            return "redirect:/";
        } else {
            rttr.addFlashAttribute("msg", 0);
            return "redirect:login";
        }
    }

    //로그아웃
    @GetMapping("logout")
    public String logout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    // 회원약관 화면 로딩
    @GetMapping("term")
    public String term(Model model) throws Exception {
        return "/user/term";
    }

    // 회원가입 폼 로딩
    @GetMapping("join")
    public String join(Model model) throws Exception {
        return "/user/join";
    }

    // 회원가입
    @RequestMapping(value="join", method= RequestMethod.POST)
    public String joinPro(User user, ServletRequest request, ServletResponse response, Model model) throws Exception {
        user.setPw(pwEncoder.encode(user.getPw()));
        userService.userInsert(user);

        return "/user/login";
    }

    // 아이디 중복 체크
    @RequestMapping(value = "idCheck", method = RequestMethod.POST)
    public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String id = request.getParameter("id");
        boolean result = userService.idCheck(id);

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    @GetMapping("delete")
    public String userDelete(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        userService.userDelete(id);
        return "redirect:list";
    }

    @GetMapping("edit")
    public String editForm(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return "/user/userEdit";
    }

    @PostMapping("edit")
    public String userEdit(User user, @RequestParam String pw2, Model model) throws Exception {
        if(user.getPw() == null) {
            user.setPw(pw2);
        } else {
            user.setPw(pwEncoder.encode(user.getPw()));
        }
        userService.userEdit(user);
        return "redirect:myPage";
    }

    @RequestMapping(value="myPage", method=RequestMethod.GET)
    public String myPage(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");

        // 사용자 정보 가져오기
        User user = userService.getUser(id);
        model.addAttribute("user", user);

        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        LecturePage page = new LecturePage();
        page.setKeyword(request.getParameter("keyword"));       // 검색 키워드 SET
        page.setType(request.getParameter("type"));             // 검색 타입 SET
        page.setId(id);

        // 페이징에 필요한 데이터 저장
        int total = lectureService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        // 수강신청 목록 불러오기
        List<LectureVO> myLecture = registerService.myLectures(page);
        model.addAttribute("lectureList", myLecture);

        // 최근 학습 목록 불러오기
        List<UserProgress> progressList = registerService.progressList(id);
        model.addAttribute("progressList", progressList);

        model.addAttribute("curPage", curPage);
        model.addAttribute("page", page);

        return "/user/myPage";
    }

}
