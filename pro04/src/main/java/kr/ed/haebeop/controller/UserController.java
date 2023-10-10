package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @RequestMapping("term")
    public String term(Model model) {
        return "/user/term";
    }

    @RequestMapping("join")
    public String join(Model model) {
        return "/user/join";
    }

    @RequestMapping(value="join", method=RequestMethod.POST)
    public String joinPro(User user, ServletRequest request, ServletResponse response, Model model) throws Exception {
        String pw = pwEncoder.encode(user.getPw());
        user.setPw(pw);
        userService.userInsert(user);

        return "/user/login";
    }

    @RequestMapping(value = "idCheck", method = RequestMethod.POST)
    public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String id = request.getParameter("id");
        boolean result = userService.idCheck(id);

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    @RequestMapping("login")
    public String userLoginForm(Model model) throws Exception {
        return "/user/login";
    }
    @RequestMapping("login2")
    public String userLoginForm2(Model model) throws Exception {
        return "/user/loginmypage";
    }
    @RequestMapping(value = "loginpro", method = RequestMethod.POST)
    public String userLogin(@RequestParam String id, @RequestParam String pw, HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        boolean ps = userService.loginCheck(id, pw);
        String saveId = request.getParameter("saveId");
        
        // 로그인 성공 시 쿠키에 아이디 기억하기
        Cookie cookie = new Cookie("userID", id);
        if(ps && saveId != null) {
            response.addCookie(cookie);
        } else if(ps && saveId == null) {           // '아이디 기억하기' 체크 해제한 경우
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        
        // 로그인 성공 시
        if(ps){
            session.setAttribute("sid", id);
            userService.updateVisited(id);
            return "redirect:/";
        } else {
            return "redirect:login";
        }
    }

    @RequestMapping(value = "loginpro2", method = RequestMethod.POST)
    public String userLogin2(HttpSession session, @RequestParam String pw, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        boolean ps = userService.loginCheck(id, pw);
        if(ps){
            session.setAttribute("sid", id);
            return "redirect:mypage";
        } else {
            return "redirect:login2";
        }
    }

    @GetMapping("logout")
    public String userLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("myInfo")
    public String myInfo(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return "/user/myInfo";
    }

    @GetMapping("mypage")
    public String mypage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return "/user/mypage";
    }
    @RequestMapping(value="update", method=RequestMethod.POST)
    public String userUpdate(User user, Model model) throws Exception {
        String pwd = "";
        if(user.getPw().length()<=16) {
            pwd = pwEncoder.encode(user.getPw());
            user.setPw(pwd);
        }
        userService.userEdit(user);
        return "redirect:/";
    }

    @RequestMapping(value="delete", method = RequestMethod.GET)
    public String userDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        userService.userDelete(id);
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value="list", method = RequestMethod.GET)
    public String userList(Model model) throws Exception {
        List<User> userList = userService.userList();
        model.addAttribute("userList", userList);

        return "/user/userList";
    }
}
