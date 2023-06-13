package com.xmut.controller;

import com.xmut.entity.PageResult;
import com.xmut.entity.Result;
import com.xmut.pojo.Certificates;
import com.xmut.pojo.Prescript;
import com.xmut.pojo.User;
import com.xmut.service.CertificatesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author
 * @date: 2023/5/31
 **/
@Controller
public class CertificatesController {
    @Autowired
    private CertificatesService certificatesService;

    //获取全部药方
    @RequestMapping("/searchCertificates")
    public ModelAndView findByAll(Certificates certificates, Integer pageNum, Integer pageSize, HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        //设置分页的默认值
        if (pageNum==null){
            pageNum=1;//默认为一页
        }
        if (pageSize==null){
            pageSize=10;//默认一页10条数据
        }
        //调用service
        PageResult pageResult = certificatesService.findByAll(certificates,pageNum, pageSize);


        //页面
        modelAndView.setViewName("/admin/certificates_borrowed");
        //数据
        //搜索信息框回显
        modelAndView.addObject("searchPrescript",certificates);
        //分页数据信息
        modelAndView.addObject("pageResult",pageResult);
        //当前页码
        modelAndView.addObject("pageNum",pageNum);
        //分页请求再次请求的地址
        modelAndView.addObject("gourl",request.getRequestURI());
        return modelAndView;
    }
    //通过id获取证书信息
    @RequestMapping("/findBy_d")
    @ResponseBody
    public Result<Certificates> findBy_d(int id){
        //调用service
        Certificates certificates = certificatesService.findById(id);
        return new Result<>(true,"", certificates);
    }

    //证书审核
    @PostMapping("/borrowCertificates")
    @ResponseBody
    public Map<String, Object> borrowCertificates(Certificates certificates) {
        Map<String, Object> result = new HashMap<>();
        Integer status = certificates.getDg_status();
        System.out.println("certificates==="+certificates);
        //如果状态为1，审核
        if (status==1){
            certificates.setDg_status(3);
            //调用service
            Integer success = certificatesService.borrowCertificates(certificates);
            if (success >0) {
                result.put("success", true);
                result.put("msg", "审核通过");
                result.put("redirectUrl", "./searchCertificates");
                return result;
            } else {
                result.put("success", false);
                result.put("msg", "审核失败，请稍后再试");
                return result;
            }
        }
        return result;
    }

    //证书驳回
    @PostMapping("/borrowCertificates1")
    @ResponseBody
    public Map<String, Object> borrowCertificates1(Certificates certificates) {
        Map<String, Object> result = new HashMap<>();
        Integer status = certificates.getDg_status();
        System.out.println("certificates==="+certificates);
        //如果状态为1,驳回
        if (status==1){
            certificates.setDg_status(2);
            //调用service
            boolean success = certificatesService.addCertificates(certificates);
            if (success) {
                result.put("success", true);
                result.put("msg", "驳回成功");
                result.put("redirectUrl", "./searchCertificates");
                return result;
            } else {
                result.put("success", false);
                result.put("msg", "驳回失败，请稍后再试");
                return result;
            }
        }
        return result;
    }




}
