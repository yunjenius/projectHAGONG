<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>HAGONG</title>
<style>
   body {
      font-family: "Nanum Gothic";
      background:url("/hagong/images/classInsert.jpg") no-repeat top;
      background-size:85.9%;
   }
   
   input[type="text"] {
      width: 320px;
      height: 30px;
      border-radius: 5px;
      border: 1px solid lightgray;
   } 
   
    input[type="number"] {
      width: 100px;
      height: 30px;
      border-radius: 5px;
      border: 1px solid lightgray;
   } 
   
   input[type="date"] {
      width: 150px;
      height: 30px;
      border-radius: 5px;
      border: 1px solid lightgray;
   }
   
   input[type="checkbox"] {
      margin-left: 10px;
      width:20px;
      height:30px;
      margin-bottom:20px;
   }
   
   .bottomArea > button {
      display:inline;
      font-size: 18px;
      font-family: "Nanum Gothic";
      width:100px;
   }
   
   .bottomArea > button:hover {
      background:green;
      color:white;
   }
      
   fieldset {
      width:20%;
   }
      
   select {
        margin-bottom: 0 !important;
      height: 30px;
      width: 100px;
      border-radius: 5px;
      border: 1px solid lightgray;
   }
   
   #classTime {
      height: 30px;
      width: 142px;
      margin-bottom: 20px;
      border-radius: 5px;
      border: 1px solid lightgray;
   }
   
   .tableArea {
      background:rgba(268,268,268,50%);
      padding-top: 25px;
      width: 550px;
       border-radius: 5px;
         margin-bottom: 10px;
   }
   
   td {
         padding-top:10px;
         padding-bottom:10px;
   }
</style>
</head>
<body>
   <header>
   <%@ include file="../../common/menubar.jsp" %>
   </header>
   <section>
   <div align="center">
         <fieldset style="margin-bottom:-30px;border-left:none; border-right:none; border-bottom:none; border-top-color:black;">
            <legend align="center"><h1 align="center" style="font-family:'Do Hyeon';">??????????????? ?????????</h1></legend>
         </fieldset>
    </div>
   <div class="body" align="center">
      <div class="tableArea">
      <form id="classInfo" action="<%=request.getContextPath()%>/ainsert.class" method="post">
         <table class="insertTable">
            <tr>
               <td>?????? : </td>
               <td>
               <select id="selectSubject" name="selectSubject" style="margin-bottom:20px">
                  <option value="" selected disabled hidden>?????? ??????</option>
                  <option value="??????">??????</option>
                  <option value="??????">??????</option>
                  <option value="??????">??????</option>
                  <option value="??????">??????</option>
                  <option value="??????">??????</option>
                  <option value="???2?????????">???2?????????</option>
                  <option value="??????">??????</option>
               </select>
               </td>
               <td>
               <label for="selectTeacher">?????? ?????? : </label>
               </td>
               <td>
               <select id="selectTeacher" name="selectTeacher" style="margin-bottom:20px">
               </select>
               </td>
            </tr>
            <tr>
               <td>
               <label>?????? ?????? : </label>
               </td>
               <td>
               <select id="selectStudent" name="selectStudent" style="margin-bottom:20px">
                  <option value="" selected disabled hidden>?????? ??????</option>
                  <option value="MID1">???1</option>
                  <option value="MID2">???2</option>
                  <option value="MID3">???3</option>
                  <option value="HIGH1">???1</option>
                  <option value="HIGH2">???2</option>
                  <option value="HIGH3">???3</option>
                  <option value="ETC">??????</option>
               </select>
               </td>
               <td>
               <label>?????? : </label>
               </td>
               <td>
               <input type="number" id="numOfClass" name="numOfClass">
               </td>
            </tr>
            <tr>
               <td>
               <label>????????? : </label>
               </td>
               <td colspan="3">
               <input type="text" id="classTitle" name="classTitle">
               </td>
            </tr>
             <tr>
               <td>
               <label for="classroom">????????? : </label>
               </td>
               <td>
               <select id="classroom" name="classroom" style="margin-bottom:20px">
                  <option value="11">1-A</option>
                  <option value="12">1-B</option>
                  <option value="13">1-C</option>
                  <option value="14">2-A</option>
                  <option value="15">2-B</option>
                  <option value="16">2-C</option>
                  <option value="17">3-A</option>
                  <option value="18">3-B</option>
                  <option value="19">3-C</option>
               </select>
               </td>
               <td>
               <label>???????????? : </label>
               </td>
               <td>
               <input type="number" id="cntOfClass" name="cntOfClass">
               </td>
            </tr>
            <tr>
               <td>
               <label>?????? : </label>
               </td>
               <td colspan="3">
               <input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
               </td>
            </tr>
            <tr>
               <td>
               <label>?????? : </label>
               </td>
               <td colspan="3">
               <input type="checkbox" id="mon" name="day" value="MON"><label for="mon">???</label>
               <input type="checkbox" id="tue" name="day" value="TUE"><label for="tue">???</label>
               <input type="checkbox" id="wed" name="day" value="WED"><label for="wed">???</label>
               <input type="checkbox" id="thur" name="day" value="THU"><label for="thur">???</label>
               <input type="checkbox" id="fri" name="day" value="FRI"><label for="fri">???</label>
               <input type="checkbox" id="sat" name="day" value="SAT"><label for="sat">???</label>
               <input type="checkbox" id="sun" name="day" value="SUN"><label for="sun">???</label>
               </td>
            </tr>
            <tr>
               <td>
                  <label for="classTime">?????? ?????? : </label>
               </td>
               <td colspan="3">
                  <select id="classTime" name="startTime" style="width:150px;">
                     <option>09:00</option>
                     <option>10:00</option>
                     <option>11:00</option>
                     <option>12:00</option>
                     <option>13:00</option>
                     <option>14:00</option>
                     <option>15:00</option>
                     <option>16:00</option>
                     <option>17:00</option>
                     <option>18:00</option>
                     <option>19:00</option>
                     <option>20:00</option>
                     <option>21:00</option>
                  </select> ~
                  <select id="classTime" name="endTime" style="width:150px;">
                     <option>10:00</option>
                     <option>11:00</option>
                     <option>12:00</option>
                     <option>13:00</option>
                     <option>14:00</option>
                     <option>15:00</option>
                     <option>16:00</option>
                     <option>17:00</option>
                     <option>18:00</option>
                     <option>19:00</option>
                     <option>20:00</option>
                     <option>21:00</option>
                     <option>22:00</option>
                  </select>
               </td>
            </tr>    
            <tr>
               <td>
                  <label>????????? : </label>
               </td>
               <td colspan="3">
                  <input type="number" id="money" name="money" step="1000" style="width:320px;">
               </td>
            </tr>   
         </table>
      </form>
      </div>
      <div class="bottomArea" style="margin-bottom:20px">
         <button onclick="location.href='<%=request.getContextPath()%>/viewAcademy/mngClass/mngClassList/classList.jsp'">??????</button>
         <button id="insertClassInfoBtn">??????</button>
      </div>      
   </div> <!-- body end -->
   </section>
   <footer></footer>
   <script>
      $(function(){
         $("#selectSubject").change(function(){
            var subject = $("#selectSubject option:selected").val();

            $.ajax({
               url: "<%=request.getContextPath()%>/alistTeacher.class",
               data: {subject:subject},
               type: "get",
               success: function(data){
                  $select = $("#selectTeacher");
                  $select.find("option").remove();
                  
                  for(var key in data) {
                     var $option = $("<option>");
                     $option.val(data[key].userNo);
                     $option.text(data[key].name);
                     $select.append($option);
                  }
               },
               error: function(data){
                  alert("?????? ?????? ???????????? ??????");
               }
            });      
         });
         
         $("#insertClassInfoBtn").click(function(){
            $("#classInfo").submit();

            console.log($("#classInfo"));
         });
         
         
      });
   </script>
</body>
</html>