package egovframework.example.admin.cmmn.board;

import com.google.gson.JsonObject;

public interface JobqBoardSelect {
	public JsonObject select(int page, int rows) throws Exception;
}
