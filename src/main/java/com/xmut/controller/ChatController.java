package com.xmut.controller;

import com.xmut.mapper.DcPrescriptMapper;
import com.xmut.mapper.DoctorMapper;
import com.xmut.mapper.UserMapper;
import com.xmut.pojo.*;
import com.xmut.service.ChatService;

import com.xmut.service.DrugsService;
import com.xmut.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author
 * @date: 2023/4/25
 **/
@Controller
public class ChatController {
    @Autowired
    private ChatService chatService;
    @Autowired
    private DoctorMapper doctorMapper;
    @Autowired
    private DrugsService drugsService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DcPrescriptMapper dcPrescriptMapper;

    @RequestMapping(value = "/jifen", method = { RequestMethod.GET })
    public String jifen(Integer user_id,HttpSession session, Chat chat,Model model) {
        User user =(User) session.getAttribute("USER_SESSION");
        Doctor doctor = doctorMapper.selectDoctorById(user_id);
        List<Doctor> doctorList =doctorMapper.findByDep2(doctor.getDc_department());
        model.addAttribute("doctor", doctor);
        model.addAttribute("doctorList", doctorList);
        model.addAttribute("user", user);
        if(doctorMapper.selectDoctorById(user.getId()).getUser_balance()<1){
            model.addAttribute("url", "/detailDoctor?user_id="+user_id);
            model.addAttribute("infomation", "积分余额不足，进入失败");
            model.addAttribute("second", 2);
            return "/web/tip";
        }

        Doctor u = new Doctor();
        u.setUser_id(user.getId());
        int n =doctorMapper.reduceJifen(u);
        Doctor doctor1 = new Doctor();
        doctor1.setUser_id(user_id);
        int m =doctorMapper.addJifen(doctor1);
        int result = n+m;
        int num = user_id+user.getId();
        chat.setChat_number(num);
        Chat chat1=chatService.selectChatByNum(chat);
        if(chat1==null){
            chat.setDc_id(user_id);
            chat.setU_id(user.getId());
            chat.setU_name(user.getName());
            chat.setChat_number(num);
            chat.setStatus("未在线");
            chat.setCreate_time(new Date());
            chatService.insertChat(chat);
        }
        chat.setU_id(user.getId());
        //上线
        int s =chatService.zaixian(chat);
        System.out.println("上线"+s);
        model.addAttribute("chat", chat);
        if (result == 2) {
            model.addAttribute("url", "/goSay?user_id="+user_id);
            model.addAttribute("infomation", "进入成功");
            model.addAttribute("second", 2);
        } else {
            model.addAttribute("url", "/detailDoctor?user_id="+user_id);
            model.addAttribute("infomation", "进入失败");
            model.addAttribute("second", 2);
        }
        return "/web/tip";
    }
    @RequestMapping("/goSay")
    public String goSay(Integer user_id, Model model, HttpSession session) {
        System.out.println("goSay"+user_id);
        Doctor doctor = doctorMapper.selectDoctorById(user_id);
        List<Doctor> doctorList =doctorMapper.findByDep2(doctor.getDc_department());
        List<Drugs> drugsList =drugsService.allfindDurgs();
        User user =(User) session.getAttribute("USER_SESSION");
        Chat chat = chatService.selectChatByDcOrUser(user.getId());
        model.addAttribute("chat", chat);
        model.addAttribute("doctor", doctor);
        model.addAttribute("drugsList", drugsList);
        model.addAttribute("doctorList",doctorList);
        model.addAttribute("user", user);
        return "/web/goSay";
    }

    @RequestMapping(value = "/findByUserName", method = { RequestMethod.POST, RequestMethod.GET })
    public String findByUserName(String u_name, Model model) {
        List<Chat> findByName = chatService.getChatListByName(u_name);
        Pagination page = new Pagination();
        if (u_name != null && !u_name.equals("")) {
            page.setFlay(false);
        }
        model.addAttribute("page", page);
        model.addAttribute("chatList", findByName);
        return "/web/chatList";
    }
    @RequestMapping(value = "/chatList", method = { RequestMethod.POST, RequestMethod.GET })
    public String chatList(HttpServletRequest request, Model model, HttpSession session) {
        User user =(User) session.getAttribute("USER_SESSION");
//        Doctor doctor = new Doctor();
//        doctor.setUser_id(user.getId());
//        //上线
//        doctorMapper.shangxian(doctor);
        User user1=userMapper.findById(user.getId());
        Chat chat = chatService.selectChatByDcOrUser(user1.getId());
        Pagination page = new Pagination();
        String start = request.getParameter("start");
        if (start != null) {
            page.setStart(Integer.parseInt(start));
        }
        List<Chat> chatList = chatService.findByDc(user1.getId());
        DcPrescript dcPrescript = new DcPrescript();
        dcPrescript.setP_user(user1.getId());
        List<DcPrescript> dcPrescriptList = dcPrescriptMapper.findByUid(dcPrescript);
        for (DcPrescript dcPrescript1 : dcPrescriptList) {
            dcPrescript1.setUsername(userMapper.findById(dcPrescript1.getP_user()).getName());
            dcPrescript1.setDoctorname(userMapper.findById(dcPrescript1.getDc_id()).getName());
        }
//        List<Chat> chatList = chatService.pageChat(page);
//        int total = chatService.total();
//        page.caculateLast(total);
//        List<DcPrescript> dcPrescriptList = null;
        model.addAttribute("chat", chat);
        model.addAttribute("user", user1);
        model.addAttribute("page", page);
        model.addAttribute("chatList", chatList);
        model.addAttribute("dcPrescriptList", dcPrescriptList);
        return "/web/index";
    }
    @RequestMapping("/goSayByDc")
    public String goSayByDc(Integer u_id, Model model, HttpSession session) {
        User user =(User) session.getAttribute("USER_SESSION");
        Doctor doctor = doctorMapper.selectDoctorById(user.getId());
        List<Doctor> doctorList =doctorMapper.findByDep2(doctor.getDc_department());
        List<Drugs> drugsList =drugsService.allfindDurgs();
        Chat chat = chatService.selectChatByDcOrUser(u_id);
        model.addAttribute("chat", chat);
        model.addAttribute("drugsList", drugsList);
        model.addAttribute("doctor", doctor);
        model.addAttribute("doctorList",doctorList);
        model.addAttribute("user", user);
        return "/web/goSay";
    }
//    @RequestMapping("/userDetail")
//    public String userDetail(String id, Model model) {
//        User user = userService.selectUserById(id);
//        List<WareHouse> allList = WareHouseMapper.allWareHouse();
//        model.addAttribute("allList", allList);
//        model.addAttribute("user", user);
//        return "userDetail";
//    }
//    @RequestMapping(value = "/xiaxian", method = RequestMethod.POST)
//    public String xiaxian(String dc_department, Model model,HttpSession session){
//        System.out.println("下线操作");
//        User user =(User) session.getAttribute("USER_SESSION");
//        Doctor doctor = new Doctor();
//        doctor.setUser_id(user.getId());
//        //下线
//        doctorMapper.xiaxian(doctor);
//        List<Doctor> doctorList =doctorMapper.findByDep1(dc_department);
//        model.addAttribute("doctorList", doctorList);
//        return "/web/DoctorList";
//    }

    @RequestMapping(value = "/xiaxianChat", method = RequestMethod.GET)
    public String xiaxianChat(String dc_department, Model model,HttpSession session){
        System.out.println("chat下线操作");
        User user =(User) session.getAttribute("USER_SESSION");
        System.out.println(user.getRole());
        if(user.getRole().equals("doctor")){
            Doctor doctor = new Doctor();
            doctor.setUser_id(user.getId());
            //下线
            int n=doctorMapper.xiaxian(doctor);
            System.out.println("医生下线"+n);
        }else{
            Chat chat = new Chat();
            chat.setU_id(user.getId());
            //下线
            int m =chatService.xiaxianChat(chat);
            System.out.println("用户下线"+m);
        }
        List<Doctor> doctorList =doctorMapper.findByDep1(dc_department);
        model.addAttribute("doctorList", doctorList);
        return "/web/DoctorList";
    }
    @RequestMapping(value = "/shangxian", method = { RequestMethod.GET })
    public String shangxian(HttpSession session){
        User user =(User) session.getAttribute("USER_SESSION");
        Doctor doctor = new Doctor();
        doctor.setUser_id(user.getId());
        //上线
        int n=doctorMapper.shangxian(doctor);
        System.out.println("上线"+n+doctor);
        return "/web/tiao";
    }

    @RequestMapping(value = "/xiaxian", method = { RequestMethod.GET })
    public String xiaxian(HttpSession session){
        User user =(User) session.getAttribute("USER_SESSION");
        Doctor doctor = new Doctor();
        doctor.setUser_id(user.getId());
        //下线
        int n=doctorMapper.xiaxian(doctor);
        System.out.println("下线"+n+doctor);
        return "/web/tiao";
    }
}
