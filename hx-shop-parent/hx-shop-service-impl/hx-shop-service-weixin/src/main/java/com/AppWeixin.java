package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 *
 *
 * @description: 微服务服务实现
 */
@SpringBootApplication
@EnableEurekaClient
public class AppWeixin {

	public static void main(String[] args) {
		SpringApplication.run(AppWeixin.class, args);
	}
}
