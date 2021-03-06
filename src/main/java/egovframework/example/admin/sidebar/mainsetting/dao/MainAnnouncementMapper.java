package egovframework.example.admin.sidebar.mainsetting.dao;

import java.util.List;
import java.util.Map;

import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.mainsetting.domain.AnnouncementVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainAnnouncementMapper extends BoardSelect{

	public void deleteAnnouncements(List<String> list);
	
	public int countAllList();
	
	public List<AnnouncementVO> searchAnnouncements(Map<String, Object> searchInfo);
	
	public int countSearchedAnnouncements(Map<String, Object> searchInfo);
	
	public int updateAnnouncements(Map<String, Object> updateList);
}
