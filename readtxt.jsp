
<%

public static void fileWriteLine(String file, String text) throws IOException {
  PrintWriter out = new PrintWriter(new FileWriter(file));    
  out.print(text);   
  out.close();
 }
 public static StringBuffer fileReadLine(String file) throws IOException {
     BufferedReader br = new BufferedReader(new FileReader(file));
     String record = new String();
     StringBuffer sb = new StringBuffer();
     while ((record = br.readLine()) != null) {
      sb.append(record);
     }
     br.close();
     return sb;
 }
 
 %>