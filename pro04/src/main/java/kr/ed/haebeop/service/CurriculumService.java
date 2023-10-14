package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curriculum;

import java.util.List;

public interface CurriculumService {

    public List<Curriculum> curriculumList(String lcode) throws Exception;

    public void curriculumInsert(List<Curriculum> curriculumList) throws Exception;

}
