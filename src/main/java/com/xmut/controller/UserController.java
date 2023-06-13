package com.xmut.controller;

import com.xmut.entity.PageResult;
import com.xmut.entity.Result;
import com.xmut.pojo.User;
import com.xmut.service.UserService;
import com.xmut.utils.MyTask;
import com.xmut.utils.SMSUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author
 * @date: 2023/4/25
 **/
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/Edglog")
    public String Edglog() {
        return "main";
    }

//登陆验证
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(User user, HttpServletRequest request, String Code) {
        Map<String, Object> result = new HashMap<>();

        System.out.println("user=" + user);
        System.out.println("Code=" + Code);

        // //获取session验证码
        // JSONObject json = (JSONObject) request.getSession().getAttribute("MsCode");
        // if (!json.getString("Code").equals(Code)) {
        //     result.put("success", false);
        //     result.put("msg", "验证码错误");
        //     return result;
        // }else if((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60 * 1) {
        //     result.put("success", false);
        //     result.put("msg", "验证码过期");
        //     return result;
        // }else {

            //调用service
            User dbUser = userService.login(user);
            System.out.println("dbUser==" + dbUser);
            if (dbUser == null) {
                /// 登录失败
                result.put("success", false);
                result.put("msg", "用户名或密码错误");
                return result;
            } else {
                //登陆成功
                request.getSession().setAttribute("USER_SESSION", dbUser);//将对象存入session
                User user_session = (User) request.getSession().getAttribute("USER_SESSION");
                user_session.getPhone();
                System.out.println("asdf"+user_session.getPhone());
                if (dbUser.getRole().equals("admin")){
                result.put("success", true);
                result.put("msg", "登陆成功");
                result.put("redirectUrl", "./admin/main.jsp");
                return result;
           }else
           if (dbUser.getRole().equals("user")){
                    result.put("success", true);
                    result.put("msg", "登陆成功");
                    result.put("redirectUrl", "./web/tiao.jsp");
                    return result;
                }else
           if (dbUser.getRole().equals("pharmacist")){
                    result.put("success", true);
                    result.put("msg", "登陆成功");
                    result.put("redirectUrl", "./admin/druggist.jsp");
                    return result;
           }else
           if (dbUser.getRole().equals("doctor")){
               result.put("success", true);
               result.put("msg", "登陆成功");
               result.put("redirectUrl", "./web/tiao.jsp");
               return result;
           }


                return result;
            }
        }
     // }


    //点击发送验证码
    @PostMapping("/sendMs")
    //@RequestMapping(value = "/sendMs", method = RequestMethod.POST)
    @ResponseBody
    public String sendMs (HttpServletRequest request,String phone){
        if(phone!=null && !phone.equals("")){
            String success = SMSUtil.sendSMS(request,phone);
            System.out.println("success=="+success);
            return success;

        }else{
            return "error";
        }
    }

    //用户注册
    @PostMapping("/addUser")
    @ResponseBody
    public Map<String, Object> addUser(User user, HttpServletRequest request, String Code){
        Map<String, Object> result = new HashMap<>();

        //获取session验证码
        JSONObject json = (JSONObject) request.getSession().getAttribute("MsCode");
        if (!json.getString("Code").equals(Code)) {
            result.put("success", false);
            result.put("msg", "验证码错误");
            return result;
        } else if ((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60 * 1) {
            result.put("success", false);
            result.put("msg", "验证码过期");
            return result;
        } else {
            //先判断该用户是否已经存在
            String existedUser = userService.findPhone(user.getPhone());
            System.out.println("existedUser==" + existedUser);
            if (existedUser != null) {
                result.put("success", false);
                result.put("msg", "该用户名已被注册");
                return result;
            } else {

                //调用service保存用户信息
                // user.setRole(selectedOption);
                boolean success = userService.logon(user);
                if (success) {
                    result.put("success", true);
                    result.put("msg", "注册成功");
                    result.put("redirectUrl", "./admin/login.jsp");
                    return result;
                } else {
                    result.put("success", false);
                    result.put("msg", "注册失败，请稍后再试");
                    return result;
                }
            }
        }
     }

    //获取用户信息
    @RequestMapping("/search")
    public ModelAndView findByAll(User user,Integer pageNum, Integer pageSize, HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        //设置分页的默认值
        if (pageNum==null){
            pageNum=1;//默认为一页
        }
        if (pageSize==null){
            pageSize=10;//默认一页10条数据
        }
        //调用service
        PageResult pageResult = userService.findByAll(user, pageNum, pageSize);


        //页面
        modelAndView.setViewName("/admin/users");
        //数据
        //搜索信息框回显
        modelAndView.addObject("search",user);
        //分页数据信息
        modelAndView.addObject("pageResult",pageResult);
        //当前页码
        modelAndView.addObject("pageNum",pageNum);
        //分页请求再次请求的地址
        modelAndView.addObject("gourl",request.getRequestURI());
        return modelAndView;
    }

   //通过id获取图书信息
   @RequestMapping("/findById")
   @ResponseBody
    public Result<User> findById(int id){

        //调用service
        User user = userService.findById(id);
        return new Result<>(true,"", user);
    }

    //账号封禁,解封
    @PostMapping("/borrowUser")
    @ResponseBody
    public Map<String, Object> borrowUser(User user) {
        Map<String, Object> result = new HashMap<>();
        Integer status = user.getStatus();
        //如果状态为1，解封
        if (status==1){
            user.setStatus(0);
            //调用service
            Integer success = userService.borrowUser(user);
            if (success >0) {
                result.put("success", true);
                result.put("msg", "封禁成功");
                result.put("redirectUrl", "./search");
                return result;
            } else {
                result.put("success", false);
                result.put("msg", "封禁失败，请稍后再试");
                return result;
            }
        }else {
            //如果状态为0,封禁
            //设置用户的状态
            user.setStatus(1);
            //调用service
            Integer success = userService.borrowUser(user);
            if (success > 0) {
                result.put("success", true);
                result.put("msg", "封禁成功");
                result.put("redirectUrl", "./search");
                return result;
            } else {
                result.put("success", false);
                result.put("msg", "封禁失败，请稍后再试");
                return result;
            }
        }
        }




      //添加用户
      @PostMapping("/addByUser")
      @ResponseBody
      public  Map<String, Object> addByUser(User user,HttpServletRequest request){
          Map<String, Object> result = new HashMap<>();
              //需要判断手机号是否存在
              String existedUser = userService.findPhone(user.getPhone());
              if (existedUser != null) {
                  result.put("success", false);
                  result.put("msg", "该用户名已被注册");
                  return result;
              } else {
                  //调用service保存用户信息
                  boolean success = userService.logon(user);
                  if (success) {
                      result.put("success", true);
                      result.put("msg", "添加成功");
                      result.put("redirectUrl", "./search");
                      return result;
                  } else {
                      result.put("success", false);
                      result.put("msg", "添加失败，请稍后再试");
                      return result;
                  }
              }
          }

    //编辑用户
    @PostMapping("/editUser")
    @ResponseBody
    public  Map<String, Object> editUser(User user,HttpServletRequest request){
        Map<String, Object> result = new HashMap<>();
            //调用service保存用户信息
        Integer integer = userService.esitUser(user);
        if (integer > 0) {
                result.put("success", true);
                result.put("msg", "修改成功");
                result.put("redirectUrl", "./search");
                return result;
            } else {
                result.put("success", false);
                result.put("msg", "修改失败，请稍后再试");
                return result;
            }
        }





    //退出
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();//销毁session
        return "/admin/login";//返回登陆界面
    }

}
