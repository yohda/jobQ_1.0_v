package egovframework.example.admin.factory;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

public class GeneralMemberFactory implements MemberFactory{

	@Override
	public ModelAndView createMember(AdminMemberMapper adminMemberMapper, Map<String, String> memberInfo) throws Exception{
		return new ModelAndView("member/generalMemberDetail-js/generalMemberDetail.admin", "member", adminMemberMapper.getMemberDetail(memberInfo));
	}

}
