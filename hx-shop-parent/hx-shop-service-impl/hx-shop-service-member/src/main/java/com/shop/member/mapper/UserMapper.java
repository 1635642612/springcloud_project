package com.shop.member.mapper;

import com.hx.member.entity.UserEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.repository.query.Param;


/**
 * 
 * 
 * 
 * @description: 用户Mapper
 */
public interface UserMapper {

	@Insert("INSERT INTO `hx_user` VALUES (null,#{mobile}, #{email}, #{password}, #{userName}, null, null, null, '1', null, null, null);")
	int register(UserEntity userEntity);

	@Select("SELECT * FROM hx_user WHERE MOBILE=#{mobile};")
	UserEntity existMobile(@Param("mobile") String mobile);
}
