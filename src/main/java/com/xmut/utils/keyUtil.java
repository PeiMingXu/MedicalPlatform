package com.xmut.utils;

import java.util.Random;

/**
 * @author
 * @date: 2023/5/4
 **/
public class keyUtil {
    //生成随机数
    public static String keyUtils(){
        String str="0123456789";
        StringBuilder st=new StringBuilder(6);
        for (int i=0;i<6;i++){
            char ch = str.charAt(new Random().nextInt(str.length()));
            st.append(ch);
        }
        String findkey = st.toString().toLowerCase();
        System.out.println("调用keyUtil生成的六位随机数="+findkey);
        return findkey;
    }
}
