package com.shop.member;

import com.shop.weixin.entity.AppEntity;


public interface MemberService {

	/**
	 * 会员服务接口调用微信接口
	 * 
	 * @return
	 */
	public AppEntity memberInvokeWeixin();

}
