package com.xmut.controller;

import com.xmut.mapper.DcPrescriptMapper;
import com.xmut.mapper.DoctorMapper;
import com.xmut.pojo.DcPrescript;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author
 * @date: 2023/5/19
 **/
@Controller
public class DcPrescriptController {
     @Autowired
    private DcPrescriptMapper dcPrescriptMapper;
    @Autowired
    private DoctorMapper doctorMapper;
    @RequestMapping(value = "/updateDcPrescript")
    @ResponseBody
    public Map<String, Object> updateDcPrescript(DcPrescript dcPrescript)
            throws IllegalStateException, IOException {
        System.out.println("adj"+dcPrescript);
        Map<String, Object> result = new HashMap<>();
        int integer = dcPrescriptMapper.addPrescript(dcPrescript);
        System.out.println("结果"+integer);
        if (integer > 0) {
            result.put("success", true);
            result.put("msg", "药单添加成功,请等待审核...");
//            result.put("redirectUrl", "/xiaxianChat?dc_department=内科");
            return result;
        } else {
            result.put("success", false);
            result.put("msg", "药单添加失败，请稍后再试");
            return result;
        }
    }

//    @RequestMapping(value = "/findByUid", method = { RequestMethod.POST, RequestMethod.GET })
//    public String findByUid(Model model, int p_user) {
//        DcPrescript dcPrescript = new DcPrescript();
//        dcPrescript.setP_user(p_user);
//        List<DcPrescript> dcPrescriptList=dcPrescriptService.findByUid(dcPrescript);
//        model.addAttribute("dcPrescriptList", dcPrescriptList);
//        return "/web/index";
//    }


}
