<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="mymain.MainDao,mymain.Main,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
String cid = request.getParameter("cid");
String amount = request.getParameter("amount");
List<Main> list=MainDao.match(cid, amount);
int sum = 0;
for (Main m:list){
	sum += Integer.parseInt(m.getAmount());
}
MainDao.total = sum;
request.setAttribute("list",list);  
%>
<style>
.button {
    background-color: #990000;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}</style>
<body bgcolor="#330000">
<table style="width:100%">
<tr align="center">
<td align="left">
<img src="dbs.png" width="116" height="66" alt=""/>
</td>
<td align="right">
<a href="index.html" class="button"><font color="white">Logout</font></a>
</td>
</tr>
</table>
<fieldset>
<legend align="center"><font color="white" size=25px>FLEXI CREDIT</font></legend>
<center>
<br><br>
<table border="1" cellsapcing="0" cellpading="0">
<tr>
<th><font color="white" size=5px>Transaction ID</font></th>
<th><font color="white" size=5px>Transaction Date</font></th>
<th><font color="white" size=5px>Amount</font></th>
<th><font color="white" size=5px>Remarks</font></th>
</tr>
<c:forEach items="${list}" var="u"> 
<tr style="color: white"> <td>${u.getTid()}</td><td>${u.getTdate()}</td><td>${u.getAmount()}</td>
<td >${u.getRemarks()}</td>
</tr>
</c:forEach>
</table>
<form action="final.jsp" method="post" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<label><b><font color="white" size=4px>Total Amount</font></b></label>
    <label style="color: white"><% out.print(sum); %> </label>
<h4><font color="white" size=5px>Available EMI Plans:</font></h4>
<center>
<table border="1" >
<tr>
<th><font color="white" size=5px>Select Plan</font></th>
<th><font color="white" size=5px>Tenure(in months)</font></th>
<th><font color="white" size=5px>Rate</font></th>
</tr>
<tr>
<td><input type="radio" name="Select Plan" value="3"></td>
<td><font color="white" size=5px>3</font></td>
<td><font color="white" size=5px>10%</font></td>
</tr>
<tr>
<td><input type="radio" name="Select Plan" value="6"></td>
<td><font color="white" size=5px>6</font></td>
<td><font color="white" size=5px>10%</font></td>
</tr>
</tr>
<tr>
<td><input type="radio" name="Select Plan" value="9"></td>
<td><font color="white" size=5px>9</font></td>
<td><font color="white" size=5px>10%</font></td>
</tr>
</tr>
<tr>
<td><input type="radio" name="Select Plan" value="12" checked></td>
<td><font color="white" size=5px>12</font></td>
<td><font color="white" size=5px>12%</font></td>
</tr>
</table></center>
<br>
</br><center>
<button class="button"  type="submit">VIEW SCHEDULE VALUE  </button></center>
</form>
</fieldset>
</body>
</html>