﻿<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.util.*,java.sql.*,java.io.*,java.util.regex.*" %>
<jsp:useBean id="db" class="cn.ac.llas.util.dbConnection"/>
 
 <html>
 <body>
 
 <font size="4" face="arial" color="black">
 <%
  long startTime=System.currentTimeMillis();   //获取开始时间
  
 try{
 
   
    String applyNO = ""; //储存申请号
    Matcher m_applyNO = null;
    Pattern p_applyNO = Pattern.compile("【权利要求】(.+?)\\n【", Pattern.DOTALL);   
    
    //String internationalClassificationNO = ""; //国际分类号
    //Matcher m_internationalClassificationNO = null;
    //Pattern p_internationalClassificationNO = Pattern.compile("\\nAU\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);   

       
     String txtpath=this.getClass().getResource("/").getPath()+"data/patent.txt";//构建文件名


    int mm = 0;
   // Pattern p = Pattern.compile("Citations:", Pattern.DOTALL);    //由于Citations不是开头，需要用正则表达式判断
    
    //以行读取文件内容
    BufferedReader br = new BufferedReader(new FileReader(txtpath),10000);//10000不是指行数，是指缓冲区的大小
 
      String record = new String();
      String inputText = null;
      String TempStr = "";
      
      while ((record = br.readLine()) != null) {          
            record = record+"\n";
            TempStr = TempStr + record+"\n"; 
      } 
            //out.println(TempStr);
    
            //查找申请号字段
	            m_applyNO = p_applyNO.matcher(TempStr);
	            while(m_applyNO.find()) { 
	                 applyNO =  m_applyNO.group(1).trim();
	                 
	                 out.println(applyNO);
	                 out.println("<br>");  
	             } 
             
             
	            
	
	            
    

  
 }catch(Exception e){
     e.printStackTrace();
 }
       out.println("-------OVER---------"); 
       System.out.println("================OK=============");   
       long endTime=System.currentTimeMillis(); //获取结束时间
           System.out.println("程序运行时间： "+(endTime-startTime)/1000.000+" s");
           System.out.println("-------OVER---------");
        
            
 %>
 
 </font></p>
 
 </body>
 </html>