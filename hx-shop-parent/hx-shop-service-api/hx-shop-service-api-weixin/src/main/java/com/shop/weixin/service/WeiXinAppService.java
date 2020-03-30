package com.shop.weixin.service;

import com.shop.weixin.entity.AppEntity;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 
 * @description:微信服务接口
 */
public interface WeiXinAppService {

	/**
	 * 功能说明： 应用服务接口
	 */
	@GetMapping("/getApp")
	public AppEntity getApp();

}
