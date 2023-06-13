package com.xmut.mapper;

import com.xmut.pojo.DcPrescript;

import java.util.List;

/**
 * @author
 * @date: 2023/5/19
 **/
public interface DcPrescriptMapper {
    int addPrescript(DcPrescript dcPrescript);

    List<DcPrescript> findByUid(DcPrescript dcPrescript);

}
