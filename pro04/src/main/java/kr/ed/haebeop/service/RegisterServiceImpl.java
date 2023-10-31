package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.LectureVO;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.domain.PopularLecture;
import kr.ed.haebeop.domain.UserProgress;
import kr.ed.haebeop.persistence.PaymentMapper;
import kr.ed.haebeop.persistence.RegisterMapper;
import kr.ed.haebeop.persistence.UserMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterMapper registerMapper;
    @Autowired
    private PaymentMapper paymentMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean isReg(String lcode, String id) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("id", id);
        return registerMapper.isReg(data);
    }

    @Override
    @Transactional
    public String registerInsert(String id, String lcode, Payment payment) throws Exception {
        // Mapper에 전달할 데이터 세팅
        Map<String, String> data = new HashMap<>();
        data.put("lcode", lcode);
        data.put("id", id);

        payment.setId(id);

        // 만약 인원이 찼다면 수강신청할 수 없도록 처리
        boolean isMaxStudent = registerMapper.isMaxStudent(lcode);
        if(isMaxStudent) {
            // 1. 보유하고 있는 포인트 차감
            userMapper.minusPoint(data);
            // 2. 수강신청 테이블 INSERT
            registerMapper.registerInsert(data);
            // 3. 결제 테이블 INSERT
            paymentMapper.paymentInsert(payment);
            return "수강신청에 성공했습니다.";
        }
        return "수강인원이 마감되어 수강신청할 수 없습니다.";
    }

    @Override
    public int isPeriod(String lcode) throws Exception {
        return registerMapper.isPeriod(lcode);
    }

    @Override
    public List<LectureVO> myLectures(Page page) throws Exception {
        return registerMapper.myLectures(page);
    }

    @Override
    public List<UserProgress> progressList(String id) throws Exception {
        return registerMapper.progressList(id);
    }

    @Override
    public List<Map<String, Integer>> yearProfit() throws Exception {
        return registerMapper.yearProfit();
    }

    @Override
    public List<Map<String, Integer>> payProfit() throws Exception {
        return registerMapper.payProfit();
    }

    @Override
    public List<PopularLecture> popularLectures() throws Exception {
        return registerMapper.popularLectures();
    }

    @Override
    public List<LectureVO> ongoingMyLecture(String id) throws Exception {
        return registerMapper.ongoingMyLecture(id);
    }
}
