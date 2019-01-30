<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 tbl_vertical"
		style="text-align: center">
		<table class="table table-striped table-hover">
			<colgroup>
				<col width="5%" />
				<col width="10%" />
				<col width="*" />
				<col width="15%" />
				<col width="10%" />
				<col width="15%" />
				<col width="10%" />

			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="chk_info" value=""></th>
					<th>지원자</th>
					<th>이력서 제목 / 연락처</th>
					<th>최종학력</th>
					<th>경력</th>
					<th>지원일/열람여부</th>
					<th>합격여부</th>

				</tr>
			</thead>
			<tbody>
				<c:if test="${empty appList or appList eq null}" >
					<tr>
						<td colspan="7">
							지원자 내역이 없습니다.
						</td>
					</tr>
				</c:if>
				
				
				<c:forEach var="appList" items="${appList}" varStatus="status">
				<c:if test="${appList.state == 1}">
					<tr class="${appList.appId}row" style="background-color: #BFF4ED">
				</c:if>
				<c:if test="${appList.state == 2}">
					<tr class="${appList.appId}row" style="background-color: #E5A5AF">
				</c:if>
				<c:if test="${appList.state == 0}">
					<tr class="${appList.appId}row">
				</c:if>
					<td><input type="checkbox" name="chk_info" value=""></td>

					<td>
						<div class="card">
							<dl class="clear">
								<dt class="photo">
									<c:choose>
										<c:when test="${appList.mainPic ne null}">
											<img class="img-circle img-responsive" src="./${appList.mainPic}" >
										</c:when>
										<c:otherwise>
											<img class="img-circle img-responsive" src="images/img-style_man.jpg" >
										</c:otherwise>
									</c:choose>
								</dt>
								<dd class="infoWrap">
									<ul>
										<%-- <jsp:useBean id="toDay" class="java.util.Date" />
										<fmt:formatDate var="toDay" value="${toDay}" pattern="yyyy" /> --%>
										<li class="info1">
										<strong class=""><c:out value="${appList.name}" /></strong><br>
											<span>( 
											<c:if test="${appList.sex eq 0}">남</c:if>
											<c:if test="${appList.sex eq 1}">여</c:if>
											,<c:out value="${appList.cyear - appList.byear}"/>세)</span>
										</li>
									</ul>
								</dd> 
							</dl>
						</div>
					</td> 


					<td>
						<div class="card">
							<a href="#"
								onclick="javascript:resumelist.resumeDetailFn('${appList.reNumber}', '${appList.appId}')">
								<dl class="clear">
									<dt class="">
										<strong class="ann_name">[<c:out value="${appList.title}"/>]</strong>
									</dt>
									<dd class="infoWrap">
										<ul>
											<li class="info1"><c:out value="${appList.content}"/></li>
										</ul>
									</dd>
								</dl>
							</a>
						</div>
					</td>
					<td><c:out value="${appList.lastAca}"/></td>
					<td>
						<fmt:formatNumber value="${appList.cDays/30%12}" var="month" pattern=".0"/>
						<fmt:formatNumber value="${appList.cDays/30/12}" var="year" maxFractionDigits="0"/>
						<c:choose> 
							<c:when test="${appList.cDays ne null and appList.cDays ne ''}">
								<c:if test="${year ne 0}">
									<c:out value="${year}"/>년 
								</c:if>
								<c:out value="${month}"/>개월
							</c:when>
							<c:otherwise>
								경력 없음
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<dl>
							<dd style="text-align: center">
								<ul>
									<li class="info1"><c:out value="${fn:substring(appList.dateApply,0,10)}"/></li>

									<li class="info1">
									<c:choose>
										<c:when test="${appList.read eq 1}">
											열람
										</c:when>
										<c:otherwise>
											미열람
										</c:otherwise>
									</c:choose>
									</li>
								</ul>
							</dd>
						</dl></td> 
					<td class="A_state" style="font-size: 30px">
						<c:choose>
							<c:when test="${appList.state eq '1'}">
								<a onclick="checkState(${appList.appId}, '0', '${pagingAll.pageNo}')">O</a>
							</c:when>
							<c:when test="${appList.state eq '2'}">
								<a onclick="checkState(${appList.appId}, '0', '${pagingAll.pageNo}')">X</a>
							</c:when>
							<c:otherwise>
								<a onclick="checkState(${appList.appId}, '1', '${pagingAll.pageNo}')">O /</a><a onclick="checkState(${appList.appId}, '2', '${pagingAll.pageNo}')"> X</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<!-- 다음페이지 -->
		<div class="col-sm-12">
			<div class="dataTables_paginate paging_simple_numbers text-center"
				id="example2_paginate">
				<ul class="pagination">
					<li class="paginate_button previous" id="example2_previous"><a
						aria-controls="example2"
						data-dt-idx="${pagingAll.prevPageNo}" onclick="applist.changePageNum(${pagingAll.prevPageNo}, 'Popular')">이전</a></li>
					<c:forEach var="i" begin="${pagingAll.startPageNo}"
						end="${pagingAll.endPageNo}" step="1">
						<c:if test="${i eq pagingAll.pageNo}">
							<li class="paginate_button active"><a 
								aria-controls="example2" data-dt-idx="${i}" onclick="applist.changePageNum(${i}, 'Popular')">${i}</a>
							</li>
						</c:if>
						<c:if test="${i ne pagingAll.pageNo}">
							<li class="paginate_button"><a 
								aria-controls="example2" data-dt-idx="${i}" onclick="applist.changePageNum(${i}, 'Popular')">${i}</a>
							</li>
						</c:if>
					</c:forEach>
					<li class="paginate_button next" id="example2_next"><a
						 aria-controls="example2"
						data-dt-idx="${pagingAll.nextPageNo}" onclick="applist.changePageNum(${pagingAll.nextPageNo}, 'Popular')">다음</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>