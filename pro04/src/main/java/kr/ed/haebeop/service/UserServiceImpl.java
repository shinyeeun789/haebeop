package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.persistence.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @Override
    public List<User> userList() throws Exception {return userMapper.userList(); }

    @Override
    public User getUser(String id) throws Exception {
        return userMapper.getUser(id);
    }

    @Override
    public boolean idCheck(String id) throws Exception {
        return userMapper.getUser(id) == null ? true : false;
    }

    @Override
    public void updateVisited(String id) throws Exception {
        userMapper.updateVisited(id);
    }

    @Override
    public void userInsert(User user) throws Exception {
        userMapper.userInsert(user);
    }

    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        boolean comp = false;
        User user = userMapper.loginCheck(id);

        if(user!=null && pwEncoder.matches(pw, user.getPw())){
            comp = true;
        } else {
            comp = false;
        }
        return comp;
    }

    @Override
    public void userEdit(User user) throws Exception{ userMapper.userEdit(user); }

    @Override
    public void userDelete(String id) throws Exception { userMapper.userDelete(id);}

    @Override
    public int userCnt() throws Exception {
        return userMapper.userCnt();
    }

    @Override
    public void updateIsStudy(String id, boolean isStudy) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("id", id);
        data.put("isStudy", isStudy);
        userMapper.updateIsStudy(data);
    }

    @Override
    public boolean getIsStudy(String id) throws Exception {
        return userMapper.getIsStudy(id);
    }

    //    @Override
//    public List<AdminChartVO> adminChart() throws Exception {
//        return userMapper.adminChart();
//    }
}
