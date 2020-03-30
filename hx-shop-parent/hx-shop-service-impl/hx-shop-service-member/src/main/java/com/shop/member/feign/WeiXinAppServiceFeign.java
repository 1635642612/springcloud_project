package com.shop.member.feign;

import com.shop.weixin.entity.AppEntity;
import org.springframework.cloud.openfeign.FeignClient;

import com.shop.weixin.service.WeiXinAppService;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "app-hx-weixin")
public interface WeiXinAppServiceFeign extends WeiXinAppService {

	// /**
	// * 功能说明： 应用服务接口
	// */
	 @GetMapping("/getApp")
	 public AppEntity getApp();
}
