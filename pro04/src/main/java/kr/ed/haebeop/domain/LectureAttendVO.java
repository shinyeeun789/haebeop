package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LectureAttendVO {

    private String lcode;
    private String id;
    private String name;
    private String adate;
    private String atime;
    private String atype;

}
