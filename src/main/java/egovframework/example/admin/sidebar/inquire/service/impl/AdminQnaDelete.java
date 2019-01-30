package egovframework.example.admin.sidebar.inquire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.board.JobqBoardDeleteTemplate;
import egovframework.example.admin.sidebar.inquire.mapper.AdminQnaMapper;

@Service
public class AdminQnaDelete extends JobqBoardDeleteTemplate{

	@Autowired
	public AdminQnaDelete(AdminQnaMapper adminQnaMapper) {
		super(adminQnaMapper);
	}

}
