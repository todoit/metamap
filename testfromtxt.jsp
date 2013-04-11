<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="gov.nih.nlm.nls.metamap.*,java.util.*,java.io.*" %>

<html>
<body>

<font size="4" face="arial" color="black">
<%


   
try{

 String   txtname = request.getParameter("txtname");//拿到文本值
   // 不能为空，否则服务器关闭
   if(txtname.equals("")||txtname==null){
     out.println("please input your text!");
     return;
   }

   String txtpath=this.getClass().getResource("/").getPath()+txtname;
   out.println(txtpath);
   
//读取文件内容
   BufferedReader br = new BufferedReader(new FileReader(txtpath));

     String record = new String();
     String inputText = null;
     while ((record = br.readLine()) != null) {
      inputText+=record;
      
     }
     out.println(inputText);
     br.close();



 
          
 
   
   MetaMapApi api = new MetaMapApiImpl(); //初始化

   out.println("<br>");
 
   List<String> theOptions = new ArrayList<String>();
    theOptions.add("-y");  // turn on Word Sense Disambiguation
    if (theOptions.size() > 0) {
      api.setOptions(theOptions);
    }
 
   List<Result> resultList = api.processCitationsFromString(inputText);


   if(resultList.size()>0){
   	
   	   for(int i =0; i < resultList.size(); i++){
		   Result result = resultList.get(0);
		   List<AcronymsAbbrevs> aaList = result.getAcronymsAbbrevs();
		   if (aaList.size() > 0) {
			   out.println("Acronyms and Abbreviations:");
			    out.println("<br>");
			   for (AcronymsAbbrevs e: aaList) {
			    out.println("Acronym: " + e.getAcronym());
			     out.println("<br>");
			    out.println("Expansion: " + e.getExpansion());
			     out.println("<br>");
			    out.println("Count list: " + e.getCountList());
			     out.println("<br>");
			    out.println("CUI list: " + e.getCUIList());
			     out.println("<br>");
			    }
			  }
			
  else
    out.println(" None.");
    out.println("<br>");
    List<Negation> negList = result.getNegations();
					if (negList.size() > 0) {
					  out.println("Negations:");
					   out.println("<br>");
					  for (Negation e: negList) {
					    out.println("type: " + e.getType());
					     out.println("<br>");
					    out.print("Trigger: " + e.getTrigger() + ": [");
					    for (Position pos: e.getTriggerPositionList()) {
					      out.print(pos  + ",");
					    }
					    out.println("]");
					    out.print("ConceptPairs: [");
					    for (ConceptPair pair: e.getConceptPairList()) {
					      out.print(pair + ",");
					    }
					    out.println("]");
					    out.print("ConceptPositionList: [");
					    for (Position pos: e.getConceptPositionList()) {
					      out.print(pos + ",");
					    }
					    out.println("]");
					     out.println("<br>");
					  }
					} else {
						out.println(" None.");
						 out.println("<br>");
					}

			for (Utterance utterance: result.getUtteranceList()) {
			  
				out.println("<font color=red bold> Utterance:</font>");
				 out.println("<br>");
				out.println("&nbsp;&nbsp;"+" Id: " + utterance.getId());
				 out.println("<br>");
				out.println("&nbsp;&nbsp;"+" Utterance text: " + utterance.getString());
				 out.println("<br>");
				out.println("&nbsp;&nbsp;"+" Position: " + utterance.getPosition());
				 out.println("<br>");
			   for (PCM pcm: utterance.getPCMList()) {
			   	 out.println("<font color=red bold>Phrase:</font>");
			   	  out.println("<br>");
	         out.println("&nbsp;&nbsp;"+" text: " + pcm.getPhrase().getPhraseText());
	          out.println("<br>");
	          out.println("&nbsp;&nbsp;"+" Minimal Commitment Parse: " + pcm.getPhrase().getMincoManAsString());
	          out.println("<br>");
	         out.println("<font color=red bold>Candidates:</font>");
	          out.println("<br>");
          for (Ev ev: pcm.getCandidateList()) {
            out.println("&nbsp;&nbsp;"+"<font color=red bold> Candidate:</font>");
             out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Score: " + ev.getScore());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Concept Id: " + ev.getConceptId());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Concept Name: " + ev.getConceptName());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Preferred Name: " + ev.getPreferredName());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Matched Words: " + ev.getMatchedWords());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Semantic Types: " + ev.getSemanticTypes());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  MatchMap: " + ev.getMatchMap());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  MatchMap alt. repr.: " + ev.getMatchMapList());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  is Head?: " + ev.isHead());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  is Overmatch?: " + ev.isOvermatch());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Sources: " + ev.getSources());
            out.println("<br>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"  Positional Info: " + ev.getPositionalInfo());
            out.println("<br>");
          }
          
          out.println("<font color=red bold>Mappings:</font>");
          out.println("<br>");
          for (Mapping map: pcm.getMappingList()) {
            out.println("&nbsp;&nbsp;"+" Map Score: " + map.getScore());
            for (Ev mapEv: map.getEvList()) {
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Score: " + mapEv.getScore());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Concept Id: " + mapEv.getConceptId());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Concept Name: " + mapEv.getConceptName());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Preferred Name: " + mapEv.getPreferredName());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Matched Words: " + mapEv.getMatchedWords());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Semantic Types: " + mapEv.getSemanticTypes());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   MatchMap: " + mapEv.getMatchMap());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   MatchMap alt. repr.: " + mapEv.getMatchMapList());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   is Head?: " + mapEv.isHead());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   is Overmatch?: " + mapEv.isOvermatch());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Sources: " + mapEv.getSources());
              out.println("<br>");
              out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+"   Positional Info: " + mapEv.getPositionalInfo());
              out.println("<br>");
            }
          }
        }
      }
  
 
    
  }
} else {
  out.println(" None.");
}
 
 
 
 
 
 
 
 }catch(Exception e){
	e.printStackTrace();
}


%>


</font></p>

</body>
</html>