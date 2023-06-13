package com.xmut.service.impl;

import com.xmut.pojo.DcPrescript;
import com.xmut.service.DcPrescriptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author
 * @date: 2023/5/19
 **/
@Service
public class DcPrescriptServiceImpl implements DcPrescriptService {
    @Autowired
    private DcPrescriptService dcPrescriptService;
    @Override
    public int addPrescript(DcPrescript dcPrescript) {
        return dcPrescriptService.addPrescript(dcPrescript);
    }

    @Override
    public List<DcPrescript> findByUid(DcPrescript dcPrescript) {
        return dcPrescriptService.findByUid(dcPrescript);
    }
}
