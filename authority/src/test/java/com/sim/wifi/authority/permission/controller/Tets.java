package com.sim.wifi.authority.permission.controller;

import com.sim.wifi.authority.security.util.CryptoUtil;

/**
 * @Description:
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/8/2
 */
public class Tets {
    public static void main(String[] args) {

        String password = "123";
        String jiami1 = CryptoUtil.encode(password); //加密
        System.out.println("加密1" + jiami1);
        String jiemi1 = CryptoUtil.decode(jiami1);//解密
        System.out.println("解密1" + jiemi1);
        String jiami2 = CryptoUtil.encode(password); //加密
        System.out.println("加密2" + jiami2);
        String jiemi2 = CryptoUtil.decode(jiami2);//解密
        System.out.println("解密2" + jiemi2);
        System.out.printf("结束");
    }
}

