<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="hagong.academy.common.member.model.vo.*"%>
<%
   Member loginUser = (Member) request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HAGONG</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/normalize.css" />
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/demo.css" />
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/component.css" />
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#menuheader {
   position: fixed;
   top: 0px;
   left: 7%;
   right: 7%;
   height: 122px;
   font-weight: bold;
   background: white;
   display: flex;
   justify-content: space-around;
   align-items: center;
   font-family: "Do Hyeon";
   z-index: 1;
}

#mid {
   position: fixed;
   top: 93px;
   left: 7%;
   right: 7%;
   height: 30px;
   font-weight: bold;
   background: rgba(211, 211, 211, 0.4);
   display: flex;
   align-items: center;
}

#menuheader>.topmenu:hover, .topmenu:visited, .topmenu:active {
   cursor: pointer;
   color: orangered;
}

#menuheader>h3:hover, h3:visited, h3:active {
   cursor: pointer;
}

button {
   border: 1px solid green;
   border-radius: 5px;
   background: none;
   color: black;
   display: block;
   position: relative;
}

button:focus {
   outline: none;
}

input:focus {
   outline: none;
}

button:hover {
   cursor: pointer;
   background: green;
   border: 1px solid green;
   color: white;
}

#topbutton {
   height: 50px;
   width: 50px;
   background: lightgray;
   border: none;
   border-radius: 50px;
   cursor: pointer;
   float: right;
   position: fixed;
   right: 50px;
   bottom: 50px;
}

/* ???????????? */
#studentdetailmenu {
   color: black;
   position: absolute;
   left: 13%;
   font-weight: normal;
   display: none;
}

/* ???????????? */
#classdetailmenu {
   color: black;
   position: absolute;
   left: 30%;
   font-weight: normal;
   display: none;
}

/* ????????? */
#admindetailmenu {
   color: black;
   position: absolute;
   left: 40%;
   font-weight: normal;
   display: none;
}

#member {
   position: fixed;
   display: inline-flex;
   right: 9%;
   height: 30px;
   width: 13%;
   top: 10%;
}

a {
   margin-right: 10px;
   color: #333;
   text-decoration: underline;
}
/* ???????????? */
.detailmenu>a {
   text-decoration: none;
}

.detailmenu>a[class]:hover {
   color: black;
}

body {
   margin-top: 150px;
   margin-left: 7%;
   margin-right: 7%;
}

td, th {
   text-align: center;
}

#name:focus, #name:hover {
   outline: none;
   cursor: default;
   color: black;
}

section {
   font-family: "Nanum Gothic" !important;
}
</style>
</head>
<body>

   <!-- ?????? ?????? ??? -->
   <header>
      <div id="menuheader">
         <a href="<%=request.getContextPath()%>/index.jsp"> <img
            src="<%=request.getContextPath()%>/images/hagong.png"
            style="height: 85px;"></a>
         <h2 class="topmenu" id="attendance" onclick="GoAttendance();">????????????</h2>
         <h2 class="topmenu" id="score" onclick="goScore();">????????????</h2>
         <h2 class="topmenu" id="satisfy" onclick="goSaisfy();">???????????????</h2>
         <h2 class="topmenu" id="receipt" onclick="goReceipt();">?????????/?????????</h2>
         &nbsp;
         <% if(loginUser != null) { %>
        	<button id="logout" style="margin-left: 5px;">????????????</button>
         <% }else { %>
         <button id="login" style="margin-left: 5px;">?????????</button>
         <% } %>
         
         <% if(loginUser != null) {  %>
				<div id="member">
					<button type="button" id="name"
						style="margin-right: 4%; background: none; border: none; font-size: large;">
						<%= loginUser.getName() %>???
					</button>
					<button
                  style="margin-left: 15px; background: none; border: none; text-decoration: underline;"
                  onclick="location.href='<%= request.getContextPath() %>/adetail.ps?type=view&no=<%= loginUser.getUserNo()%>'">???????????? ??????</button>
				</div>
				<% }%>
        
      </div>
   </header>
   <section></section>

   <!-- ?????? ?????? -->
   <footer>
      <button id="topbutton" onclick="location.href='#'">TOP</button>
   </footer>

   <!-- ???????????? -->
   <script>
      $("#login").click(function() {
             location.href="<%=request.getContextPath()%>/viewClient/common/login.jsp";
        });

      $("#logout").click(function() {
          <%-- location.href="<%=request.getContextPath()%>/logout.me"; --%>
          swal("???????????? ???????????????????", {
             buttons : [ "??????", "??????" ],
          }).then(function(isConfirm){
        	  if(isConfirm) {
        		  location.href="<%=request.getContextPath()%>/logout.cm";
        	  }
          });
          
       });

      //??? ?????? ??????
      function myInfo(){
          location.href = "<%=request.getContextPath()%>/viewAcademy/commonMenu/UserInfo.jsp";
       };
       
       function GoAttendance(){
          location.href = "<%=request.getContextPath()%>/viewAcademy/mngStudent/mngInfo/studentInfo.jsp";
       }
       function goScore(){
          location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp";
       }
       function goSaisfy(){
          location.href="<%=request.getContextPath()%>/viewAcademy/mngClass/mngSatisfy/satisfactionList.jsp";
       }
       function goReceipt(){
          location.href="<%=request.getContextPath()%>/viewClient/mnReceipt/client.jsp";
       }
   </script>

</body>
</html>