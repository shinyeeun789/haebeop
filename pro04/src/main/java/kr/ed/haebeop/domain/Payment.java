package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class Payment {

    private int pno;
    private String lcode;
    private String id;
    private String impUid;
    private String merchantUid;
    private int amount;
    private String applyNum;
    private String resdate;

}
