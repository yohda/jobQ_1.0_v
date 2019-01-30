package egovframework.example.admin.factory;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

public interface MemberFactory {
	public ModelAndView createMember(AdminMemberMapper adminMemberMapper, Map<String, String> memberInfo) throws Exception;
}
