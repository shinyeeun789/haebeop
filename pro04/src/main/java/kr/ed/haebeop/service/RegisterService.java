package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.domain.UserProgress;
import kr.ed.haebeop.persistence.PaymentMapper;
import kr.ed.haebeop.util.Page;

import java.util.List;
import java.util.Map;

public interface RegisterService {

    public boolean isReg(String lcode, String id) throws Exception;
    public String registerInsert(String id, String lcode, Payment payment) throws Exception;
    public int isPeriod(String lcode) throws Exception;
    public List<LectureVO> myLectures(Page page) throws Exception;
    public List<UserProgress> progressList(String id) throws Exception;
    public List<Map<String, Integer>> yearProfit() throws Exception;
    public List<Map<String, Integer>> monthProfit() throws Exception;

}
