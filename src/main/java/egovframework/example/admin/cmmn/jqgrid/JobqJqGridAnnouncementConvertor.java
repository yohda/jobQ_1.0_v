package egovframework.example.admin.cmmn.jqgrid;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class JobqJqGridAnnouncementConvertor extends
		JobqJqGridConvertorTemplate {

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, SimpleDateFormat simpleDateFormat, JsonArray rows) {
		/*sup.job_number, 
		sup.id, 
		sup.title, 
		sup.class, 
		sup.date_regi, 
		sup.date_modi, 
		sup.name_wp
		
		private int no;
		private String id;
		private String title;
		private String companyName;
		private String state;
		private Timestamp regDate;
		private Timestamp updateDate;*/
		for (Map<String, Object> member : list) {
			JsonObject cell = new JsonObject();
			
			if(((String)member.get("ID")).equals("admin"))
				continue;
			
			cell.addProperty("no", String.valueOf(member.get("JOB_NUMBER")));
			cell.addProperty("id", (String)member.get("ID"));
			cell.addProperty("title", (String)member.get("TITLE"));
			cell.addProperty("companyName", (String)member.get("NAME_WP"));
			cell.addProperty("state", (String)member.get("CLASS"));
			cell.addProperty("regDate", simpleDateFormat.format((Timestamp)member.get("DATE_REGI")));
			
			if(member.get("DATE_MODI") == null)
				cell.addProperty("regDate", simpleDateFormat.format((Timestamp)member.get("DATE_MODI")));
			else
				cell.addProperty("updateDate", "미정");
				
			rows.add(cell);
		}
	}

}
