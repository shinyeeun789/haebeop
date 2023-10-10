package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.UserService;
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
    HttpSession session;

    private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    // 로그인 폼 로딩
    @GetMapping("login")
    public String login(Model model) throws Exception {
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
        return "redirect:mypage";
    }

    @RequestMapping(value="mypage", method=RequestMethod.GET)
    public String myPage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return "/user/mypage";
    }

}
