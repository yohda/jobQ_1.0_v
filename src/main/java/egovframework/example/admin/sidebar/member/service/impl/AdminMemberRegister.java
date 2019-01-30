package egovframework.example.admin.sidebar.member.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;
import egovframework.example.admin.sidebar.member.service.template.AdminMemberRegisterTemplate;

@Service
public class AdminMemberRegister {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	@Resource(name = "passwordEncoder")
	private PasswordEncoder passwordEncoder;
	
	public <T> boolean registerMember(T member, AdminMemberRegisterTemplate<T> adminMemberRegisterTemplate) throws Exception{
		if(!adminMemberRegisterTemplate.init(passwordEncoder, adminMemberMapper).registerMember(member))
			return false;
		
		return true;
	}
	
}
