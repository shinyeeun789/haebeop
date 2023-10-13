package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.util.LecturePage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {

    @Autowired
    private LectureService lectureService;

    @RequestMapping("list")
    public String lectureList(HttpServletRequest request, Model model) throws Exception {
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

        return "/lecture/lectureList";
    }

}
