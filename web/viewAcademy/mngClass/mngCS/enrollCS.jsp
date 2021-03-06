<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, hagong.academy.mngClass.mngCS.model.vo.*"%>
<%
	ArrayList<CSStudent> csslist = (ArrayList<CSStudent>) request.getAttribute("csslist");
	ArrayList<CSStudent> allStudentList = (ArrayList<CSStudent>) request.getAttribute("allStudentList");
	CSStudent csInfo = (CSStudent) request.getAttribute("csInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAGONG</title>
<style>
	.bottomBtn {
		width:100px !important;
		height:30px !important;
		font-size:18px;
	}
	section {
		background: snow;
	}
	.detailClass {
		width:1080px;
		margin-left:auto;
		margin-right:auto;
	}
	
	.detailClass .classbtn {
		display:flex;
		float: right;
		margin-top:10px;
		margin-bottom:10px;
	}
	.detailClass .classbtn button{
		margin-right:10px;
	}
	.detailClass .addDel button{
		margin-top:10px;
	}
	.detailClass button {
		width:90px; height:35px; background:white; border:1px solid green; border-radius:5px/5px;
	}
	.detailClass button:hover {
		background:green; color:white;
	}
	.detailClass .classListArea{display:flex;}
	.cArea{margin:0 auto;}
	.cArea.addDel{margin:auto 0;}
	.classListArea li {padding:2px;}
	.detailClass .classListArea .studentList{border:1px solid #333; padding:10px 0 0 0;width:450px; height:360px;border-radius: 10px;overflow:hidden;}
	.detailClass .classListArea .inputSrch{height:30px;border-radius: 20px;text-align:center;border:1px solid #333;margin-bottom: 10px;}
	.cArea h3 {margin:10px auto;}
	.studentList .tableArea {height:306px;overflow:auto;}
	.table {margin-bottom:2px !important;}
	#allTable td{padding:0.75em 5px}
	#thisTable td{padding:0.75em 5px}
</style>
</head>
<!-- <body> -->
<body>
	<header>
		<%@ include file="../../common/menubar.jsp" %>	
	</header>
	<section>
		<div class="detailClass">
	<form id="classForm" method="post">
		<div class="classInfo">
			<div align="center">
		      <h1 align="center" style="font-family:'Do Hyeon'; padding-top:20px;"><???<%= csInfo.getClsName() %>???></h1>
	    	</div>
   			<div class="bTable">
				<table class="table">
					<tr>
						<th>????????????</th>
						<th>????????????</th>
						<th>?????? ??????</th>
						<th>?????????</th>
						<th>????????????</th>					
					</tr>
					<tr>
						<td><input id="clsNo" type="hidden" value="<%= csInfo.getClsNo() %>" name="clsNo"><%= csInfo.getTchName() %></td>
						<td><%= csInfo.getClsStudentName() %></td>
						<td><%= csInfo.getClsStart() %> ~ <%= csInfo.getClsEnd()%></td>
						<td><%= csInfo.getClassName()%></td>
						<td><%= csInfo.getClsMax() %>???</td>
					</tr>
				</table>
			</div> <!-- ??????????????? ?????? end -->	
		</div>
		<div class="classListArea">
			<div class="cArea allStudentList" align="center">
				<h3>?????? ?????? ??????</h3>
				<div class="studentList">
					<input id="srchStu" type="search" class="inputSrch" placeholder="??????????????????">
				<div id="allSt" class="tableArea">
					<table class="table" id="allTable">				
						<%for(int i = 0; i < allStudentList.size(); i++) {%>
							<tr>
								<td><input type="checkbox" style="display:none" name="chAllst" value="<%= allStudentList.get(i).getUserNo() %>"><%= allStudentList.get(i).getStuName() %></td>
								<td><%= allStudentList.get(i).getUserId() %></td>
								<td><%= allStudentList.get(i).getSchool() %></td>
								<td><%= allStudentList.get(i).getGradeName() %></td>
							</tr>
						<% } %>
					</table>
				</div>
					
				</div>
			</div>
			<div class="cArea addDel">
				<button type="button" class="addStudent" id="allStu">?????? ???</button>
				<button type="button" class="delStudent" id="remStu">??? ??????</button>
			</div>
			<div class="cArea inClassStudentLsit" align="center">
				<h3>?????? ?????? ????????? ??????</h3>
				<div class="studentList">
					<input id="srchStu2" type="search" class="inputSrch" placeholder="??????????????????">
					<div id="thisSt" class="tableArea">
					<table class="table" id="thisTable">
						<% if(!csslist.isEmpty()) {%>
						<%for(int i = 0; i < csslist.size(); i++) {%>
							<tr>
								<td><input type="checkbox" style="display:none" name="chst" value="<%= csslist.get(i).getUserNo() %>"><%= csslist.get(i).getStuName() %></td>
								<td><%= csslist.get(i).getUserId() %></td>
								<td><%= csslist.get(i).getSchool() %></td>
								<td><%= csslist.get(i).getGradeName() %></td>
							</tr>
						<%}
						}%>
					</table>
					</div>
				</div>
				<% if(!csslist.isEmpty()) {%>
					<div style="float:right;">(<%= csslist.size() %> / <%= csInfo.getClsMax() %>)</div>
				<%} else{ %>
					<div style="float:right;">(0 / <%= csInfo.getClsMax() %>)</div>					
				<%} %>
			</div>
		</div> <!-- classListArea end -->
		<div class="classbtn">
			<button class="bottomBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/alist.cs'">??????</button>
			<button class="bottomBtn" id="addStudent">??????</button>
			<br><br>
		</div>
	</form>
	</div>
	</section>
	<script>
		$(function(){
			$("#allSt tr").click(function(){
				console.log($(this).children().eq(0).children("input").prop("checked"));
				if($(this).children().eq(0).children("input").prop("checked") == false){
					$(this).addClass("on");
					$(this).children().eq(0).children("input").prop("checked", true);
					console.log("all " + $(this).children().eq(0).children("input").prop("checked"));
				}else{
					$(this).removeClass("on");
					$(this).children().eq(0).children("input").prop("checked", false);
					console.log("remAll " + $(this).children().eq(0).children("input").prop("checked"));
				}
			});
			
			$("#thisTable tr").click(function(){
				console.log($(this).children().eq(0).children("input").prop("checked"));
				if($(this).children().eq(0).children("input").prop("checked") == false){
					$(this).addClass("on");
					$(this).children().eq(0).children("input").prop("checked", true);
				}else{
					$(this).removeClass("on");
					$(this).children().eq(0).children("input").prop("checked", false);
				}
			});
			
			
			$("#allStu").click(function(){
				$(".on").addClass("addStu");
				$("#thisTable").append($(".on"));
			});
			$("#remStu").click(function(){
				$(".on").removeClass("addStu");
				$("#allTable").append($(".on"));
			});
			
			$("#addStudent").click(function(){
				var stuArr = "first";
				var stuAll = "second";
				$("#thisTable input[name='chAllst']").filter(function(value){
						console.log(this.value + "???");
						if(stuArr == "first"){
							stuArr = this.value;
						}else{
							stuArr += "," + this.value;
						}
					
					
					console.log("stuArr : " + stuArr);
				});
				$("#allTable input[name='chst']").filter(function(value){
						console.log(this.value + "???");
						if(stuAll == "second"){
							stuAll = this.value;
						}else{
							stuAll += "," + this.value;
						}
					console.log("stuAll : " + stuAll);
				});
				
				$("#classForm").attr("action","<%= request.getContextPath() %>/insert.cs?stuArr=" + stuArr + "&stuAll=" + stuAll);
				
			});
			
			$("#srchStu").change(function(){
				var name = $("#srchStu").val();
				var clsNo = $("#clsNo").val();
				console.log("name : " + name);
				$.ajax({
					url:"srchStu.cs",
					type:"get",
					data:{name:name, clsNo:clsNo},
					success:function(data){
						$table = $("#allTable");
						
						$table.html('');
						for(var key in data){
							var srchName = data[key];
						
							var $tr = $("<tr>");
							var $name = $("<td>").text(srchName.stuName);
							var $userId = $("<td>").text(srchName.userId);
							var $school = $("<td>").text(srchName.school);
							var $grade = $("<td>").text(srchName.gradeName);
								
								$tr.append($name);
								$tr.append($userId);
								$tr.append($school);
								$tr.append($grade);
								
								$table.append($tr);
							
						}
					},
					error:function(data){
						console.log("??????!");
					}
				});
			});
			
			
			$("#srchStu2").change(function(){
				var name2 = $("#srchStu2").val();
				var clsNo2 = $("#clsNo").val();
				console.log("name : " + name2);
				$.ajax({
					url:"srchName.cs",
					type:"get",
					data:{name:name2, clsNo:clsNo2},
					success:function(data){
						$table = $("#thisTable");
						
						$table.html('');
						for(var key in data){
							var srchName = data[key];
						
							var $tr = $("<tr>");
							var $name = $("<td>").text(srchName.stuName);
							var $userId = $("<td>").text(srchName.userId);
							var $school = $("<td>").text(srchName.school);
							var $grade = $("<td>").text(srchName.gradeName);
								
								$tr.append($name);
								$tr.append($userId);
								$tr.append($school);
								$tr.append($grade);
								
								$table.append($tr);
							
						}
					},
					error:function(data){
						console.log("??????!");
					}
				});
			});
		});
	</script>
</body>
</html>