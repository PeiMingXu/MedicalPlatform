package com.xmut.controller;

import com.xmut.entity.PageResult;
import com.xmut.pojo.Dg_Prescript;
import com.xmut.pojo.Druggist;
import com.xmut.pojo.User;
import com.xmut.service.DruggistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DruggistController {

    @Autowired
    private DruggistService druggistService;

    @RequestMapping("/druggist")
    public ModelAndView selectDruggistById(HttpSession session) {
        //调用service获取数据
        User users = (User) session.getAttribute("USER_SESSION");
        //查询个人性息
        Druggist druggist = druggistService.selectDruggistById(users.getPhone());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/druggist");
        modelAndView.addObject("druggist", druggist);
        return modelAndView;
    }
    //获取用户信息
    @RequestMapping("/searchDruggist")
    public ModelAndView findByAll(Dg_Prescript dg_prescript, Integer pageNum, Integer pageSize, HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        //设置分页的默认值
        if (pageNum==null){
            pageNum=1;//默认为一页
        }
        if (pageSize==null){
            pageSize=5;//默认一页10条数据
        }
        //调用service
        PageResult pageResult = druggistService.findByAll(dg_prescript, pageNum, pageSize);
        //页面
        modelAndView.setViewName("/admin/CertificateList");
        //数据
        //搜索信息框回显
        modelAndView.addObject("searchDruggist",dg_prescript);
        //分页数据信息
        modelAndView.addObject("pageResult",pageResult);
        //当前页码
        modelAndView.addObject("pageNum",pageNum);
        //分页请求再次请求的地址
        modelAndView.addObject("gourl",request.getRequestURI());
        return modelAndView;
    }

    @RequestMapping("/CertificateUpdate")
    public ModelAndView selectDruggistById1(HttpSession session) {
        //调用service获取数据
        User users = (User) session.getAttribute("USER_SESSION");
        //查询个人性息
        Druggist druggist = druggistService.selectDruggistById(users.getPhone());
        System.out.println("信息=="+druggist);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/CertificateList");
        modelAndView.addObject("druggist", druggist);
        return modelAndView;
    }

    // 处理修改密码的请求
    @RequestMapping("/updateDruggist")
    public ModelAndView updatePassword(String oldPassword, String newPassword, HttpSession session) {
        // 获取当前登录用户的信息
        User user = (User) session.getAttribute("USER_SESSION");
        // 根据用户手机号查询药剂师信息
        Druggist druggist = druggistService.selectDruggistById(user.getPhone());
        System.out.println("123==" + druggist);
        ModelAndView modelAndView = new ModelAndView();
        // 验证旧密码是否正确
        if (!druggist.getPwd().equals(oldPassword)) {
            // 旧密码不正确
            modelAndView.addObject("result", "failed");
        } else {
            // 更新密码
            druggist.setPwd(newPassword);
            int count = druggistService.updateDruggist(druggist);
            if (count > 0) {
                // 更新成功
                modelAndView.addObject("result", "success");
            } else {
                // 更新失败
                modelAndView.addObject("result", "failed");
            }
        }
        // 设置视图名称并返回ModelAndView
        modelAndView.setViewName("/admin/CertificateUpdate");
        modelAndView.addObject("druggist", druggist);
        return modelAndView;


    }
    @RequestMapping("/selectDg_PrescriptAll")
    public String selectDg_PrescriptAll(HttpServletRequest request){
        //获取药单
        List<Dg_Prescript> dg_prescript=druggistService.selectDg_PrescriptAll();
        request.setAttribute("dg_prescript",dg_prescript);
        System.out.println("药单详情"+dg_prescript);
        return "./admin/selectPrescript";
    }

    @RequestMapping("updatePrescriptionById")
    public String updatePrescriptionById(Dg_Prescript dg_prescript, HttpSession session) {
        //审核药单
        User users = (User) session.getAttribute("USER_SESSION");
        dg_prescript.setDr_id(users.getId());
        int i = druggistService.updatePrescriptionById(dg_prescript);
        System.out.println("修改了" + i + "条数据");
        return "redirect:./admin/selectPrescript.jsp";
    }

    @RequestMapping("selectDg_PrescriptByUser")
    public String selectDg_PrescriptByUser(HttpServletRequest request,HttpSession session){
        //查询个人审核药单
        User users = (User) session.getAttribute("USER_SESSION");
        Druggist dg_prescript=druggistService.selectDg_PrescriptByUser(users.getPhone());
        request.setAttribute("dg_prescripts",dg_prescript);
        return "/admin/selectPrescriptAll";
    }
}
