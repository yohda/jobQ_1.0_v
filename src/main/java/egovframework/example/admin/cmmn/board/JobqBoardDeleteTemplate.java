package egovframework.example.admin.cmmn.board;

import java.util.List;

public abstract class JobqBoardDeleteTemplate {
	private BoardDelete boardDelete;
	
	public JobqBoardDeleteTemplate(BoardDelete boardDelete) {
		this.boardDelete = boardDelete;
	}

	public boolean delete(List<String> deleteList){
		 if(boardDelete.delete(deleteList) > 0)
			 return true;
		 
		 return false;
	}
}
