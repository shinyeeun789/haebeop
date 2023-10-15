package kr.ed.haebeop.persistence;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface RegisterMapper {

    public boolean isReg(Map<String, String> data) throws Exception;
    public boolean isMaxStudent(String lcode) throws Exception;
    public void registerInsert(Map<String, String> data) throws Exception;
    public int isPeriod(String lcode) throws Exception;

}
