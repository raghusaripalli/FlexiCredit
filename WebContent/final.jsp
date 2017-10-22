<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#330000">
<%@page import="mymain.MainDao,mymain.Main,java.util.*,java.io.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
int val = Integer.parseInt(request.getParameter("Select Plan"));
int tot = MainDao.total;
double irate, iamt, eamt, lamt, tenure;
if (val==3||val==6||val==9) 
irate = 10;
else
irate = 12;

iamt = (tot * irate * val)/(100 * 12);

lamt = tot+iamt;

eamt = lamt / val;

PrintWriter writer = new PrintWriter( out );
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
<img src="dbs.png" width="116" height="66" alt=""/>
<button type="submit"  class="button" style="float:right;">Logout</button>
<fieldset>
<legend align="center">
<h1><font color="white"  >FLEXI CREDIT</font></h1>
</legend>
<table style="width:100%">
<tr align="center">
<td align="left">
<label><b><font color="white" size=4px>Interest Rate      : </font></b></label>
    <font color="white" size=4px><% out.print(irate); %>%</font>
</td>
<td align="left">
<label><b><font color="white" size=4px>Principal Amount : </font></b></label>
    <font color="white" size=4px><% out.print(tot); %> /-</font>
</td>
<td align="left">
<label><b><font color="white" size=4px>EMI Amount: </font></b></label>
    <font color="white" size=4px><% writer.printf("%.2f",eamt); %> /-</font>
</td>
</tr>
<tr align="center">
<td align="left">
<label><b><font color="white" size=4px>Interest Amount : </font></b></label>
    <font color="white" size=4px><% out.print(iamt); %> /-</font>
</td>
<td align="left">
<label><b><font color="white" size=4px>Tenure          : </font></b></label>
<font color="white" size=4px><% out.print(val); %> months</font>
</td>
<td align="left">
<label><b><font color="white" size=4px>Loan Amount: </font></b></label>
    <font color="white" size=4px><% out.print(lamt); %> /-</font>
</td>
</tr>
</table>

<br/>
<br/><br/>
<center>
<table border="1" cellsapcing="0" cellpading="0">
<tr>
<th><font color="white" size=5px>S.No</font></th>
<th><font color="white" size=5px>EMI Amount</font></th>
<th><font color="white" size=5px>Principal Amount</font></th>
<th><font color="white" size=5px>Interest Amount</font></th>
<th><font color="white" size=5px>Balance</font></th>
</tr>
<%
int k = ((val) * (val + 1))/2;
double bal = lamt;
int j = 1;
for (int i=val; i>0; i--){
	
	double iamt1 = (i * iamt) / k;
	double pamt = eamt - iamt1;
	bal = bal - eamt;
	out.print("<tr style='color: white'><td>"+j+"</td><td>"+(int)eamt+"</td><td>"+(int)pamt+"</td><td>"+(int)iamt1+"</td><td>"+(int)bal+"</td></tr>");
	j++;
}
%>
</table>
<br/>
<br/>
<form action="result.html">
<button type="submit" class="button" style="float:right;">Confirm</button>
</form>
</center>
</fieldset>
</body>
</html>