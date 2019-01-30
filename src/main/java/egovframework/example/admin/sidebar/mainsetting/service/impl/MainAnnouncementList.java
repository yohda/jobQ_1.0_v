package egovframework.example.admin.sidebar.mainsetting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridAnnouncementConvertor;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.sidebar.mainsetting.dao.MainAnnouncementMapper;

@Service
public class MainAnnouncementList extends JobqJqGridSelectTemplate{
	@Autowired
	private MainAnnouncementMapper mainAnnouncementMapper;

	@Autowired
	public MainAnnouncementList(MainAnnouncementMapper mainAnnouncementMapper) {
		super(mainAnnouncementMapper, new JobqJqGridAnnouncementConvertor());
	}
	
	@Override
	protected JsonObject makeTotalCount(int allDataCnt) {
		JsonObject object = new JsonObject();
		
		object.addProperty("allAnnouncements", allDataCnt);
		
		return object;
	}
	
}
