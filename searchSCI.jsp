<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.util.*,java.sql.*,java.io.*,java.util.regex.*" %>
<jsp:useBean id="db" class="cn.ac.llas.util.dbConnection"/>
 
 <%

  
 try{
 
    String F1_option = "";
    String F1_text = "";
    String F2_condition = "";
    String F2_option = "";
    String F2_text = "";
    String F3_condition = "";
    String F3_option = "";
    String F3_text = "";
    String Time_1 = "";
    String Time_2 = "";
    F1_option =request.getParameter("F1_option");
    F1_text = request.getParameter("F1_text");
    F2_condition = request.getParameter("F2_condition");
    F2_option = request.getParameter("F2_option");
    F2_text = request.getParameter("F2_text");
    F3_condition = request.getParameter("F3_condition");
    F3_option = request.getParameter("F3_option");
    F3_text = request.getParameter("F3_text");
    Time_1 = request.getParameter("Time_1");
    Time_2 = request.getParameter("Time_2");
    
    out.println(Time_1);
    
    String F1_AU_selected = "";
    String F1_C1_selected = "";
    String F1_RP_selected = "";
    String F2_AU_selected = "";
    String F2_C1_selected = "";
    String F2_RP_selected = "";
    String F3_AU_selected = "";
    String F3_C1_selected = "";
    String F3_RP_selected = "";
    
    if(F1_option.equals("AU")){
       F1_AU_selected = "selected="+"selected";
    }
    
    if(F1_option.equals("C1")){
       F1_C1_selected = "selected="+"selected";
    }
    
    if(F1_option.equals("RP")){
       F1_RP_selected = "selected="+"selected";
    }
    
     if(F2_option.equals("AU")){
       F2_AU_selected = "selected="+"selected";
    }
    
    if(F2_option.equals("C1")){
       F2_C1_selected = "selected="+"selected";
    }
    
    if(F2_option.equals("RP")){
       F2_RP_selected = "selected="+"selected";
    }
    
     if(F3_option.equals("AU")){
       F3_AU_selected = "selected="+"selected";
    }
    
    if(F3_option.equals("C1")){
       F3_C1_selected = "selected="+"selected";
    }
    
    if(F3_option.equals("RP")){
       F3_RP_selected = "selected="+"selected";
    }
    
    
%>

 
 
 <html>
 	<head>
 		<title align=center>SCI Data Search</title>
 	</head>
 	
 <body>
 	<H1 align=center>SCI Data Search</H1>
 	<H2 align=center>(China 2006-2011)</H2>
 	<font size="4" face="arial" color="black">
 	

 	<form action="searchSCI.jsp" method="get">

<fieldset style="width:870px;">
	<legend>Search Field</legend>
 	<table>
 		<tr>
 			<td></td>
 			<td> 				 	
 				<select name="F1_option">
					<option value="AU"  <%=F1_AU_selected%>>AU(作者名称)</option>
					<option value="C1" <%=F1_C1_selected%>>C1(作者地址)</option>
					<option value="RP" <%=F1_RP_selected%>>RP(通讯作者地址)</option>
				</select>=
 			</td>			
 			<td>
 				<input type="text" name="F1_text" style="width:600px;" value="<%=F1_text%>"></input>
 			</td>	 			
 		</tr>
 		<tr>
 			<td>
 				 <select name="F2_condition">
					<option value="1" selected="selected">AND</option>
					<option value="2">OR</option>
				</select>
 			</td>
 			<td> 				 	
 				<select name="F2_option">
					<option value="AU" <%=F2_AU_selected%>>AU(作者名称)</option>
					<option value="C1" <%=F2_C1_selected%>>C1(作者地址)</option>
					<option value="RP" <%=F2_RP_selected%>>RP(通讯作者地址)</option>
				</select>=
 			</td>			
 			<td>
 				<input type="text" name="F2_text" style="width:600px;"></input>
 			</td>	 			
 		</tr>
 		<tr>
 			<td>
 		  	<select name="F3_condition">
					<option value="1" selected="selected">AND</option>
					<option value="2">OR</option>
			  </select>
			</td>
 			<td> 				 	
 				<select name="F3_option">
					<option value="AU">AU(作者名称)</option>
					<option value="C1">C1(作者地址)</option>
					<option value="RP" selected="selected">RP(通讯作者地址)</option>
				</select>=
 			</td>			
 			<td>
 				<input type="text" name="F3_text" style="width:600px;"></input>
 			</td>	 			
 		</tr>
 	  <tr><td colspan="3" ><hr style="border:1px #2F4F4F  solid;" /> </tr></td>
 	  

 		<tr>

 			<td>Time：</td>
 			<td>
 			  From &nbsp; <select name="Time_1">
					<option value="2006" selected="selected">2006</option>
					<option value="2007">2007</option>
					<option value="2008">2008</option>	
					<option value="2009">2009</option>	
					<option value="2010">2010</option>	
					<option value="2011">2011</option>	
				</select> &nbsp; To
 			</td>
 			
 			<td align="left">
 			  <select name="Time_2" align="left">
					<option value="2006" selected="selected">2006</option>
					<option value="2007">2007</option>
					<option value="2008">2008</option>	
					<option value="2009">2009</option>	
					<option value="2010">2010</option>	
					<option value="2011">2011</option>	
				</select>
 			</td>

 		</tr>

 		<tr>
 			<td></td>
 			<td></td>
 			<td align="right"><input type=submit value="Search"  style="height:30px; width:100px;"></input></td>	
 		</tr>
 		
 		
 		
 		
 	</table>
 	
 		
 	</form>
</fieldset>
		
 	
 	
 

 
 <%
   
    
 
    String P_sql = "insert into SCIData2006(PT,AU,AF,TI,SO,LA,DT,DE,ID,AB,C1,RP,EM,CR,NR,TC,Z9,PU,PI,PA,SN,J9,JI,PD,PY,VL,IS1,BP,EP,DI,PG,WC,SC,GA,UT,CA,PN,SU,SI,AR)" 
	          +" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    //PreparedStatement pStmt = db.prepareStat(P_sql);
   
  
 }catch(Exception e){
     e.printStackTrace();
 }
      
       System.out.println("================OK=============");   

        
            
 %>
 
 </font></p>
 
 </body>
 </html>