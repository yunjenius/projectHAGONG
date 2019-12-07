<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
   font-weight: bold;
}

td:first-child {
   font-weight: bold;
   border-right: 1px solid black;
}



.tdclass {
   font-weight: bold;
   color: black;
   border-top: 1px solid black;
   border-bottom: 1px solid black;
   border-right: none !important;
}

#qqtr {
   border-top: none;
   border-bottom: none;
}

#qqtd {
   font-size: 120% !important;
}

#btd {
   border-bottom: none !important;
}

.btns {
   display: inline-block;
   float: right;
  
}

tr {
   height: 50px;
}

td {
   font-weight: normal;
}

.table {
   width: 90% !important;
   border-collapse: collapse;
}

#mtext {
   margin-left: 5%;
}
.btndiv{
	margin-right: 5%;
}
</style>
</head>
<body>
   <header>
      <%@ include file="/viewAcademy/common/menubar.jsp"%>

   </header>
   <section>
      <article>
         <!--  -->
         <div align="center">
            <fieldset
               style="margin-top: -25px; margin-bottom: -15px; border-left: none; border-right: none; border-bottom: none; border-top-color: black; width: 250px;">
               <legend align="center">
                  <h1 align="center" style="font-family: 'Do Hyeon';">　권한부여관리　</h1>
               </legend>
            </fieldset>
         </div>
         <!--  -->
         <div align="center">
            <form>
               <table class="table">
                  <tr align="right">
                     <th>&nbsp;</th>
                     <th>&nbsp;</th>
                     <th>전체조회</th>
                     <th>일부등록</th>
                     <th>수정/삭제/</th>
                  </tr>
                  <!-- 공통 -->
                  <tr class="trid">
                     <td>공통</td>
                     <td>개인정보수정</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient" selected>학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!-- 관리자 -->
                  <tr class="trid">
               
                     <td class="tdclass" colspan="5">관계자</td>

                  </tr>
                  <!-- 학생개인정보 -->
                  <tr>
                     <td>학생관리</td>
                     <td>개인정보</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     <td></td>
                     <td>수납</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     <td></td>
                     <td>상담</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     <td></td>
                     <td>블랙리스트</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <tr class="trid" id="qqtr">
                     <td>직원관리</td>
                     <td>직원관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->

                  <!--  -->
                  <tr>
                     <td>수업관리</td>
                     <td>수강생관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     <td></td>
                     <td>출결관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     <td></td>
                     <td>강좌목록관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <!--  -->
                  <tr>
                     <td></td>
                     <td>만족도</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>

                  <tr>
                     <td>관리자</td>
                     <td>학원현황</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <tr>
                     <td></td>
                     <td>메뉴권한관리</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <tr>
                     <td></td>
                     <td>연간계획</td>
                     <td><select class="modifyInfo" id="modifyInfo1">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo2">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                     <td><select class="modifyInfo" id="modifyInfo3">
                           <option value="admin">행정</option>
                           <option value="manager">강사</option>
                           <option value="pclient">학부모</option>
                           <option value="sclient">학생</option>
                     </select></td>
                  </tr>
                  <tr class="trid">
                     
                     <td class="tdclass" colspan="5">고객</td>

                  </tr>
                  <tr>
                     <td>학생정보</td>
                     <td>출결정보</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td></td>
                     <td>성적정보</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td></td>
                     <td>만족도조사</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>
                  <tr>
                     <td></td>
                     <td>고지서/영수증</td>
                     <td><input type="checkbox" value="학부모" id="cul">&nbsp;&nbsp;학부모</td>
                     <td><input type="checkbox" value="학생" id="cul">&nbsp;&nbsp;학생</td>
                     <td></td>
                  </tr>


               </table>
               <div class="btndiv">
               <button type="submit" class="btns">적용하기</button>
               <button type="reset" class="btns">기본값으로 변경</button>
               </div>
            </form>
         </div>
      </article>
   </section>
</body>
</html>