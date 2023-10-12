package kr.ed.haebeop.controller;

import org.checkerframework.checker.units.qual.A;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

@Controller
@RequestMapping("/news/*")
public class NewsController {

    public static HashMap<String, String> map;

    @RequestMapping(value="list")
    public String newsList(Model model) throws Exception {
        int page = 1;

        // 오늘 날짜 구하기
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String sDate = sdf.format(date);

        ArrayList<String> urls = new ArrayList<>();
        ArrayList<String> titles = new ArrayList<>();
        ArrayList<String> contents = new ArrayList<>();
        ArrayList<String> writers = new ArrayList<>();
        ArrayList<String> regdates = new ArrayList<>();

        while (page < 20) {
            // 크롤링하고 싶은 페이지
            String address = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=250&mid=shm&sid1=102&date="+sDate+"&page=" + Integer.toString(page);
            Document rawData = Jsoup.connect(address).timeout(5000).get();

            Elements newsItems = rawData.select(".type06_headline li");

            for (Element option : newsItems) {
                String realURL = option.select("a").attr("href");
                String realTitle = option.select("a").text();
                String realContent = option.select(".lede").text();
                String realWriter = option.select(".writing").text();
                String realRegdate = option.select(".date").text();
                urls.add(realURL);
                titles.add(realTitle);
                contents.add(realContent);
                writers.add(realWriter);
                regdates.add(realRegdate);
            }
            page += 10;
        }
        model.addAttribute("urls", urls);
        model.addAttribute("titles", titles);
        model.addAttribute("contents", contents);
        model.addAttribute("writers", writers);
        model.addAttribute("regdates", regdates);

        return "/news/newsList";
    }

}
