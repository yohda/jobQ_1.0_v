<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- jQuery -->
<script src="/sample/admin/js/jquery.js"></script>

<!-- jQuery UI -->
<script src="/sample/admin/js/jquery-ui.min.js"></script>

<!-- jQuery Cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<!-- Bootstrap JS -->
<script src="/sample/admin/js/bootstrap.min.js"></script>

<!-- DatePicker -->
<script src="/sample/admin/js/bootstrap-datetimepicker.min.js"></script>

<!-- Respond JS for IE8 -->
<script src="/sample/admin/js/respond.min.js"></script>

<!-- HTML5 Support for IE -->
<script src="/sample/admin/js/html5shiv.js"></script>

<!-- Custom JS -->
<script src="/sample/admin/js/custom.js"></script>

<!-- JobqRegex JS -->
<script src="/sample/admin/js/jobq/jobq-regex.js"></script>

<!-- JobqForm JS -->
<script src="/sample/admin/js/jobq/jquery.jobq-form.js"></script>

<script>
	/* 메뉴 입력시 페이지 이동 */

	$(function() {
		var search = $('#search');
		var search_form = $('#search-form');

		search.keydown(function(key) {
			if (key.keyCode == 13) {
				if (search.val() == 'dashboard')
					search_form.attr('action', 'main.jobq');
				else
					search_form.attr('action', search.val() + '.jobq');

				search_form.attr('method', 'get');
				search_form.submit();
			}
		})
	}());

	/* 메뉴 입력시 페이지 이동 끝 */

	/* 슬라이드박스 탭 메뉴 활성화 */

	$(function() {
		var $slideboxTabMenus = $('.slidebox-tab-menus');

		if ('<c:out value="${sessionScope.selectedTabMenu}" />' == "")
			$($slideboxTabMenus[0]).addClass('active');
		else {
			$slideboxTabMenus.removeClass('active');
			$($slideboxTabMenus['<c:out value="${sessionScope.selectedTabMenu}" />']).addClass('active');
		}
	}());

	/* 슬라이드박스 탭 메뉴 활성화 끝 */

	/* Q & A WebSocket  */

	$(document).ready(function(){
		/* 지금 이쪽에서는 확실히 문제가 없다. */
		let wsWorker = new Worker('<c:url value="/admin/js/jobq/jobq-websocket-worker.js" />');
		wsWorker.postMessage('<security:authentication property="principal.username" />');
	});

	/* Q & A WebSocket  */
	
	
	/* Logout */
	
	document.getElementById('logout-btn').addEventListener('click', function(e){
		e.preventDefault();
		
		$('#logout-form').submit();
	});
	
	/* Logout */
	
	/* Language Change */
	
	document.getElementById('language-change-btn').addEventListener('click', function(e){
		e.preventDefault();
		
		$('#locale-model').modal();
	});
	
	$('#locale-modal-body').on('click', '.modal-language', function(e){
		if(this.innerText == '한국어' || this.innerText == 'Korean')
			location.href = '<c:url value="/admin/locale?lang=ko" />';
		else
			location.href = '<c:url value="/admin/locale?lang=en" />';
	});
	
	/* Language Change */
	
</script>
