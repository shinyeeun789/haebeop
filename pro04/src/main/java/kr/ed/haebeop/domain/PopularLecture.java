package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class PopularLecture {
    private String lcode;
    private String lname;
    private int lprice;
    private String saveFile;
    private int star;
}
