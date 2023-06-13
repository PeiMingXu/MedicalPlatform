package com.xmut.mapper;

import com.xmut.pojo.Doctor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DoctorMapper {


    List<Doctor> findByDep1(String dc_department);
    List<Doctor> findByDep2(String dc_department);
    List<Doctor> findByName(String user_name);
    List<Doctor> findByName1(String user_name);
    Doctor selectDoctorById(int user_id);
    int dianzan(Doctor doctor);
    int addJifen(Doctor doctor);
    int reduceJifen(Doctor doctor);
    int shangxian(Doctor doctor);
    int xiaxian(Doctor doctor);
    int updateDoctor(Doctor doctor);
}
