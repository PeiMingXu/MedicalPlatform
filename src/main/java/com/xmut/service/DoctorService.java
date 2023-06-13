package com.xmut.service;

import com.xmut.pojo.Doctor;

import java.util.List;

public interface DoctorService {
    List<Doctor> findByDep1(String dc_department);
    List<Doctor> findByDep2(String dc_department);
    List<Doctor> findByName(String user_name);
    Doctor selectDoctorById(int user_id);
    int dianzan(Doctor doctor);
    int updateDoctor(Doctor doctor);
}
