package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Curriculum;
import kr.ed.haebeop.persistence.CurriculumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurriculumServiceImpl implements CurriculumService {

    @Autowired
    private CurriculumMapper curriculumMapper;

    @Override
    public List<Curriculum> curriculumList(String lcode) throws Exception {
        return curriculumMapper.curriculumList(lcode);
    }

    @Override
    public void curriculumInsert(List<Curriculum> curriculumList) throws Exception {
        for (Curriculum curr : curriculumList) {
            curriculumMapper.curriculumInsert(curr);
        }
    }
}
