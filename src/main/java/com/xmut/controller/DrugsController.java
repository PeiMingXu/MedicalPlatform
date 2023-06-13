package com.xmut.controller;

import com.xmut.entity.PageResult;
import com.xmut.entity.Result;
import com.xmut.pojo.Drugs;

import com.xmut.pojo.User;
import com.xmut.service.DrugsService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import java.io.*;
import java.util.HashMap;
import java.util.Map;


/**
 * @author
 * @date: 2023/5/22
 **/
@Controller
public class DrugsController {

    private static final java.util.UUID UUID = null;
    @Autowired
    private DrugsService drugsService;

    //获取全部药材
    @RequestMapping("/searchDrugs")
    public ModelAndView findByAll(Drugs drugs, Integer pageNum, Integer pageSize, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //设置分页的默认值
        if (pageNum == null) {
            pageNum = 1;//默认为一页
        }
        if (pageSize == null) {
            pageSize = 10;//默认一页10条数据
        }
        //调用service
        PageResult pageResult = drugsService.findByAll(drugs, pageNum, pageSize);
        //页面
        modelAndView.setViewName("/admin/drugs_borrowed");
        //数据
        //搜索信息框回显
        modelAndView.addObject("searchDrugs", drugs);
        //分页数据信息
        modelAndView.addObject("pageResult", pageResult);
        //当前页码
        modelAndView.addObject("pageNum", pageNum);
        //分页请求再次请求的地址
        modelAndView.addObject("gourl", request.getRequestURI());
        return modelAndView;
    }

    //添加药材

    @PostMapping("/addByDrugs")
    @ResponseBody
    public Map<String, Object> addByDrugs( Drugs drugs,
                                          HttpServletRequest request,
                                          @RequestParam("d_name1") String d_name,
                                          @RequestParam("d_indication1") String d_indication,
                                          @RequestParam("d_use1") String d_use,
                                          @RequestPart("file1") MultipartFile file) throws IOException {
        Map<String, Object> result = new HashMap<>();

        System.out.println("d_name= " + d_name);
        System.out.println("d_indication= " + d_indication);
        System.out.println("d_use= " + d_use);
        System.out.println("file= " + file);

        // 1. 检查文件类型，确保上传的文件是图片类型
        if (!file.getContentType().startsWith("image/")) {
            result.put("success", false);
            result.put("msg", "文件格式不正确，只能上传图片");
            return result;
        }
        // 2. 检查文件大小，避免上传过大的文件导致服务器瘫痪
        long maxSize = 1024 * 1024 * 5;  // 5MB
        if (file.getSize() > maxSize) {
            result.put("success", false);
            result.put("msg", "文件太大，上传文件大小不能超过5MB");
            return result;
        }
        // 3. 生成新的文件名，避免文件名冲突和安全问题
        String originalFilename = file.getOriginalFilename();
        String fileExtension = StringUtils.getFilenameExtension(originalFilename);
        String newFilename = UUID.randomUUID().toString() + "." + fileExtension;

        // 4. 将药材信息添加到数据库

        String existedUser = drugsService.findDrugs(d_name);

        //判断药材是否存在
        if (existedUser!=null) {
            result.put("success", false);
            result.put("msg", "该药材已经存在");
            return result;
        }
        drugs.setD_name(d_name);
        drugs.setD_indication(d_indication);
        drugs.setD_use(d_use);
        drugs.setD_picture(newFilename);

        boolean success = drugsService.addDrugs(drugs);
        if (!success) {
            result.put("success", false);
            result.put("msg", "添加药材信息失败");
            return result;
        }

        // 5. 将图片文件上传到服务器，需要指定一个安全的路径，避免文件上传到不安全的目录
        String filePath = request.getServletContext().getRealPath("/upload/");
        File targetFile = new File(filePath, newFilename);
        if (!targetFile.getParentFile().exists()) {
            targetFile.getParentFile().mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            result.put("success", false);
            result.put("msg", "上传文件失败，请重试");
            return result;
        }
        // 6. 返回结果
        result.put("success", true);
        result.put("msg", "添加药材信息成功");
        result.put("redirectUrl", "./searchDrugs");
        return result;
    }

    //通过id获取药材信息
    @RequestMapping("/findBy_Id")
    @ResponseBody
    public Result<Drugs> findById(Integer id){
        //调用service
        Drugs drugs = drugsService.findById(id);
        return new Result<>(true,"", drugs);
    }

    //编辑药材
    @PostMapping("/editByDrugs")
    @ResponseBody
    public Map<String, Object> editByDrugs(Drugs drugs,
                                          HttpServletRequest request,
                                           @RequestParam("d_id2") Integer d_id,
                                          @RequestParam("d_name2") String d_name,
                                          @RequestParam("d_indication2") String d_indication,
                                          @RequestParam("d_use2") String d_use,
                                          @RequestPart("file2") MultipartFile file) throws IOException {
        Map<String, Object> result = new HashMap<>();
        System.out.println("d_name= " + d_id);
        System.out.println("d_name= " + d_name);
        System.out.println("d_indication= " + d_indication);
        System.out.println("d_use= " + d_use);
        System.out.println("file= " + file);

        // 1. 检查文件类型，确保上传的文件是图片类型
        if (!file.getContentType().startsWith("image/")) {
            result.put("success", false);
            result.put("msg", "文件格式不正确，只能上传图片");
            return result;
        }
        // 2. 检查文件大小，避免上传过大的文件导致服务器瘫痪
        long maxSize = 1024 * 1024 * 5;  // 5MB
        if (file.getSize() > maxSize) {
            result.put("success", false);
            result.put("msg", "文件太大，上传文件大小不能超过5MB");
            return result;
        }
        // 3. 生成新的文件名，避免文件名冲突和安全问题
        String originalFilename = file.getOriginalFilename();
        String fileExtension = StringUtils.getFilenameExtension(originalFilename);
        String newFilename = UUID.randomUUID().toString() + "." + fileExtension;

        // 4. 将药材信息添加到数据库
        String existedUser = drugsService.findDrugs(d_name);
        // //判断药材是否存在
        // if (existedUser!=null) {
        //     result.put("success", false);
        //     result.put("msg", "该药材已经存在");
        //     return result;
        // }

        // 4. 将药材信息添加到数据库
        drugs.setD_id(d_id);
        drugs.setD_name(d_name);
        drugs.setD_indication(d_indication);
        drugs.setD_use(d_use);
        drugs.setD_picture(newFilename);
        Integer findResult = drugsService.editDrugs(drugs);
        if (findResult<0) {
            result.put("success", false);
            result.put("msg", "修改药材信息失败");
            return result;
        }
        // 5. 将图片文件上传到服务器，需要指定一个安全的路径，避免文件上传到不安全的目录
        String filePath = request.getServletContext().getRealPath("/upload/");
        File targetFile = new File(filePath, newFilename);
        if (!targetFile.getParentFile().exists()) {
            targetFile.getParentFile().mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            result.put("success", false);
            result.put("msg", "上传文件失败，请重试");
            return result;
        }
        // 6. 返回结果
        result.put("success", true);
        result.put("msg", "修改药材信息成功");
        result.put("redirectUrl", "./searchDrugs");
        return result;
    }


    //药材下架，上架
    @GetMapping("/borrowDrugs")
    @ResponseBody
    public Map<String, Object> borrowDrugs(Drugs drugs) {
        Map<String, Object> result = new HashMap<>();
        Integer status = drugs.getD_status();
        System.out.println("status=="+status);
        System.out.println("Drugs=="+drugs);
        //如果状态为2，上架
        if (status==2){
            drugs.setD_status(1);
            //调用service
            Integer success = drugsService.borrowDrugs(drugs);
            if (success >0) {
                result.put("success", true);
                result.put("msg", "上架成功");
                result.put("redirectUrl", "./searchDrugs");
                return result;
            } else {
                result.put("success", false);
                result.put("msg", "上架失败，请稍后再试");
                return result;
            }
        }else {
            //如果状态为1,下架
            //设置用户的状态
            drugs.setD_status(2);
            System.out.println("drugs====?"+drugs);
            //调用service
            Integer success = drugsService.borrowDrugs(drugs);
            if (success > 0) {
                result.put("success", true);
                result.put("msg", "下架成功");
                result.put("redirectUrl", "./searchDrugs");
                return result;
            } else {
                result.put("success", false);
                result.put("msg", "下架失败，请稍后再试");
                return result;
            }
        }
    }

    //获取全部药材
    @RequestMapping("/searchDrugs123")
    @Scheduled(fixedDelay = 1000) //每隔1秒执行一次
    public ModelAndView findByAll123() {
        ModelAndView modelAndView = new ModelAndView();
        System.out.println("");
        System.out.println("每隔1秒执行一次");

        //页面
        modelAndView.setViewName("/admin/charts");

        return modelAndView;
    }







}


