<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %> 
<%
  String str = "";
  int d =0;
  for (int i=0; i<6; i++){
    Random r = new Random();
    d = r.nextInt(9);
    str = str + Integer.toString(d);
  }
  //인증번호 랜덤 6자리 생성
%>

<!DOCTYPE html>
<html lang="en">
<head>
        <title>sms - jsp </title>
        <script type="text/javascript">
            function setPhoneNumber(val) {
                var numList = val.split("-");
                document.smsForm.sphone1.value = numList[0];
                document.smsForm.sphone2.value = numList[1];
            if(numList[2] != undefined){
                    document.smsForm.sphone3.value = numList[2];
        }
            }

            function loadJSON() {
                var data_file = "/calljson.jsp";
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {

                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Eror
                            alert("지원하지 않는브라우저!");
                            return false;
                        }

                    }
                }
                http_request.onreadystatechange = function() {
                    if (http_request.readyState == 4) {
                        // Javascript function JSON.parse to parse JSON data
                        var jsonObj = JSON.parse(http_request.responseText);
                        if (jsonObj['result'] == "Success") {
                            var aList = jsonObj['list'];
                            var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                            selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                            for (var i = 0; i < aList.length; i++) {
                                selectHtml += "<option value=\"" + aList[i] + "\">";
                                selectHtml += aList[i];
                                selectHtml += "</option>";
                            }
                            selectHtml += "</select>";
                            document.getElementById("sendPhoneList").innerHTML = selectHtml;
                        }
                    }
                }

                http_request.open("GET", data_file, true);
                http_request.send();
            }
        </script>
    </head>
    <%-- 필수 요소 발송 타입,  --%>
    <body onload="loadJSON()">
    <form method="post" name="smsForm" action="Post_submit.jsp">
        <input type="hidden" name="action" value="go"> 발송타입
        <span>
          <input type="radio" name="smsType" value="S" checked="checked">단문(SMS)</span>
        <br /> 제목 :
        <input type="hidden" name="subject" value="[인증번호]">
        <br /> 전송메세지
        <textarea name="msg" cols="30" rows="10" style="width:455px;">인증번호: [<%=str%>]입니다.</textarea>
        <br />받는 번호
        <input type="text" name="destination" value="<%=request.getParameter("phone")%>" size=80>
        <input type="hidden" name="sphone1" value="010">
        <input type="hidden" name="sphone2" value="9326">
        <input type="hidden" name="sphone3" value="3421">
        <script>
            document.smsForm.submit();
            <%
                session.setAttribute("p_number",str);
            %>
        </script>
        <br/>이통사 정책에 따라 발신번호와 수신번호가 같은 경우 발송되지 않습니다.
    </form>
    </body>

    </html>
            