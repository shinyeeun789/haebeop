package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.persistence.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper memberMapper;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<User> userList() throws Exception {return memberMapper.userList(); }

    @Override
    public User getUser(String id) {
        return memberMapper.getUser(id);
    }

    @Override
    public boolean idCheck(String id) {
        return memberMapper.getUser(id) == null ? true : false;
    }

    @Override
    public void updateVisited(String id) throws Exception {
        memberMapper.updateVisited(id);
    }

    @Override
    public void userInsert(User member) {
        memberMapper.userInsert(member);
    }

    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        boolean comp = false;
        User member = memberMapper.loginCheck(id);

        if(member!=null && pwEncoder.matches(pw, member.getPw())){
            comp = true;
        } else {
            comp = false;
        }
        return comp;
    }

    @Override
    public void userEdit(User member) throws Exception{ memberMapper.userEdit(member); }

    @Override
    public void userDelete(String id) throws Exception { memberMapper.userDelete(id);}

    @Override
    public int userCnt() throws Exception {
        return memberMapper.userCnt();
    }

//    @Override
//    public List<AdminChartVO> adminChart() throws Exception {
//        return memberMapper.adminChart();
//    }
}
