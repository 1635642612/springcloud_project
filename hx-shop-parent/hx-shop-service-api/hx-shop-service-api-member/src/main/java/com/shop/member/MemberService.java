package com.shop.member;

import com.alibaba.fastjson.JSONObject;
import com.hx.weixin.entity.AppEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Api(tags="会员服务接口")
public interface MemberService {



	/**
	 * 根据手机号码查询是否已经存在,如果存在返回当前用户信息
	 *
	 * @param mobile
	 * @return
	 */
	/*@ApiOperation(value = "根据手机号码查询是否已经存在")
	@ApiImplicitParams({
			@ApiImplicitParam(paramType = "query", name = "mobile", dataType = "String", required = true, value = "用户手机号码"), })
	@PostMapping("/existMobile")
	BaseResponse<UserEntity> existMobile(@RequestParam("mobile") String mobile);*/

}
