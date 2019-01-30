<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

			<div class="sidebar">
				<div class="sidebar-dropdown"><a href="#">Navigation</a></div>
				<div class="sidebar-inner">
					<!-- Search form -->
					<div class="sidebar-widget">
						<form id="search-form">
							<input type="text" class="form-control" placeholder="<spring:message code="btn.search" />" id="search">
						</form>
					</div>
					
					<!--- Sidebar navigation -->
					<!-- If the main navigation has sub navigation, then add the class "has_submenu" to "li" of main navigation. -->
					<ul class="navi">
					
						<c:if test="${requestFirstURL eq 'mainsetting'}">
							<li class="has_submenu nlightblue open">
						</c:if>
						<c:if test="${requestFirstURL ne 'mainsetting'}">
							<li class="has_submenu nlightblue">
						</c:if>
							<a href="#">
								<i class="fa fa-cogs"></i> <spring:message code="sidemenu.main"/>
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<!-- 로고 -->
								<c:if test="${requestSecondURL eq 'logo'}">
									<li class="active"><a href="<c:url value="/admin/mainsetting/logo/main" />" ><spring:message code="sidemenu.main.logo"/></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'logo'}">
									<li><a href="<c:url value="/admin/mainsetting/logo/main" />" ><spring:message code="sidemenu.main.logo"/></a></li>
								</c:if>
								
								<!-- 로고 끝 -->
								
								<!-- 메인 공고 -->
								
								<c:if test="${requestSecondURL eq 'announcement'}">
									<li class="active"><a href="<c:url value="/admin/mainsetting/announcement/main" />" ><spring:message code="sidemenu.main.employ"/></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'announcement'}">
									<li><a href="<c:url value="/admin/mainsetting/announcement/main" />" ><spring:message code="sidemenu.main.employ"/></a></li>
								</c:if>
								
								<!-- 메인 공고 끝 -->
								
								<!-- 면접 팁  -->
	
								<c:if test="${requestSecondURL eq 'interview'}">
									<li class="active"><a href="<c:url value="/admin/mainsetting/interview/main" />" ><spring:message code="sidemenu.main.interview"/></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'interview'}">
									<li><a href="<c:url value="/admin/mainsetting/interview/main" />" ><spring:message code="sidemenu.main.interview"/></a></li>
								</c:if>
	
								<!-- 면접 팁 끝 -->
								
							</ul>
						</li>

						<!-- Main Setting Menu End -->
						
						<!-- 회원 메뉴 -->
						<c:if test="${requestFirstURL eq 'member'}">
							<li class="has_submenu nviolet open">
						</c:if>
						<c:if test="${requestFirstURL ne 'member'}">
							<li class="has_submenu nviolet">
						</c:if>
							<a href="#">
								<i class="fa fa-users"></i> <spring:message code="sidemenu.member"/>
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							
							<ul>
								<!-- 회원 검색 -->
								
								<c:if test="${requestSecondURL eq 'manage'}">
									<li class="active"><a href="<c:url value="/admin/member/manage/main" />"><spring:message code="sidemenu.member.manage" /></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'manage'}">
									<li><a href="<c:url value="/admin/member/manage/main" />"><spring:message code="sidemenu.member.manage" /></a></li>
								</c:if>
								
								<!-- 회원 검색 끝 -->
								
								<!-- 회원 메일  -->
								
								<c:if test="${requestSecondURL eq 'email'}">
									<li class="active"><a href="<c:url value="/admin/member/email/main" />"><spring:message code="sidemenu.member.email" /></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'email'}">
									<li><a href="<c:url value="/admin/member/email/main" />"><spring:message code="sidemenu.member.email" /></a></li>
								</c:if>
								
								<!-- 회원 메일 끝 -->
								
								<!-- 회원 통계 -->
								
								<c:if test="${requestSecondURL eq 'statistics'}">
									<li class="active"><a href="<c:url value="/admin/member/statistics/chart/main" />"><spring:message code="sidemenu.member.statistics" /></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'statistics'}">
									<li><a href="<c:url value="/admin/member/statistics/chart/main" />"><spring:message code="sidemenu.member.statistics" /></a></li>
								</c:if>
								
								<!-- 회원 통계 끝 -->
								
							</ul>
						</li> 
						
						<!-- 회원 메뉴 끝 -->
						
						
						<!-- 채용 정보 관리 -->
						
						<c:if test="${requestFirstURL eq 'employ'}">
							<li class="nred open"><a href="<c:url value="/admin/employ/main" /> "><i class="fa fa-newspaper-o"></i><spring:message code="sidemenu.employ"/></a></li>
						</c:if>
						<c:if test="${requestFirstURL ne 'employ'}">
							<li class="nred"><a href="<c:url value="/admin/employ/main" /> "><i class="fa fa-newspaper-o"></i><spring:message code="sidemenu.employ"/></a></li>
						</c:if>
						
						<!-- 채용 정보 관리 끝-->
						
						<!-- 이력서 메뉴 -->
						
						<c:if test="${requestFirstURL eq 'resume'}">
							<li class="norange open"><a href="<c:url value="/admin/resume/main"/>"><i class="fa fa-id-card-o"></i><spring:message code="sidemenu.resume"/></a></li>
						</c:if>
						<c:if test="${requestFirstURL ne 'resume'}">
							<li class="norange"><a href="<c:url value="/admin/resume/main"/>"><i class="fa fa-id-card-o"></i><spring:message code="sidemenu.resume"/></a></li>
						</c:if>
						
						<!-- 이력서 메뉴 끝 -->
						
						<!-- 지원 및 제의 현황 -->
						<c:if test="${requestFirstURL eq 'applyandoffer'}">
							<li class="has_submenu nyellow open">
						</c:if>
						<c:if test="${requestFirstURL ne 'applyandoffer'}">
							<li class="has_submenu nyellow">
						</c:if>
							<a href="javascript:void(0)">
								<i class="fa fa-check-square"></i><spring:message code="sidemenu.applyAndOffer"/>
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<c:if test="${requestSecondURL eq 'apply'}">
									<li class="active"><a href="<c:url value="/admin/applyandoffer/apply/main" />"><spring:message code="sidemenu.applyAndOffer.apply"/></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'apply'}">
									<li><a href="<c:url value="/admin/applyandoffer/apply/main" />"><spring:message code="sidemenu.applyAndOffer.apply"/></a></li>
								</c:if>
								
								<c:if test="${requestSecondURL eq 'offer'}">
									<li class="active"><a href="<c:url value="/admin/applyandoffer/offer/main" />"><spring:message code="sidemenu.applyAndOffer.offer"/></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'offer'}">
									<li><a href="<c:url value="/admin/applyandoffer/offer/main" />"><spring:message code="sidemenu.applyAndOffer.offer"/></a></li>
								</c:if>
							</ul>	
						</li>
						
						<!-- 지원 및 제의 현황  끝 -->
						
						<!--  고객 문의 -->
						
						<c:if test="${requestFirstURL eq 'inquire'}">
							<li class="has_submenu nblue open">
						</c:if>
						<c:if test="${requestFirstURL ne 'inquire'}">
							<li class="has_submenu nblue">
						</c:if>
							<a href="#">
								<i class="fa fa-list"></i> <spring:message code="sidemenu.qna"/>
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<c:if test="${requestSecondURL eq 'faq'}">
									<li class="active"><a href="<c:url value="/admin/inquire/faq/main" />">F A Q</a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'faq'}">
									<li><a href="<c:url value="/admin/inquire/faq/main" />">F A Q</a></li>
								</c:if>
								
								<c:if test="${requestSecondURL eq 'qna'}">
									<li class="active"><a href="<c:url value="/admin/inquire/qna/main" />">Q & A</a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'qna'}">
									<li><a href="<c:url value="/admin/inquire/qna/main" />">Q & A</a></li>
								</c:if>
							</ul>
						</li> 
						
						<!-- 고객 문의 끝 -->
						
						<!-- 게시판 관리 -->
						
						<c:if test="${requestFirstURL eq 'board'}">
							<li class="has_submenu npink open">
						</c:if>
						<c:if test="${requestFirstURL ne 'board'}">
							<li class="has_submenu npink">
						</c:if>
							<a href="#">
								<i class="fa fa-quora"></i><spring:message code="sidemenu.board"/>
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<c:if test="${requestSecondURL eq 'jobstory'}">
									<li class="active"><a href="<c:url value="/admin/board/jobstory/main" />"><spring:message code="sidemenu.board.jobstory" /></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'jobstory'}">
									<li><a href="<c:url value="/admin/board/jobstory/main" />"><spring:message code="sidemenu.board.jobstory" /></a></li>
								</c:if>
								
								<c:if test="${requestSecondURL eq 'notice'}">
									<li class="active"><a href="<c:url value="/admin/board/notice/main" />"><spring:message code="sidemenu.board.notice" /></a></li>
								</c:if>
								<c:if test="${requestSecondURL ne 'notice'}">
									<li><a href="<c:url value="/admin/board/notice/main" />"><spring:message code="sidemenu.board.notice" /></a></li>
								</c:if>
							</ul>		
						</li>
					</ul>
					
					<!-- 게시판 관리 끝 -->
					<!--/ Sidebar navigation -->

					<!-- Date => Datepicker -->
					<div class="sidebar-widget">
						<div id="todaydate"></div>
					</div>
				</div>
			</div>