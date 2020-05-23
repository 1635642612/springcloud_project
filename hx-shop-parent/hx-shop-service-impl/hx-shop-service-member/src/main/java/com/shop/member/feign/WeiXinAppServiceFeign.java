package com.shop.member.feign;

import org.springframework.cloud.openfeign.FeignClient;

import com.shop.weixin.service.WeiXinAppService;

@FeignClient(name = "app-hx-weixin")
public interface WeiXinAppServiceFeign extends WeiXinAppService {

	// /**
	// * 功能说明： 应用服务接口
	// */
	 //public AppEntity getApp();

}
