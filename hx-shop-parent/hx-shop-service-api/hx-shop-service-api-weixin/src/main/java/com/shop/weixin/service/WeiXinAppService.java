package com.shop.weixin.service;

import com.alibaba.fastjson.JSONObject;
import com.hx.base.BaseResponse;
import com.hx.weixin.entity.AppEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 
 * @description:微信服务接口
 */
@Api(tags="微信服务接口")
public interface WeiXinAppService {

	/**
	 * 功能说明： 应用服务接口
	 */
	@ApiOperation(value = "微信服务接口测试")
	@GetMapping("/getApp")
	public BaseResponse<AppEntity> getApp();

}
