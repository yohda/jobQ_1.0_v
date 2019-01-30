package egovframework.example.admin.sidebar.member.service.template;

import egovframework.example.admin.sidebar.member.domain.AdminCompanyMemberVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

public class AdminCompanyMemberRegisterTemplate extends AdminMemberRegisterTemplate<AdminCompanyMemberVO>{

	@Override
	protected int insertMember(AdminCompanyMemberVO companyMember, AdminMemberMapper adminMemberMapper) throws Exception {
		return adminMemberMapper.registCompanyMember(companyMember);
	}

}
