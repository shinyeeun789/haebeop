package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Apply;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface ApplyMapper {
    public Apply getApply (Map<String, Object> data) throws Exception;
    public int getCount(int appno) throws Exception;
    public Apply appCheck(String id) throws Exception;
    public void applyInsert(Apply apply) throws Exception;
    public void applyDelete(int appno) throws Exception;
    public int applyCnt() throws Exception;
}
