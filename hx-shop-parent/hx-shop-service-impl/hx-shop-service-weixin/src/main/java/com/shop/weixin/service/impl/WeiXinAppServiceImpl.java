package com.shop.weixin.service.impl;

import com.shop.weixin.entity.AppEntity;
import com.shop.weixin.service.WeiXinAppService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WeiXinAppServiceImpl implements WeiXinAppService {

	@GetMapping("/getApp")
	public AppEntity getApp() {
		return new AppEntity("123456", "springcloud");
	}

}
