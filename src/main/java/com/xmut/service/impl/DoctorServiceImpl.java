package com.xmut.service.impl;

import com.xmut.mapper.DoctorMapper;
import com.xmut.pojo.Doctor;
import com.xmut.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    DoctorMapper doctorMapper;
//    @Override
//    public PageResult findAll(Integer pageNum,Integer pageSize) {
//        //开启分页查询
//        PageHelper.startPage(pageNum,pageSize);
//        Page<Doctor> page = doctorMapper.findAll(pageNum,pageSize);
//        return new PageResult(page.getTotal(),page.getResult());
//    }

//    @Override
//    public List<Doctor> findByDep(String dcDepartment, Pagination page) {
////        List<Doctor> list = doctorMapper.findByDep(dcDepartment,page);
//        return doctorMapper.findByDep(dcDepartment,page);
//    }
//
//    @Override
//    public int total() {
//        return doctorMapper.total();
//    }

    @Override
    public List<Doctor> findByDep1(String dc_department) {
        List<Doctor> list = doctorMapper.findByDep1(dc_department);
        return list;
    }
    @Override
    public List<Doctor> findByDep2(String dc_department) {
        List<Doctor> list = doctorMapper.findByDep2(dc_department);
        return list;
    }
    @Override
    public List<Doctor> findByName(String user_name) {
        List<Doctor> list = doctorMapper.findByName(user_name);
        return list;
    }

    @Override
    public Doctor selectDoctorById(int user_id) {
        Doctor doctor = doctorMapper.selectDoctorById(user_id);
        return doctor;
    }

    @Override
    public int dianzan(Doctor doctor) {
        return doctorMapper.dianzan(doctor);
    }

    @Override
    public int updateDoctor(Doctor doctor) {
        return doctorMapper.updateDoctor(doctor);
    }


}
