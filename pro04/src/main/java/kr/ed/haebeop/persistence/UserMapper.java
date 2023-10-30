package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    public List<User> userList() throws Exception;
    public User getUser(String id) throws Exception;
    public void updateVisited(String id) throws Exception;
    public void userInsert(User member) throws Exception;
    public User loginCheck(String id) throws Exception;
    public void userEdit(User member) throws Exception;
    public void userDelete(String id) throws Exception;
    public int userCnt() throws Exception;
    public void updatePt(Map<String, Object> data) throws Exception;
    public void minusPoint(Map<String, String> data) throws Exception;
    public void updateIsStudy(Map<String, Object> data) throws Exception;
    public boolean getIsStudy(String id) throws Exception;

}
