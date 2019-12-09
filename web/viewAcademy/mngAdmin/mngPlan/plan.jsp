<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8" />
<title>HAGONG</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.listArea {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}
	/* 모달 배경 */
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto; 
		background-color: rgb(0, 0, 0);
		background-color: rgba(0, 0, 0, 0.4);
	}
	
	/* 모달 내부 상자 */
	.modal-content {
		background-color: #fefefe;
		margin: 13% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 30%;
		background-color: #fefefe;	
	}
	/* 모달 닫기 버튼 */
	#xBtn {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
		
	#xBtn:hover, #xBtn:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	
	ul {
		list-style:none;
		font-size: 20px;
	}
	
	ul > li {
		display:block;
		padding-bottom: 20px;
	}
	
	.btnArea > button {
		font-size: 18px;
		margin-left: 1%;
		margin-bottom: 1%;
		font-family: "Nanum Gothic";
		font-weight: bold;
		border: 2px solid green;
		display: inline;
	}
</style>
</head>
<body>			
<header>
<%@ include file="/viewAcademy/common/menubar.jsp" %>
</header>
<section>
	<div align="center">
    	<fieldset style="margin-bottom:-15px;border-left:none; border-right:none; border-bottom:none; border-top-color:black; width: 20%">
        	<legend align="center"><h1 align="center" style="font-family:'Do Hyeon'">　연간계획　</h1></legend>
   	    </fieldset>
    </div>
	<div class="listArea">
	<div class="btnArea">
		<input type="date" style="border-radius:5px; float:left; border:1px solid lightgray">
		<button id="addRow" style="float:left">행 추가</button>
		<button id="deleteBtn" style="float:right">삭제</button>
		<button id="writeBtn" style="float:right">입력 및 수정</button>
	</div> <!-- btnArea end -->
	<div class="body">
		<table id="planTableArea" class="table">
			<thead>
				<tr>
					<th></th>
					<th>1월</th>
					<th>2월</th>
					<th>3월</th>
					<th>4월</th>
					<th>5월</th>
					<th>6월</th>
					<th>7월</th>
					<th>8월</th>
					<th>9월</th>
					<th>10월</th>
					<th>11월</th>
					<th>12월</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<tr>
					<td>주요 이슈</td>
					<td>이달의 주요 이슈 컬럼 내에 내용이 길어지면 어떻게 될까?</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
					<td>이달의 주요 이슈</td>
				</tr>
				<tr>
					<td>입시</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
					<td>이달의 입시계획</td>
				</tr>
				<tr>
					<td>중등</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
					<td>이달의 중등계획</td>
				</tr>
						<tr>
							<td>고등</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
							<td>이달의 고등계획</td>
						</tr>
						<tr>
							<td>중.고 경시</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
						</tr>
						<tr>
							<td>행사</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
							<td>이달의 행사계획 행사 내용이 길어지면 자동으로 조절되는건가 이상함</td>
						</tr>
					</tbody>
				</table>
			</div> <!-- body end -->
		</div>

		<!-- 연간계획 삭제 -->
		<div id="deleteArea" class="modal">

			<div class="modal-content" align="center">
				<span id="xBtn">&times;</span>
				<h2 style="margin-left:15px;">연간계획 삭제하기</h2>
				<span>연간계획 삭제를 원하는 달을 선택하세요.</span>
				<div class="monthCheckArea">
					<form>
						<ul>
						<li><input type="checkbox" name="0" id="alls"><label for="1">전체선택</label>
						</li>
							<li>
								<input type="checkbox" name="1" id="jan" class="monthBtn"><label for="1">1월</label>
								<input type="checkbox" name="2" id="feb" class="monthBtn"><label for="2">2월</label>
								<input type="checkbox" name="3" id="mar" class="monthBtn"><label for="3">3월</label>
								<input type="checkbox" name="4" id="apr" class="monthBtn"><label for="4">4월</label>
							</li>
							<li>
								<input type="checkbox" name="5" id="may" class="monthBtn"><label for="5">5월</label>
								<input type="checkbox" name="6" id="jun" class="monthBtn"><label for="6">6월</label>
								<input type="checkbox" name="7" id="jul" class="monthBtn"><label for="7">7월</label>
								<input type="checkbox" name="8" id="aug" class="monthBtn"><label for="8">8월</label>
							</li>
							<li>
								<input type="checkbox" name="9" id="sep" class="monthBtn"><label for="9">9월</label>
								<input type="checkbox" name="10" id="oct" class="monthBtn"><label for="10">10월</label>
								<input type="checkbox" name="11" id="dec" class="monthBtn"><label for="11">11월</label>
								<input type="checkbox" name="12" id="nov" class="monthBtn"><label for="12">12월</label>
							</li>
						</ul>
					</form>
				</div> <!-- monthCheckArea end -->
				<button id="cancelbtn"
					style="margin-left: 100px; width: 100px; height: 30px; float: left; display:inline;">취소</button>
				<button id="okbtn"
					style="margin-right: 100px; float: right; width: 100px; height: 30px; display:inline;">확인</button>
				<br>
			</div>
		</div> <!-- deleteArea end -->
		<script>	
			$(function(){
				var writeBtn = document.getElementById('writeBtn');
				var deleteBtn = document.getElementById('deleteBtn');
				var deleteArea = document.getElementById('deleteArea');
				var deleteOk = document.getElementById('okbtn');
				var cancleDelete = document.getElementById('cancelbtn');
				var closeBtn = document.getElementById('xBtn');
				
				writeBtn.onclick = function() {
					location.href = "<%=request.getContextPath()%>/viewAcademy/mngAdmin/mngPlan/writePlan.jsp";
				}
				
				deleteBtn.onclick = function() {
					deleteArea.style.display = "block";
				}
				
				closeBtn.onclick = function() {
					deleteArea.style.display = "none";
				}
				
				cancleDelete.onclick = function() {
					deleteArea.style.display = "none";
				}
				
				deleteOk.onclick = function() {
					//체크된 월 삭제 기능 실행됨
					
					
					//기능이 다 실행된 후 결과값에 따라 성공 시, 삭제 결과가 반영된 연간계획 페이지 / 실패 시 에러페이지로 이동
					deleteArea.style.display = "none";
				}
			});
				/* //삭제 > 달 전체선택
				$(function(){
					$("#alls").click(function(){
						var check = $(this).is(":checked");
						 if(check) { $(".monthBtn").prop('checked', true);
						 } else { $(".monthBtn").prop('checked', false);
					})
				}); */
			//행추가하고싶어요
			/* $(function(){
				$("#addRow").click(function(){
					$(".table #tbody").append(){
						"<tr><td>aaaaaaaaa</td ><td>asdasd</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
					}
				});
			});	 */	
		</script>
</section>
<footer></footer>	
</body>
</html>