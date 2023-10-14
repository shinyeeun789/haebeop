package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;

import java.util.List;

public interface ReviewService {

    public List<Review> reviewList(String type, String lcode) throws Exception;
    public int starAvg(String lcode) throws Exception;
    public void reviewInsert(Review review) throws Exception;

}
