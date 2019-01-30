package egovframework.example.admin.sidebar.inquire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.board.JobqBoardDeleteTemplate;
import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;

@Service
public class AdminFaqDelete extends JobqBoardDeleteTemplate{

	@Autowired
	public AdminFaqDelete(AdminFaqMapper adminFaqMapper) {
		super(adminFaqMapper);
	}

}
