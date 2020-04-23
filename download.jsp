<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
 
<%
    String filename = request.getParameter("filename") + ".pdf";
    String filename_h = request.getParameter("filename_h") + ".pdf";
    String file_location = "/app/tmax/jeus/webhome/context_name/download";
 
    File file = null;
    BufferedInputStream fin = null;
    BufferedOutputStream outs = null;
 
    try{
       
        file = new File(file_location, filename);
        response.reset();
 
        response.setHeader("Content-Type","application/pdf");
        response.setHeader("Content-Disposition","attachment;filename="+filename_h+";");
 
        if(file != null){
            fin = new BufferedInputStream(new FileInputStream(file));
            outs = new BufferedOutputStream(response.getOutputStream());
 
            int read = 0;
 
            while((read = fin.read()) != -1 ){
                outs.write(read);
            }
        }
 
    }catch(Exception e){
        response.setContentType("text/html;charset=euc-kr");
        out.println("<script type='text/javascript'>");
        out.println("alert('파일 오픈 중 오류가 발생하였습니다.');");
        out.println("</script>");
    }finally{
 
        if(outs != null) fin.close();
        if(fin != null) outs.close();
 
    }
   
%>
