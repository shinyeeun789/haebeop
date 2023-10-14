package kr.ed.haebeop.service;

public interface RegisterService {

    public boolean isReg(String lcode, String id) throws Exception;
    public String registerInsert(String id, String lcode) throws Exception;

}
