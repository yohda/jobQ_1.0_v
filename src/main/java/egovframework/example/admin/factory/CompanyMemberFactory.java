package egovframework.example.admin.factory;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

public class CompanyMemberFactory implements MemberFactory{

	@Override
	public ModelAndView createMember(AdminMemberMapper adminMemberMapper, Map<String, String> memberInfo) throws Exception{
		return new ModelAndView("member/companyMemberDetail-js/companyMemberDetail.admin", "companyMember", adminMemberMapper.getCompanyMemberDetail(memberInfo));
	}
	
}
