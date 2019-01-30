package egovframework.example.admin.sidebar.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.board.JobqBoardDeleteTemplate;
import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeDelete extends JobqBoardDeleteTemplate{

	@Autowired
	public AdminNoticeDelete(AdminNoticeMapper adminNoticeMapper) {
		super(adminNoticeMapper);
	}

}
