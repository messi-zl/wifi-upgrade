package com.sim.wifi.authority.permission.controller;


import io.swagger.annotations.Api;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * description: 字典条目管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "DictionaryItemsController", description = "字典条目管理")
@RequestMapping("/permission/dictionaryItems")
public class DictionaryItemsController {
    private static final Logger logger = LoggerFactory.getLogger(DictionaryItemsController.class);

}

