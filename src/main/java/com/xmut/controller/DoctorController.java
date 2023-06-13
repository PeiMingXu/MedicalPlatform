package com.xmut.controller;

import com.xmut.mapper.ChatMapper;
import com.xmut.pojo.Doctor;
import com.xmut.pojo.User;
import com.xmut.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author
 * @date: 2023/4/25
 **/
@Controller
public class DoctorController {
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private ChatMapper chatMapper;

@RequestMapping(value = "/findByDep1", method = { RequestMethod.POST, RequestMethod.GET })
public String findByDep1(Model model, String dc_department) {
    List<Doctor> doctorList =doctorService.findByDep1(dc_department);
    model.addAttribute("doctorList", doctorList);
    return "/web/DoctorList";
}
    @RequestMapping(value = "/findByName", method = { RequestMethod.GET })
    public String findByName(Model model, String user_name) {
        System.out.println("byname"+user_name);
        List<Doctor> doctorList =doctorService.findByName(user_name);
        model.addAttribute("doctorList", doctorList);
        return "/web/DoctorList";
    }
    @RequestMapping("/detailDoctor")
    public String detailDoctor(int user_id, Model model, HttpSession session) {
        Doctor doctor = doctorService.selectDoctorById(user_id);
        List<Doctor> doctorList =doctorService.findByDep2(doctor.getDc_department());
        User user =(User) session.getAttribute("USER_SESSION");
        model.addAttribute("doctor", doctor);
        model.addAttribute("doctorList",doctorList);
        model.addAttribute("user", user);
        return "/web/detailDoctor";
    }

    @RequestMapping("/dianzan")
    public String dianzan(int user_id, Model model, HttpSession session) {
        System.out.println("dfs"+user_id);
        Doctor doctor = doctorService.selectDoctorById(user_id);
        List<Doctor> doctorList =doctorService.findByDep2(doctor.getDc_department());
        User user =(User) session.getAttribute("USER_SESSION");
        model.addAttribute("doctor", doctor);
        model.addAttribute("doctorList",doctorList);
        model.addAttribute("user", user);
        int result = doctorService.dianzan(doctor);
        if (result == 1) {
            model.addAttribute("url", "/detailDoctor?user_id="+user_id);
            model.addAttribute("infomation", "点赞成功");
            model.addAttribute("second", 2);
        } else {
            model.addAttribute("url", "/detailDoctor?user_id="+user_id);
            model.addAttribute("infomation", "点赞失败");
            model.addAttribute("second", 2);
        }
        return "/web/tip";
    }
    @RequestMapping(value = "/updateDoctor")
    @ResponseBody
    public Map<String, Object> updateDoctor(Doctor doctor)
            throws IllegalStateException, IOException {
        System.out.println("更新方法");
        System.out.println(doctor);
//        System.out.println(oldimg);
//        System.out.println(file);
        Map<String, Object> result = new HashMap<>();
        if(doctor.getDc_image()!=null){
            String img = "";
            String [] f0=doctor.getDc_image().split("\\\\");
            for (int i = 0; i < f0.length; i++) {
                img=f0[i];
            }
            doctor.setDc_image(img);
        }
//        if (!file.isEmpty()) {
//            System.out.println("测试");
//            String path = "D:/upload/";// ���أ�Ŀ¼Ҫ����
//            String filename = file.getOriginalFilename();
//            SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// �������ڸ�ʽ
//            String fname = df.format(new Date()).toString();
//            int n = filename.lastIndexOf('.');
//            String expf = filename.substring(n + 1);
//            filename = fname + "." + expf;
//            // ====
//            File filepath = new File(path, filename);
//            if (!filepath.getParentFile().exists()) {
//                filepath.getParentFile().mkdirs();
//            }
//            file.transferTo(new File(path + File.separator + filename));
//            doctor.setDc_image(filename);
//
//            // ɾ��ԭ����ͼƬ
//            File delfile = new File(path + oldimg);
//            delfile.delete();
//        } else {
//            // û���ϴ���ͼƬ
//            doctor.setDc_image(oldimg);
//        }
        int integer = doctorService.updateDoctor(doctor);
        if (integer > 0) {
            result.put("success", true);
            result.put("msg", "修改成功");
            result.put("redirectUrl", "/xiaxianChat?dc_department=内科");
            return result;
        } else {
            result.put("success", false);
            result.put("msg", "修改失败，请稍后再试");
            return result;
        }
    }

}
