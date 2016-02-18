<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/xml; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%
String code=request.getParameter("code");    	
URL myUrl= new URL("http://weather.yahooapis.com/forecastrss?w="+code+"&u=c");

InputStreamReader reader=new InputStreamReader(myUrl.openStream());
BufferedReader br=new BufferedReader(reader);
String inputLine="";
String str="";
while((inputLine=br.readLine())!=null)
{
  str+=inputLine.trim();
}

String str1=str.substring(str.indexOf("<rss"), str.indexOf("<description>"));
String str2=str.substring(str.indexOf("</description>")+"</description>".length(), str.indexOf("<![CDATA")-"</description>".length()+1);
String str3=str.substring(str.indexOf("<yweather:forecast"), str.lastIndexOf("</rss>")+"</rss>".length());

String finalStr=str1+str2+str3;
//out.write("<goods><good><name>3</name><price>30</price></good><good><name>3</name><price>30</price></good></goods>");
out.write(finalStr);
//System.out.print(str);    
%>
