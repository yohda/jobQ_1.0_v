package egovframework.example.admin.sidebar.member.mapper;

import java.util.List;
import java.util.Map;

import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.member.domain.AdminCompanyMemberVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

// AdminMemberStatisticsMapper를 이렇게 AdminMemberMapper에 상속하게 방식에 대해서는 다시 한번 생각해보기.
@Mapper("adminMemberMapper")
public interface AdminMemberMapper extends BoardSearch, BoardSelect, AdminMemberStatisticsMapper{
	public int delete(List<String> deleteList) throws Exception;

	public AdminMemberVO getMemberDetail(Map<String, String> memberInfo) throws Exception;

	public List<AdminMemberVO> getMemberInfoForExcel(List<String> memberList) throws Exception;

	public int registGeneralMember(AdminMemberVO member) throws Exception;

	public String duplicate(String id) throws Exception;

	public String getEmailForm(String emailFormName) throws Exception;

	public int registCompanyMember(AdminCompanyMemberVO companyMember) throws Exception;
	
	public AdminCompanyMemberVO getCompanyMemberDetail(Map<String, String> memberInfo) throws Exception;
}
