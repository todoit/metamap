<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.util.*,java.sql.*,java.io.*,java.util.regex.*" %>
<jsp:useBean id="db" class="cn.ac.llas.util.dbConnection"/>
 
 <html>
 <body>
 
 <font size="4" face="arial" color="black">
 <%
  long startTime=System.currentTimeMillis();   //获取开始时间
  PrintStream screen_out = System.out;
  //PrintStream log_out = new PrintStream("2010-1.txt");
  //System.setOut(log_out);
   System.setOut(screen_out);
 try{
 
   // 读取的文件数dataNum

 
   
    String fileName1 = "univSCI/28shandong.txt";
    String TempStr = "";
    String TempStr2 = "";
    String sql_insert = "";
    String P_sql = "insert into sci_univ_28(PT,AU,AF,TI,SO,LA,DT,DE,ID,AB,C1,RP,EM,CR,NR,TC,Z9,PU,PI,PA,SN,J9,JI,PD,PY,VL,IS1,BP,EP,DI,PG,WC,SC,GA,UT,CA,PN,SU,SI,AR,FU,FX,Univ_ID)" 
	          +" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,187)";
    PreparedStatement pStmt = db.prepareStat(P_sql);
    
    String PT = ""; //储存PT
    Matcher m_PT = null;
    Pattern p_PT = Pattern.compile("\\nPT\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);   
    
    String AU = ""; //储存作者
    Matcher m_AU = null;
    Pattern p_AU = Pattern.compile("\\nAU\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);   
    
    String AF = ""; //储存AF
    Matcher m_AF = null;
    Pattern p_AF = Pattern.compile("\\nAF\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);    

    String TI = ""; //储存标题
    Matcher m_TI = null;
    Pattern p_TI = Pattern.compile("\\nTI\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);   
    
    String SO = ""; //储存SO
    Matcher m_SO = null;
    Pattern p_SO = Pattern.compile("\\nSO\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);  
    
    String LA = ""; //储存LA
    Matcher m_LA = null;
    Pattern p_LA = Pattern.compile("\\nLA\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);     
    
    String DT = ""; //储存DT
    Matcher m_DT = null;
    Pattern p_DT = Pattern.compile("\\nDT\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);  
    
    String DE = ""; //储存DE
    Matcher m_DE = null;
    Pattern p_DE = Pattern.compile("\\nDE\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String ID = ""; //储存ID
    Matcher m_ID = null;
    Pattern p_ID = Pattern.compile("\\nID\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String AB = ""; //储存AB
    Matcher m_AB = null;
    Pattern p_AB = Pattern.compile("\\nAB\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String C1 = ""; //储存C1
    Matcher m_C1 = null;
    Pattern p_C1 = Pattern.compile("\\nC1\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String RP = "";//地址字段
    Matcher m_RP = null;
    Pattern p_RP = Pattern.compile("\\nRP\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);   
    
    String EM = ""; //储存EM
    Matcher m_EM = null;
    Pattern p_EM = Pattern.compile("\\nEM\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String CR = ""; //储存CR
    Matcher m_CR = null;
    Pattern p_CR = Pattern.compile("\\nCR\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String NR = ""; //储存NR
    Matcher m_NR = null;
    Pattern p_NR = Pattern.compile("\\nNR\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String TC = ""; //储存TC
    Matcher m_TC = null;
    Pattern p_TC = Pattern.compile("\\nTC\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String Z9 = ""; //储存Z9
    Matcher m_Z9 = null;
    Pattern p_Z9 = Pattern.compile("\\nZ9\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String PU = ""; //储存Z9
    Matcher m_PU = null;
    Pattern p_PU = Pattern.compile("\\nPU\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String PI = ""; //储存PI
    Matcher m_PI = null;
    Pattern p_PI = Pattern.compile("\\nPI\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String PA = ""; //储存PA
    Matcher m_PA = null;
    Pattern p_PA = Pattern.compile("\\nPA\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    
    String SN = ""; //储存SN
    Matcher m_SN = null;
    Pattern p_SN = Pattern.compile("\\nSN\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    
    String J9 = ""; //储存J9
    Matcher m_J9 = null;
    Pattern p_J9 = Pattern.compile("\\nJ9\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String JI = ""; //储存JI
    Matcher m_JI = null;
    Pattern p_JI = Pattern.compile("\\nJI\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String PD = ""; //储存PD
    Matcher m_PD = null;
    Pattern p_PD = Pattern.compile("\\nPD\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String PY = ""; //储存PY
    Matcher m_PY = null;
    Pattern p_PY = Pattern.compile("\\nPY\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String VL = ""; //储存VL
    Matcher m_VL = null;
    Pattern p_VL = Pattern.compile("\\nVL\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String IS = ""; //储存IS
    Matcher m_IS = null;
    Pattern p_IS = Pattern.compile("\\nIS\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String BP = ""; //储存BP
    Matcher m_BP = null;
    Pattern p_BP = Pattern.compile("\\nBP\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String EP = ""; //储存EP
    Matcher m_EP = null;
    Pattern p_EP = Pattern.compile("\\nEP\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String DI = ""; //储存DI
    Matcher m_DI = null;
    Pattern p_DI = Pattern.compile("\\nDI\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String PG = ""; //储存PG
    Matcher m_PG = null;
    Pattern p_PG = Pattern.compile("\\nPG\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String WC = ""; //储存WC
    Matcher m_WC = null;
    Pattern p_WC = Pattern.compile("\\nWC\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String SC = ""; //储存SC
    Matcher m_SC = null;
    Pattern p_SC = Pattern.compile("\\nSC\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String GA = ""; //储存WC
    Matcher m_GA = null;
    Pattern p_GA = Pattern.compile("\\nGA\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String UT = ""; //储存UT
    Matcher m_UT = null;
    Pattern p_UT = Pattern.compile("\\nUT\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    //新加的
    // CA 团体作者
    // PN 子辑  
    // !!SU 增刊  
    //!!SI 特刊 
    // !!AR 文章编号 
    
    String CA = ""; //储存CA，团体作者
    Matcher m_CA = null;
    Pattern p_CA = Pattern.compile("\\nCA\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String PN = ""; //储存PN
    Matcher m_PN = null;
    Pattern p_PN = Pattern.compile("\\nPN\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String SU = ""; //储存SU，
    Matcher m_SU = null;
    Pattern p_SU = Pattern.compile("\\nSU\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String SI = ""; //储存SI，
    Matcher m_SI = null;
    Pattern p_SI = Pattern.compile("\\nSI\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String AR = ""; //储存AR，
    Matcher m_AR = null;
    Pattern p_AR = Pattern.compile("\\nAR\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String FU = ""; //储存AR，
    Matcher m_FU = null;
    Pattern p_FU = Pattern.compile("\\nFU\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    String FX = ""; //储存AR，
    Matcher m_FX = null;
    Pattern p_FX = Pattern.compile("\\nFX\\s{1}(.+?)\\n[0-9A-Z]{2}", Pattern.DOTALL);
    
    int left_fileName = 0;
    int right_fileName = 0;
    String fileName = "";
    String txtpath = "";
     //文件循环
     for(int nn=1;nn<2;nn=nn+10000){
        //left_fileName = nn;
        //right_fileName = nn+499;
        //fileName = "data_"+left_fileName+"_"+right_fileName+".txt";
        fileName = fileName1;
        //out.println(fileName);
       
     txtpath=this.getClass().getResource("/").getPath()+"data/"+fileName;//构建文件名
     
   
    
   
   

    int mm = 0;
   // Pattern p = Pattern.compile("Citations:", Pattern.DOTALL);    //由于Citations不是开头，需要用正则表达式判断
    
    //以行读取文件内容
    BufferedReader br = new BufferedReader(new FileReader(txtpath),10000);//10000不是指行数，是指缓冲区的大小
 
      String record = new String();
      String inputText = null;
      
      while ((record = br.readLine()) != null) { 
         // record = br.readLine();
         // out.println(record);
          if(record.startsWith("PT")){
            //out.println(++mm);
            PT = "";
            AU = "";
            AF = "";
            TI = "";
            SO = "";
            LA = "";
            DT = "";
            DE = "";
            ID = "";
            AB = "";
            C1 = "";
            RP = "";
            EM = "";
            CR = "";
            NR = "";
            TC = "";
            Z9 = "";
            PU = "";
            PI = "";
            PA = "";
            SN = "";
            J9 = "";
            JI = "";
            PD = "";
            PY = "";
            VL = "";
            IS = "";
            BP = "";
            EP = "";
            DI = "";
            PG = "";
            WC = "";
            SC = "";
            GA = "";
            UT = "";
            
            
            //新加的
				    // CA 团体作者
				    // PN 子辑  
				    // !!SU 增刊  
				    //!!SI 特刊 
				    // !!AR 文章编号
				    
				    CA = "";
				    PN = "";
				    SU = "";
				    SI = "";
				    AR = "";
				    FU = "";
            FX = "";
				    
				    
            TempStr = record+"\n";
            //out.println("<br>");
          }
          
          
            TempStr = TempStr + record+"\n";        
            if(record.startsWith("ER")){  
            
            //查找PT字段
	            m_PT = p_PT.matcher(TempStr);
	            while(m_PT.find()) { 
	                 PT =  m_PT.group(1).trim();
	                 
	                 //out.println(PT);
	                // out.println("<br>");  
	             } 
             
             
             //查找AU字段，作者间用分号分隔 
	            m_AU = p_AU.matcher(TempStr);
	            while(m_AU.find()) { 
	                 AU =  m_AU.group(1).trim();
	                 AU =  AU.replaceAll("\n",";");
	                 //AU =  AU.replaceAll("'","''").trim();
	                 //out.println(AU);
	                 //out.println("<br>");  
	            }     
	            
	            //查找AF字段全名，作者间用分号分隔 
	            m_AF = p_AF.matcher(TempStr);
	            while(m_AF.find()) { 
	                 AF =  m_AF.group(1).trim();
	                 AF =  AF.replaceAll("\n",";");
	                 //AF =  AF.replaceAll("'","''");
	                // out.println(AF);
	                // out.println("<br>");  
	            }             
	            
	              
	            //查找TI字段，将换行符转换为空格	          
	            m_TI = p_TI.matcher(TempStr);
	            while(m_TI.find()) {
	                TI = m_TI.group(1).trim();
	                TI = (TI.replaceAll("\n","")).trim();
	                TI =  TI.replaceAll("   "," ");
	               // TI =  TI.replaceAll("'","''");
	                //out.println(TI); 
	                //out.println("<br>"); 
	                
	            } 
	            
	             //查找SO字段，将换行符转换为空格	          
	            m_SO = p_SO.matcher(TempStr);
	            while(m_SO.find()) {
	                SO = m_SO.group(1).trim();
	                SO = SO.replaceAll("\n"," ");
	               // SO =  SO.replaceAll("'","''");
	                //out.println(m_SO.group(1).trim()); 
	                //out.println("<br>"); 
	                
	            } 
	            
	             //查找LA字段，将换行符转换为空格	          
	            m_LA = p_LA.matcher(TempStr);
	            while(m_LA.find()) {
	                LA = m_LA.group(1).trim();
	                LA = LA.replaceAll("\n"," ");
	               // LA =  LA.replaceAll("'","''");
	               // out.println(m_LA.group(1).trim()); 
	               // out.println("<br>"); 
	                
	            } 
	            
	             //查找DT字段，将换行符转换为空格	          
	            m_DT = p_DT.matcher(TempStr);
	            while(m_DT.find()) {
	                DT = m_DT.group(1).trim();
	                DT = (DT.replaceAll("\n"," ")).trim();
	               // DT =  DT.replaceAll("'","''");
	               // out.println(DT); 
	               // out.println("<br>"); 
	                
	            } 
	            
	            //查找DE字段，将换行符转换为空格	          
	            m_DE = p_DE.matcher(TempStr);
	            while(m_DE.find()) {
	                DE = m_DE.group(1).trim();
	                DE = (DE.replaceAll("\n"," ")).trim();
	               // DE =  DE.replaceAll("'","''");
	               // out.println(DE); 
	               // out.println("<br>"); 
	                
	            } 
	            
	            //查找ID字段，将换行符转换为空格	          
	            m_ID = p_ID.matcher(TempStr);
	            while(m_ID.find()) {
	                ID = m_ID.group(1).trim();
	                ID = (ID.replaceAll("\n"," ")).trim();
	               // ID =  ID.replaceAll("'","''");
	               // out.println(ID); 
	               // out.println("<br>"); 
	                
	            } 
	            
	             //查找AB字段，将换行符转换为空格	          
	            m_AB = p_AB.matcher(TempStr);
	            while(m_AB.find()) {
	                AB = m_AB.group(1).trim();
	                AB = (AB.replaceAll("\n"," ")).trim();
	               // AB =  AB.replaceAll("'","''");
	               // out.println("AB:  "+AB); 
	               // out.println("<br>"); 
	                
	            } 
	            
	             //查找C1字段，将换行符转换为分号	          
	            m_C1 = p_C1.matcher(TempStr);
	            while(m_C1.find()) {
	                C1 = m_C1.group(1).trim();
	                C1 = (C1.replaceAll("\n","##@@##;")).trim();
	               // C1 =  C1.replaceAll("'","''");
	               // out.println("C1:  "+C1); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找RP字段，将换行符转换为空格	          
	            m_RP = p_RP.matcher(TempStr);
	            while(m_RP.find()) {
	                RP = m_RP.group(1).trim();
	                RP = (RP.replaceAll("\n"," ")).trim();
	               // RP =  RP.replaceAll("'","''");
	               // out.println("RP:  "+RP); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找EM字段，将换行符转换为空格	          
	            m_EM = p_EM.matcher(TempStr);
	            while(m_EM.find()) {
	                EM = m_EM.group(1).trim();
	                EM = (EM.replaceAll("\n"," ")).trim();
	               // EM =  EM.replaceAll("'","''");
	                //out.println("EM:  "+EM); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找CR字段，将换行符转换为分号	          
	            m_CR = p_CR.matcher(TempStr);
	            while(m_CR.find()) {
	                CR = m_CR.group(1).trim();
	                CR = (CR.replaceAll("\n",";")).trim();
	               // CR =  CR.replaceAll("'","''");
	               // out.println("CR:  "+CR); 
	               // out.println("<br>"); 	                
	            } 

	            
	             //查找NR字段，将换行符转换为空格	          
	            m_NR = p_NR.matcher(TempStr);
	            while(m_NR.find()) {
	                NR = m_NR.group(1).trim();
	                NR = (NR.replaceAll("\n"," ")).trim();
	               // NR =  NR.replaceAll("'","''");
	               // out.println("NR:  "+NR); 
	               // out.println("<br>"); 	                
	            } 
	            
	             //查找TC字段，将换行符转换为空格	          
	            m_TC = p_TC.matcher(TempStr);
	            while(m_TC.find()) {
	                TC = m_TC.group(1).trim();
	                TC = (TC.replaceAll("\n"," ")).trim();
	              //  TC =  TC.replaceAll("'","''");
	               // out.println("TC:  "+TC); 
	               // out.println("<br>"); 	                
	            } 
	            
	             //查找Z9字段，将换行符转换为空格	          
	            m_Z9 = p_Z9.matcher(TempStr);
	            while(m_Z9.find()) {
	                Z9 = m_Z9.group(1).trim();
	                Z9 = (Z9.replaceAll("\n"," ")).trim();
	              //  Z9 =  Z9.replaceAll("'","''");
	               // out.println("Z9:  "+Z9); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找PU字段，将换行符转换为空格	          
	            m_PU = p_PU.matcher(TempStr);
	            while(m_PU.find()) {
	                PU = m_PU.group(1).trim();
	                PU = (PU.replaceAll("\n"," ")).trim();
	               // PU =  PU.replaceAll("'","''");
	               // out.println("PU:  "+PU); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找PI字段，将换行符转换为空格	          
	            m_PI = p_PI.matcher(TempStr);
	            while(m_PI.find()) {
	                PI = m_PI.group(1).trim();
	                PI = (PI.replaceAll("\n"," ")).trim();
	               // PI =  PI.replaceAll("'","''");
	               // out.println("PI:  "+PI); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找PA字段，将换行符转换为空格	          
	            m_PA = p_PA.matcher(TempStr);
	            while(m_PA.find()) {
	                PA = m_PA.group(1).trim();
	                PA = (PA.replaceAll("\n"," ")).trim();
	               // PA =  PA.replaceAll("'","''");
	               // out.println("PA:  "+PA); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找SN字段，将换行符转换为空格	          
	            m_SN = p_SN.matcher(TempStr);
	            while(m_SN.find()) {
	                SN = m_SN.group(1).trim();
	                SN = (SN.replaceAll("\n"," ")).trim();
	               // SN =  SN.replaceAll("'","''");
	               // out.println("SN:  "+SN); 
	               // out.println("<br>"); 	                
	            } 
	            
	            
	            
	            //查找J9字段，将换行符转换为空格	          
	            m_J9 = p_J9.matcher(TempStr);
	            while(m_J9.find()) {
	                J9 = m_J9.group(1).trim();
	                J9 = (J9.replaceAll("\n"," ")).trim();
	               // J9 =  J9.replaceAll("'","''");
	                //out.println("J9:  "+J9); 
	                //out.println("<br>"); 	                
	            } 
	            
	            //查找JI字段，将换行符转换为空格	          
	            m_JI = p_JI.matcher(TempStr);
	            while(m_JI.find()) {
	                JI = m_JI.group(1).trim();
	                JI = (JI.replaceAll("\n"," ")).trim();
	               // JI =  JI.replaceAll("'","''");
	               // out.println("JI:  "+JI); 
	               // out.println("<br>"); 	                
	            } 
	            
	            
	            //查找PD字段，将换行符转换为空格	          
	            m_PD = p_PD.matcher(TempStr);
	            while(m_PD.find()) {
	                PD = m_PD.group(1).trim();
	                PD = (PD.replaceAll("\n"," ")).trim();
	               // PD =  PD.replaceAll("'","''");
	               // out.println("PD:  "+PD); 
	               // out.println("<br>"); 	                
	            } 
	            
	            
	            //查找PY字段，将换行符转换为空格	          
	            m_PY = p_PY.matcher(TempStr);
	            while(m_PY.find()) {
	                PY = m_PY.group(1).trim();
	                PY = (PY.replaceAll("\n"," ")).trim();
	               // PY =  PY.replaceAll("'","''");
	               // out.println("PY:  "+PY); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找VL字段，将换行符转换为空格	          
	            m_VL = p_VL.matcher(TempStr);
	            while(m_VL.find()) {
	                VL = m_VL.group(1).trim();
	                VL = (VL.replaceAll("\n"," ")).trim();
	               // VL =  VL.replaceAll("'","''");
	                //out.println("VL:  "+VL); 
	                //out.println("<br>"); 	                
	            } 
	            
	            //查找IS字段，将换行符转换为空格	          
	            m_IS = p_IS.matcher(TempStr);
	            while(m_IS.find()) {
	                IS = m_IS.group(1).trim();
	                IS = (IS.replaceAll("\n"," ")).trim();
	               // IS =  IS.replaceAll("'","''");
	                //out.println("IS:  "+IS); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找BP字段，将换行符转换为空格	          
	            m_BP = p_BP.matcher(TempStr);
	            while(m_BP.find()) {
	                BP = m_BP.group(1).trim();
	                BP = (BP.replaceAll("\n"," ")).trim();
	                //BP =  BP.replaceAll("'","''");
	               // out.println("BP:  "+BP); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找EP字段，将换行符转换为空格	          
	            m_EP = p_EP.matcher(TempStr);
	            while(m_EP.find()) {
	                EP = m_EP.group(1).trim();
	                EP = (EP.replaceAll("\n"," ")).trim();
	                //EP =  EP.replaceAll("'","''");
	              //  out.println("EP:  "+EP); 
	              //  out.println("<br>"); 	                
	            } 
	            
	             //查找DI字段，将换行符转换为空格	          
	            m_DI = p_DI.matcher(TempStr);
	            while(m_DI.find()) {
	                DI = m_DI.group(1).trim();
	                DI = (DI.replaceAll("\n"," ")).trim();
	               // DI =  DI.replaceAll("'","''");
	                //out.println("DI:  "+DI); 
	                //out.println("<br>"); 	                
	            } 
	            
	             //查找PG字段，将换行符转换为空格	          
	            m_PG = p_PG.matcher(TempStr);
	            while(m_PG.find()) {
	                PG = m_PG.group(1).trim();
	                PG = (PG.replaceAll("\n"," ")).trim();
	               // PG =  PG.replaceAll("'","''");
	                //out.println("PG:  "+PG); 
	               // out.println("<br>"); 	                
	            } 
	            
	             //查找WC字段，将换行符转换为空格	          
	            m_WC = p_WC.matcher(TempStr);
	            while(m_WC.find()) {
	                WC = m_WC.group(1).trim();
	                WC = (WC.replaceAll("\n"," ")).trim();
	               // WC =  WC.replaceAll("'","''");
	               // out.println("WC:  "+WC); 
	               // out.println("<br>"); 	                
	            } 
	            
	             //查找SC字段，将换行符转换为空格	          
	            m_SC = p_SC.matcher(TempStr);
	            while(m_SC.find()) {
	                SC = m_SC.group(1).trim();
	                SC = (SC.replaceAll("\n"," ")).trim();
	               // SC =  SC.replaceAll("'","''");
	                //out.println("SC:  "+SC); 
	                //out.println("<br>"); 	                
	            } 
	            
	            //查找GA字段，将换行符转换为空格	          
	            m_GA = p_GA.matcher(TempStr);
	            while(m_GA.find()) {
	                GA = m_GA.group(1).trim();
	                GA = (GA.replaceAll("\n"," ")).trim();
	               // GA =  GA.replaceAll("'","''");
	               // out.println("GA:  "+GA); 
	               // out.println("<br>"); 	                
	            } 
	            
	            //查找UT字段，将换行符转换为空格	          
	            m_UT = p_UT.matcher(TempStr);
	            while(m_UT.find()) {
	                UT = m_UT.group(1).trim();
	                UT = (UT.replaceAll("\n"," ")).trim();
	               // UT =  UT.replaceAll("'","''");
	               // out.println("UT:  "+UT); 
	               // out.println("<br>"); 	                
	            } 
	            
	             //新加的
						    // CA 团体作者
						    // PN 子辑  
						    // !!SU 增刊  
						    //!!SI 特刊 
						    // !!AR 文章编号
						    
						    //查找CA字段，将换行符转换为空格	          
	            m_CA = p_CA.matcher(TempStr);
	            while(m_CA.find()) {
	                CA = m_CA.group(1).trim();
	                CA = (CA.replaceAll("\n"," ")).trim();
	               // CA =  CA.replaceAll("'","''");
	                     
	            } 
	            
	            //查找PN字段，将换行符转换为空格	          
	            m_PN = p_PN.matcher(TempStr);
	            while(m_PN.find()) {
	                PN = m_PN.group(1).trim();
	                PN = (PN.replaceAll("\n"," ")).trim();
	               // PN =  PN.replaceAll("'","''");	                     
	            } 
	            
	             //查找SU字段，将换行符转换为空格	          
	            m_SU = p_SU.matcher(TempStr);
	            while(m_SU.find()) {
	                SU = m_SU.group(1).trim();
	                SU = (SU.replaceAll("\n"," ")).trim();
	               // SU =  SU.replaceAll("'","''");	                     
	            } 
	            
	             //查找SI字段，将换行符转换为空格	          
	            m_SI = p_SI.matcher(TempStr);
	            while(m_SI.find()) {
	                SI = m_SI.group(1).trim();
	                SI = (SI.replaceAll("\n"," ")).trim();
	               // SI =  SI.replaceAll("'","''");	                     
	            } 
	            
	             //查找AR字段，将换行符转换为空格	          
	            m_AR = p_AR.matcher(TempStr);
	            while(m_AR.find()) {
	                AR = m_AR.group(1).trim();
	                AR = (AR.replaceAll("\n"," ")).trim();
	               // AR =  AR.replaceAll("'","''");	                     
	            } 
	            
	            //查找FU字段，将换行符转换为空格	          
	            m_FU = p_FU.matcher(TempStr);
	            while(m_FU.find()) {
	                FU = m_FU.group(1).trim();
	                FU = (FU.replaceAll("\n"," ")).trim();
	               // AR =  AR.replaceAll("'","''");	                     
	            } 
	            
	            //查找FX字段，将换行符转换为空格	          
	            m_FX = p_FX.matcher(TempStr);
	            while(m_FX.find()) {
	                FX = m_FX.group(1).trim();
	                FX = (FX.replaceAll("\n"," ")).trim();
	               // AR =  AR.replaceAll("'","''");	                     
	            } 
	            
	            
	           //插入数据库,IS是sql的保留字，不能直接用
	          // sql_insert = "insert into SCIDatatest(PT,AU,AF,TI,SO,LA,DT,DE,ID,AB,C1,RP,EM,CR,NR,TC,Z9,PU,PI,PA,SN,J9,JI,PD,PY,VL,IS1,BP,EP,DI,PG,WC,SC,GA,UT,CA,PN,SU,SI,AR) values('"+PT+"'"+","+"'"+AU+"','"+AF+"','"+TI+"','"+SO+"','"+LA+"','"+DT+"','"+DE+"','"+ID+"','"
	          // +AB+"','"+C1+"','"+RP+"','"+EM+"','"+CR+"','"+NR+"','"+TC+"','"+Z9+"','"+PU+"','"+PI+"','"+PA+"','"+SN+"','"+J9+"','"+JI+"','"+PD+"','"+PY+"','"+VL+"','"+IS+"','"+BP+"','"+EP+"','"+DI+"','"+PG+"','"+WC+"','"+SC+"','"+GA+"','"+UT+"','"+CA+"','"+PN+"','"+SU+"','"+SI+"','"+AR+"')";
	           
	           
	         
	          //out.println(sql_insert);
	           //out.println("<br>");
	          //if(db.execUpdate(sql_insert)){
	           	// System.setOut(log_out);
	            //System.out.println(fileName+" :"+(++mm));
	            //System.setOut(screen_out);
	           // System.out.println(fileName+" :"+(++mm));
	         // };
	          
	          //使用PreparedStatement不需要对字符进行转义
	          
	          
	          pStmt.setString(1,PT);
	          pStmt.setString(2,AU);
            pStmt.setString(3,AF);
            pStmt.setString(4,TI);
            pStmt.setString(5,SO);
            pStmt.setString(6,LA);
            pStmt.setString(7,DT);
            pStmt.setString(8,DE);
            pStmt.setString(9,ID);
            pStmt.setString(10,AB);
            pStmt.setString(11,C1);
	          pStmt.setString(12,RP);
            pStmt.setString(13,EM);
            pStmt.setString(14,CR);
            pStmt.setString(15,NR);
            pStmt.setString(16,TC);
            pStmt.setString(17,Z9);
            pStmt.setString(18,PU);
            pStmt.setString(19,PI);
            pStmt.setString(20,PA);
            pStmt.setString(21,SN);
	          pStmt.setString(22,J9);
            pStmt.setString(23,JI);
            pStmt.setString(24,PD);
            pStmt.setString(25,PY);
            pStmt.setString(26,VL);
            pStmt.setString(27,IS);
            pStmt.setString(28,BP);
            pStmt.setString(29,EP);
            pStmt.setString(30,DI);
            pStmt.setString(31,PG);
	          pStmt.setString(32,WC);
            pStmt.setString(33,SC);
            pStmt.setString(34,GA);
            pStmt.setString(35,UT);
            pStmt.setString(36,CA);
            pStmt.setString(37,PN);
            pStmt.setString(38,SU);
            pStmt.setString(39,SI);
            pStmt.setString(40,AR);
            pStmt.setString(41,FU);
            pStmt.setString(42,FX);
            
            pStmt.executeUpdate();
            
            System.out.println(fileName+" :"+(++mm));
	          
	          
	         
	           
	            
	            
    
          }
     }    
          
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