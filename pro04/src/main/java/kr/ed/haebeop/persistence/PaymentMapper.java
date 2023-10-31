package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Payment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

    public void paymentInsert(Payment payment) throws Exception;

}
