package com.shop.weixin.service.impl;

import com.hx.base.BaseApiService;
import com.hx.base.BaseResponse;
import com.hx.weixin.entity.AppEntity;
import com.shop.weixin.service.WeiXinAppService;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WeiXinAppServiceImpl extends BaseApiService implements WeiXinAppService {


	@Override
	public BaseResponse<AppEntity> getApp() {
		return setResultSuccess(new AppEntity("123456", "springcloud"));
	}
}
