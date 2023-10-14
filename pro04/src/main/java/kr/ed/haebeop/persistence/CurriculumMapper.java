package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Curriculum;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CurriculumMapper {

    public List<Curriculum> curriculumList(String lcode) throws Exception;
    public void curriculumInsert(Curriculum curriculum) throws Exception;

}
