package egovframework.example.admin.sidebar.member.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.factory.MemberFactory;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberDetail {
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	public ModelAndView getMemberDetail(Map<String, String> memberInfo, MemberFactory memberFactory) throws Exception{
		return memberFactory.createMember(adminMemberMapper, memberInfo);
	}
	
}
