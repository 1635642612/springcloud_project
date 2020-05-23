package com.shop.member.feign;

import com.shop.weixin.service.VerificaCodeService;
import org.springframework.cloud.openfeign.FeignClient;


@FeignClient("app-hx-weixin")
public interface VerificaCodeServiceFeign extends VerificaCodeService {

}
