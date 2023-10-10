package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {
    public List<User> userList();
    public User getUser(String id);
    public User updateVisited(String id);
    public void userInsert(User member);
    public User loginCheck(String id);
    public void userEdit(User member);
    public void userDelete(String id);
    public int userCnt();

}
