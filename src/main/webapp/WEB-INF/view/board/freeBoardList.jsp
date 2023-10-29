<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<style>
.board-list-th {
	border-top: 1px solid #f2f2f2; 
	border-bottom:1px solid #f2f2f2; 
	height: 45px;
}

.board-list-tr {
	border-bottom:1px solid #f2f2f2; 
	height: 45px; 
	color:#5f5f5f
}
</style>
<div class="container">
    <div class="row mt-5 mb-5">
    	<div class="col-sm-9 col-center">
    		<div class="d-flex mb-3" style="justify-content: space-between;">
	    		<div>
	    			<input type="radio" name="gubun" style="height: 12px"><span>삼겹살</span>
	    			<input type="radio" name="gubun" style="height: 12px"><span>소고기</span>
	    			<input type="radio" name="gubun" style="height: 12px"><span>양고기</span>
	    		</div>
	    		<div>
	    			<select style="height:26px">
	    				<option>제목</option>
	    			</select><input type="text" size="15">
	    		</div>
    		</div>
    		<table class="w-full t-center">
                <colgroup>
	                <col width="10%">
	                <col width="40%">
	                <col width="25%">
	                <col width="25%">
                </colgroup>
    			<thead>
    				<tr class="board-list-th">
	    				<th class="t-center">번호</th>
	    				<th>제목</th>
	    				<th class="t-center">닉네임</th>
	    				<th class="t-center">날짜</th>
    				</tr>
    			</thead>
    			<tbody>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    				<tr class="board-list-tr">
    					<td>10</td>
    					<td class="t-left">룰루랄라라라라라라라라라</td>
    					<td>박카스</td>
    					<td>2023-10-29</td>
    				</tr>
    			</tbody>
    		</table>
    	</div>
    </div>
    <ul class="pagination" style="margin: 20px 0;">
		<li class="disabled"><a href="#" title=""><span>NEXT</span></a></li>
		<li><a href="#" title="">1</a></li>
		<li class="active"><a href="#" title="">2</a></li>
		<li><a href="#" title="">3</a></li>
		<li><a href="#" title=""><span>PREV</span></a></li>
	</ul>
</div>    
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>
