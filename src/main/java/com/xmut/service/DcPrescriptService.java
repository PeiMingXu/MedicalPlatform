package com.xmut.service;


import com.xmut.pojo.DcPrescript;

import java.util.List;


/**
 * @author
 * @date: 2023/5/19
 **/
public interface DcPrescriptService {

    int addPrescript(DcPrescript dcPrescript);

    List<DcPrescript> findByUid(DcPrescript dcPrescript);

}
