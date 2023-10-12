package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Event;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface EventMapper {
    public List<Event> eventList(Page page) throws Exception;
    public Event eventDetail(int eno) throws Exception;
    public Event eventRef(Map<String, Object> data) throws Exception;
    public void updateCnt(int eno) throws Exception;
    public int getCount(Page page) throws Exception;
    public void eventInsert(Event event) throws Exception;
    public void eventDelete(int eno) throws Exception;
    public void eventEdit(Event event) throws Exception;
    public List<Event> ongoingEvents() throws Exception;
    public List<Event> ongoingEvents(Page page) throws Exception;
}
