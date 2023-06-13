package com.xmut.controller;

import com.xmut.pojo.Dg_certificate;
import com.xmut.pojo.Druggist;
import com.xmut.pojo.User;
import com.xmut.service.Dg_certificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
public class Dg_certificateController {
    @Autowired
    private Dg_certificateService dg_certificateService;

//    @RequestMapping("/dg_certificates")
//    public ModelAndView selectDg_certificateById(HttpSession session) {
//        //根据药剂师id查询证书
//        User users = (User) session.getAttribute("USER_SESSION");
//        List<Dg_certificate> dg_certificates = dg_certificateService.selectDg_certificateById(users.getId());
//        System.out.println("dg_certificates======="+dg_certificates);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("/druggist/dg_certificates");
//        //创建一个list存放数据
//        List<Dg_certificate> dg_certificates1= new ArrayList<>();
//        dg_certificates1.addAll(dg_certificates);
//        modelAndView.addObject("dg_certificates", dg_certificates1);
//        return modelAndView;
//    }

    @RequestMapping("/dg_certificates")
    public ModelAndView selectDruggistByUser(HttpSession session) {
        //根据药剂师id查询证书
        User users = (User) session.getAttribute("USER_SESSION");
        Druggist druggist = dg_certificateService.selectDruggistByUser(users.getPhone());
        System.out.println("当前药剂师的证书==" + druggist);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/dg_certificates");
        modelAndView.addObject("druggist", druggist);
        return modelAndView;
    }


    @RequestMapping("/insertdgCertificate")
    public String insertdgCertificate(HttpSession session, @RequestParam("dg_picture") MultipartFile file, @RequestParam("dg_certificate.dg_name") String dgName, @RequestParam("dg_certificate.dg_grades") String dgGrades, HttpServletRequest request) throws Exception {
        // 添加证书
        User user = (User) session.getAttribute("USER_SESSION");
        Dg_certificate dg_certificate = new Dg_certificate();
        dg_certificate.setDg_id(user.getId());
        dg_certificate.setDg_name(dgName);
        dg_certificate.setDg_grades(dgGrades);
        int result = dg_certificateService.insertdgCertificate(dg_certificate);

        // 保存上传的文件
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String filePath = "D:\\ideProject\\MedicalPlatform\\src\\main\\webapp\\img" + fileName;
            File saveFile = new File(filePath);
            file.transferTo(saveFile);
            dg_certificate.setDg_picture(fileName);
            System.out.println(dg_certificate);
            dg_certificateService.updateCertificate(dg_certificate);
        }
        return "redirect:/dg_certificates";
    }

    @RequestMapping("/updatedgCertificate")
    public String insertdgCertificate(HttpSession session, @RequestParam("dg_picture") MultipartFile file,
                                      @RequestParam("dg_name") String dgName, @RequestParam("dg_grades") String dgGrades) throws Exception {
        User user = (User) session.getAttribute("USER_SESSION");
        Dg_certificate dg_certificate = new Dg_certificate();
        dg_certificate.setDg_id(user.getId());
        dg_certificate.setDg_name(dgName);
        dg_certificate.setDg_grades(dgGrades);

        int result = dg_certificateService.insertdgCertificate(dg_certificate);

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String filePath = "F:\\MedicalPlatform\\MedicalPlatform\\src\\main\\webapp\\img\\" + fileName;
            File saveFile = new File(filePath);
            file.transferTo(saveFile);

            dg_certificate.setDg_picture(fileName);
            dg_certificateService.updateCertificate(dg_certificate);
        }

        return "redirect:./admin/dg_certificates";
    }
}