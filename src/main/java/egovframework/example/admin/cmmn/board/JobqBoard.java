package egovframework.example.admin.cmmn.board;

import com.google.gson.JsonObject;

public abstract class JobqBoard {
	private JobqBoardSelect jobqBoardSelect;
	
	public final JsonObject select(int page, int rows) throws Exception{
		return jobqBoardSelect.select(page, rows);
	}
	
	
}
