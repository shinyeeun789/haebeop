package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.User;

import java.util.List;

public interface UserService {
    public List<User> userList() throws Exception;
    public User getUser(String id);
    public boolean idCheck(String id);
    public void userInsert(User user);
    public boolean loginCheck(String id, String pw) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void userEdit(User user) throws Exception;
    public void userDelete(String id) throws Exception;
    public int userCnt() throws Exception;

//    public List<AdminChartVO> adminChart() throws Exception;
}
