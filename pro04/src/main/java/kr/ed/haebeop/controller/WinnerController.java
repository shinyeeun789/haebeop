package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Winner;
import kr.co.teaspoon.service.WinnerService;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/winner/*")
public class WinnerController {
    @Autowired
    HttpSession session;
    @Autowired
    private WinnerService winnerService;

    //당첨자 발표 게시글 목록
    @GetMapping("list.do")
    public String winnerList(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        Page page = new Page();

        //페이징에 필요한 데이터 저장
        int total = winnerService.winnerListCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Winner> winnerList = winnerService.winnerList(page);
        model.addAttribute("winnerList",winnerList);
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터
        return "/winner/winnerNotice";
    }

    //당첨자발표 글 상세보기
    @GetMapping("detail.do")
    public String getWinnerDetail(HttpServletRequest request, Model model) throws Exception {
        int wno = Integer.parseInt(request.getParameter("wno"));
        Winner detail = winnerService.winnerDetail(wno);
        model.addAttribute("detail", detail);
        model.addAttribute("curPage", request.getParameter("page"));
        return "/winner/winnerDetail";
    }
    
    // 당첨자발표 글 등록
    @PostMapping("insert.do")
    public String winnerInsert(Winner winner, HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        winner.setAuthor((String)session.getAttribute("sid"));
        winnerService.winnerInsert(winner);
        return "redirect:/winner/list.do";
    }
    
    //당첨자발표 글 삭제
    @GetMapping("delete.do")
    public String getWinnerDelete(HttpServletRequest request, Model model) throws Exception {
        int wno = Integer.parseInt(request.getParameter("wno"));
        winnerService.winnerDelete(wno);
        return "redirect:/admin/selectWinner.do";
    }

    //ckeditor를 이용한 이미지 업로드
    @PostMapping("imageUpload.do")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "D:\\github\\project03\\tspoon\\src\\main\\webapp\\resources\\upload\\winner/";	// 이미지 경로 설정(폴더 자동 생성)
            //String path = request.getRealPath("/resource/upload/winner");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            printWriter = response.getWriter();
            String contextPath = request.getContextPath();
            String fileUrl = contextPath + "/winner/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value="ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid, @RequestParam(value="fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //서버에 저장된 이미지 경로
        String path = "D:\\github\\project03\\tspoon\\src\\main\\webapp\\resources\\upload\\winner/";	// 이미지 경로 설정
        //String path = request.getRealPath("/resource/uploadckImage/");
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}
