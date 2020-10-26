<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${page <= 1 }"> 
	[이전]
</c:if>
<c:if test="${page > 1 }"> 
	<a href="${pageUrl}page=${page-1}">[이전]</a> 
</c:if>
<c:forEach begin="${startPage}" end="${endPage}" var="i" step="1">
	<a href="${pageUrl}page=${i}">[${i}]</a>
</c:forEach>
<c:if test="${maxPage <= page}"> 
	[다음]
</c:if>
<c:if test="${maxPage > page}"> 
	<a href="${pageUrl}page=${page+1}">[다음]</a> 
</c:if>