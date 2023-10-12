package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Event;
import kr.ed.haebeop.persistence.EventMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    private EventMapper eventMapper;

    @Override
    public List<Event> eventList(Page page) throws Exception {
        return eventMapper.eventList(page);
    }

    @Override
    @Transactional
    public Event eventDetail(int eno) throws Exception {
        eventMapper.updateCnt(eno);
        return eventMapper.eventDetail(eno);
    }

    @Override
    public Event eventRef(int eno, String type) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("eno", eno);
        data.put("type", type);
        return eventMapper.eventRef(data);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return eventMapper.getCount(page);
    }

    @Override
    public void eventInsert(Event event) throws Exception {
        eventMapper.eventInsert(event);
    }

    @Override
    public void eventDelete(int eno) throws Exception {
        eventMapper.eventDelete(eno);
    }

    @Override
    public void eventEdit(Event event) throws Exception {
        eventMapper.eventEdit(event);
    }

    @Override
    public List<Event> ongoingEvents() throws Exception {
        return eventMapper.ongoingEvents();
    }

    @Override
    public List<Event> ongoingEvents(Page page) throws Exception {
        return eventMapper.ongoingEvents(page);
    }
}
