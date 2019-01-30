package egovframework.example.admin.login.mapper;

import java.util.List;

import egovframework.example.admin.login.domain.UserInfo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminLoginMapper {
	public UserInfo authenticate(String username);
}
