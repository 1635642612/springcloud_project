package com.shop.member.service.impl;

import com.hx.base.BaseResponse;
import com.hx.weixin.entity.AppEntity;
import com.shop.member.feign.WeiXinAppServiceFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.shop.member.MemberService;

@RestController
public class MemberServiceImpl implements MemberService {
	@Autowired
	private WeiXinAppServiceFeign weiXinAppServiceFeign;

	public BaseResponse<AppEntity>  memberInvokeWeixin() {
		return weiXinAppServiceFeign.getApp();
	}

}
