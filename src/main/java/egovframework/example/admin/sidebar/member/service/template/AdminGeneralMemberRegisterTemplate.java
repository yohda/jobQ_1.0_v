package egovframework.example.admin.sidebar.member.service.template;

import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

public class AdminGeneralMemberRegisterTemplate extends AdminMemberRegisterTemplate<AdminMemberVO>{
	
	@Override
	protected int insertMember(AdminMemberVO member, AdminMemberMapper adminMemberMapper) throws Exception{
		return adminMemberMapper.registGeneralMember(member);
	}
	
}
