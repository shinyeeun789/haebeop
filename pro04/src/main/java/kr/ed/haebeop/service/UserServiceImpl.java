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
    private UserMapper userMapper;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<User> userList() throws Exception {return userMapper.userList(); }

    @Override
    public User getUser(String id) {
        return userMapper.getUser(id);
    }

    @Override
    public boolean idCheck(String id) {
        return userMapper.getUser(id) == null ? true : false;
    }

    @Override
    public void updateVisited(String id) throws Exception {
        userMapper.updateVisited(id);
    }

    @Override
    public void userInsert(User member) {
        userMapper.userInsert(member);
    }

    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        boolean comp = false;
        User member = userMapper.loginCheck(id);

        if(member!=null && pwEncoder.matches(pw, member.getPw())){
            comp = true;
        } else {
            comp = false;
        }
        return comp;
    }

    @Override
    public void userEdit(User member) throws Exception{ userMapper.userEdit(member); }

    @Override
    public void userDelete(String id) throws Exception { userMapper.userDelete(id);}

    @Override
    public int userCnt() throws Exception {
        return userMapper.userCnt();
    }

//    @Override
//    public List<AdminChartVO> adminChart() throws Exception {
//        return userMapper.adminChart();
//    }
}
