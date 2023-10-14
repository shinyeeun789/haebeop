package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReviewMapper {

    public List<Review> reviewList(Map<String, String> data) throws Exception;
    public int starAvg(String lcode) throws Exception;
    public void reviewInsert(Review review) throws Exception;

}
