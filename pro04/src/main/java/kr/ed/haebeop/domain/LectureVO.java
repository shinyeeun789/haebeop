package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LectureVO {

    private String lcode;
    private String lname;
    private String sname;
    private String tname;
    private String lcontent;
    private int lprice;
    private int maxStudent;
    private String sdate;
    private String edate;
    private String stime;
    private String state;
    private String classroom;

}
