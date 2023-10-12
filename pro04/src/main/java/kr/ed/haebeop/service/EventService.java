package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Event;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface EventService {
    public List<Event> eventList(Page page) throws Exception;
    public Event eventDetail(int eno) throws Exception;

    public Event eventRef(int eno, String type) throws Exception;
    public int getCount(Page page) throws Exception;
    public void eventInsert(Event event) throws Exception;
    public void eventDelete(int eno) throws Exception;
    public void eventEdit(Event event) throws Exception;
    public List<Event> ongoingEvents() throws Exception;
    public List<Event> ongoingEvents(Page page) throws Exception;
}
