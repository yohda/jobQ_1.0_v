<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js" defer="defer"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js" defer="defer"></script>

<script>
		let announcement = {
				$table : $("#announcementTable"),
				$mainAnnouncementUpdateRow:[]
		};
		
		let hoverJqGridTitle = () => {
			// 제이쿼리를 최대한 줄이고 순수 자바스크립트를 통해서 성능을 올리자.
			let table = document.getElementById('announcementTable');
			
			// 이벤트 위임을 통한 나름의 성능 개선
			// 모든 a태그에 걸지 않고 조상 태그에 이벤트를 걸어 이벤트 위임 방식으로 처리를 했다.
			$(table).on('mouseenter mouseleave', '.title', function(e){
				// title에 mouse이벤트에 textDecoration걸기 (자바스크립트로 this.style.textDecoration으로 할려 했으나 잘 안됬다..)
				if(e.type == 'mouseenter')	// 마우스 들어올 때	
					$(this).attr('style', 'text-decoration:underline !important');
				else 						// 마우스가 나갈 때
					$(this).attr('style', '');
				
				// 위에서 재미있던 문제는 CSS의 !important는 $.css()에서 제대로 작동하지 않는 문제가 있다.
				// 그래서 attr()을 사용할 수 밖에 없었다.
				
			});
			
		};
		
		let mappingLinkTitle = (cellValue, options, rowData, action) => {
			return "<a href='<c:url value='/admin/employ/detail/" + rowData.no + "' />' class='title'>" + rowData.title + "</a>";
		};
		
		$(document).ready(function(){
			/* 테이블 조정 */
			
			$('.table tr td').css('padding', '5px 8px');
			
			/* 테이블 조정 끝 */
			
			// jqGrid는 JSON양식을 서버로 부터 받을 때, 반드시 root Element가 필요하다.
			announcement.$table.jqGrid({
			    url       : '<c:url value="/admin/mainsetting/announcement/list" />',
			    authwidth : true,
			    mtype     : 'get',
			    datatype  : "json",
			    height    : '100%',
			    rowNum    : 10,
			    rowList   : [10,15,20],
			    colNames  : ['공고 번호', '담당자 아이디', '공고 제목', '회사명', '상태', '등록 일자', '수정 일자'],
			    colModel  : [	// JSON데이터의 키값과 colModel의 name의 value가 일치해야만 매핑이 된다!
						    {name:'no',          width:40,  align:'center', editable:false, key:true},		// 이력서 번호
						    {name:'id', 	     width:70,  align:'center', editable:false},				// 아이디
						    {name:'title', 	     width:120, align:'center', editable:false, formatter : mappingLinkTitle},				// 제목
						    {name:'companyName', width:80,  align:'center', editable:false},				// 공개 여부
						    {name:'state', 		 width:80,  align:'center', editable:false},				// 공고 상태
						    {name:'regDate',	 width:70,  align:'center', editable:false},				// 등록 날짜
						    {name:'updateDate',	 width:70,  align:'center', editable:false},				// 수정 날짜
				],
			    pager       : "#announcementPager",
			    loadonce    : false,
			    gridview    : true,
			    viewrecords : true,
			    hidegrid    : false,
			    altRows     : true,
			    sortorder   : 'dsec',
				multiselect : true,
				resizable   : true,
				hoverrows   : false,
				jsonReader  : {
					page        : 'page',
					total       : 'total',
					root        : 'list',
					userdata    : 'userData',
					repeatitems : false
				}, ondblClickRow:function(rowid, iRow, iCol){	// ondbClickRow아니다! 주의할 것!

				}, beforeSelectRow:function(e){
					return false;
				}, onPaging : function(event){
					
				}, loadComplete : function(data){
					/* title에 hover설정 */
					// 비동기라서 여기다 선언하지 않으면 .announcement-title는 존재하지 않는 값으로 나온다.
					hoverJqGridTitle();
					
					// ajax시 Model을 사용하는것은 의미가 없는거 같다.
					// Model은 일반적으로 페이지 리로딩시에 스프링에서 JSP에서 사용할 수 있게 만든 구조인데, ajax를 리로딩을 하지 않으므로 Model은 ajax와 같이 쓰면 맞지 않는것 같다.
					$('#all-page-count').text('총 메인 공고 수 : ' + announcement.$table.jqGrid('getGridParam', 'userData').allAnnouncements);
				}
			});
			
			announcement.$table.jqGrid('navGrid', '#announcementPager', {edit:false, add:false, del:false, search:false});
			$('#refresh_announcementTable').children().children().removeClass().end().text('새로 고침');
			
			/* jqGrid End */
			
		});  
			
		/* 메인 공고 삭제 */
		
		$('#announcement-delete-btn').on('click', function(event){
			event.preventDefault();
			
			var selectedRows = [];
			var selectedCheckboxs = $(".cbox:checked");
			var deleteAnnouncementsLength = selectedRows.length;
			
			selectedCheckboxs.each(function(i, el){
				selectedRows.push($(el).parent().parent().attr('id'));	
			});
			deleteAnnouncementsLength = selectedRows.length;
			
			if(deleteAnnouncementsLength == 0){
				alert('삭제하실 공고를 선택하세요.');
				
				return ;
			}
			
			if(confirm("정말로 삭제하시겠습니까?") == false)
				return ;
			
			$.ajax({
				type : 'delete',
				url : '<c:url value="/admin/mainsetting/announcement/list" />',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				dataType : 'text',
				data : JSON.stringify(selectedRows),
				success : function(result){
					if(result == 'SUCCESS'){
						alert(deleteAnnouncementsLength + '건의 데이터가 삭제되었습니다.');
						announcement.$table.trigger("reloadGrid");
					}
				}
				
			})
		});
		
		/* 메인 공고 삭제 끝 */
		
		/* 메인 공고 수정(HOT 채용정보 / 스폐셜 채용정보) */
		
		$('#announcement-update-Btn').click(function(){
			var selectedRows = [];
			var selectedCheckboxs = $(".cbox:checked");
			
			selectedCheckboxs.each(function(i, el){
				announcement.$mainAnnouncementUpdateRow.push($(el).parent().parent().attr('id'));	
			});
			
			if(announcement.$mainAnnouncementUpdateRow.length == 0){
				alert('수정할 공고를 선택하지 않았습니다.');
				
				return ;
			}
			
        	$('.special-hot-confirm').modal();
			
		});
    	
    	$('.special-hot-confirm').find('.padd').children().on('click', function(e){
    		// 모달창 닫기 => 위치를 무조건 이쪽에 두어야 한다.
    		// 왜냐하면, announcement.$table.trigger("reloadGrid");와 같은 ajax와 겹칠 경우 모달창이 묻혀버려서 닫히지가 않는다.
    		$('.special-hot-confirm').modal('toggle');	
    		
    		var announcementName = '';
    		if(this.innerText == '스폐셜 채용 공고')
    			announcementName = '스폐셜';
    		else if(this.innerText == 'HOT 채용 공고')
    			announcementName = '핫';
    		else
    			announcementName = '미등록';
    		
    			announcement.sendToServerWithUpdateNumbers('<c:url value="/admin/mainsetting/announcement/list" />', announcementName);
    	});
    	
    	announcement.sendToServerWithUpdateNumbers = function(url, state){
    		var updateData = {
    				'updateList' : announcement.$mainAnnouncementUpdateRow,
    				'state' : state
    		};
    			
    		$.ajax({
    			type : 'put',
    			url : url,
    			headers : {
    				'Content-Type' : 'application/json',
    				'X-HTTP-Method-Override' : 'PUT'
    			},
    			data:JSON.stringify(updateData),
    			success:function(data){
    				if(data == 'SUCCESS'){
    					alert(announcement.$mainAnnouncementUpdateRow.length + '건 의 데이터가 변경되었습니다.');
    					announcement.updateAnnouncementState();		// 테이블을 리로드한다.
    				}
    				
    			},error : function(x, s, r){
    				console.dir(x);
    				console.dir(s);
    				console.dir(r);
    			}
    		})
    	};
    	
    	announcement.updateAnnouncementState = function(){
    		announcement.$mainAnnouncementUpdateRow = [];
    		
    		announcement.$table.trigger("reloadGrid");
    	};
    	
		/* 메인 공고 수정 끝 */
		
		/* 검색 버튼 클릭 */
			
		$('#announcementSearchBtn').on('click', function(e){
			var searchValues = $.jobqForm.bindInputedValues();
			
			if(Object.keys(searchValues).length == 0){
				alert('검색할 조건들을 입력하세요.');
				
				return ;
			}
				
			announcement.$table.jqGrid('clearGridData', true);
			announcement.$table.jqGrid('setGridParam', {
				url : '<c:url value="/admin/mainsetting/announcement/search" />',
				serializeGridData : function(postData){
					var searchParams = $.extend({}, postData, searchValues);
					
					return $.param(searchParams);
				}, loadComplete : function(result){
					var announcementCnt = announcement.$table.jqGrid('getGridParam', 'userData');
					
					hoverJqGridTitle();
					
					$('#all-page-count').text('총 메인 공고 수 : ' + announcementCnt.allAnnouncements);
					$('#search-page-count').text('검색된 메인 공고 수 : ' + announcementCnt.countSearchedAnnouncements);				
				}
			}).trigger('reloadGrid');
		});
		
		/* 검색 버튼 클릭 끝 */
		
    	</script>