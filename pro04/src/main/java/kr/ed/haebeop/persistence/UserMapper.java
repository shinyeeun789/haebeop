package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    public List<User> userList();
    public User getUser(String id);
    public void updateVisited(String id);
    public void userInsert(User member);
    public User loginCheck(String id);
    public void userEdit(User member);
    public void userDelete(String id);
    public int userCnt();
    public void updatePt(Map<String, Object> data);
    public void minusPoint(Map<String, String> data);

}
