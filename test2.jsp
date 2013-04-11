<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="gov.nih.nlm.nls.metamap.*,java.util.*,java.io.*" %>

<html>
<body>

<font size="4" face="arial" color="black">
	<table>
<%
try{
   
 
          
 
   
   MetaMapApi api = new MetaMapApiImpl(); //初始化

   //out.println("<br>");
 
   List<String> theOptions = new ArrayList<String>();
    theOptions.add("-y");  // turn on Word Sense Disambiguation
    if (theOptions.size() > 0) {
      api.setOptions(theOptions);
    }
   String [] shuzu = {"Immune","infections","hiv","vaccine","malaria","diseases","common","infection","influenza","countries","host","human","risk","children","control","response","strains","transmission","vaccines","africa","viral","mrsa","incidence","vaccination","health","infection","associated","prevalence","disease","global","human","aureus","factors","developed","burden","virus","particularly","prevention","pandemic","developing","understanding","isolates","strategies","individuals","research","infectious","reported","women","pneumococcal","people","patients","studies","disease","tuberculosis","resistance","treatment","data","patients","diagnostic","treatment","therapy","review","bacterial","research","clinical","antiretroviral","evidence","infection","diagnosis","drug","study","trials","pneumonia","settings","drugs","compared","effect","clinical","tests","antibiotic","adverse","effects","acute","detection","antimicrobial","children","risk","cause","laboratory","antibiotics","primary","included","meningitis","methods","development","findings","outcomes","fever","current","potential"};
   String concept = "";
   for(int j =0;j<100;j++){
   String   inputText = shuzu[j];//拿到文本值
    concept = "";
   // 不能为空，否则服务器关闭
   if(inputText.equals("")||inputText==null){
     //out.println("please input your text!");
     return;
   }
   List<Result> resultList = api.processCitationsFromString(inputText);
   
   

									 
											   Result result = resultList.get(0);
											   List<AcronymsAbbrevs> aaList = result.getAcronymsAbbrevs();
								
												    for (Utterance utterance: result.getUtteranceList()) {
											
												         for (PCM pcm: utterance.getPCMList()) {
												          
												         
									                   for (Mapping map: pcm.getMappingList()) {
									                       for (Ev mapEv: map.getEvList()) {
									                      
									                           //out.println(mapEv.getPreferredName()+"|");	
									                           //concept = concept + mapEv.getPreferredName()+"|";
									                           //semanticTypes = semanticTypes + mapEv.getSemanticTypes()+"|";
									                           //conceptID =conceptID+ mapEv.getConceptId()+"|";
									                           //out.println("<br>");
									                           concept = mapEv.getPreferredName();
									                           
					              
									                       }									            
									                   break;
									 
									                   }
									              
									              
									               }
									               
									          }
									          
									          
									          %>
									                           <tr>
																              	 <td><%=j+1%></td>	
																              	  <td><%=shuzu[j]%></td>	
																              	<td><%= concept%></td>	
																              	
																              </tr>
														<%
									

   
   
              

           
 
 }
 
 
 }catch(Exception e){
	e.printStackTrace();
}


%>


</font></p>
</table>
</body>
</html>