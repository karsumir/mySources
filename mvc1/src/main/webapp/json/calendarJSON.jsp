<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String u_id = (String)session.getAttribute("id");
	
	System.out.println(u_id);
	
	
	StringBuffer sb = new StringBuffer();
	sb.append("[");
	String sql = "select u_id, to_char(startd, 'yyyy\"년\"mm\"월\"dd\"일\" hh24:mi'), to_char(endd, 'yyyy\"년\"mm\"월\"dd\"일\" hh24:mi'), attach, title, content, place from schedule where u_id=?";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.236.209.143:1521:XE", "tiger", "scott");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, u_id);

	ResultSet rs = pstmt.executeQuery();
	while(rs.next())
	{
		sb.append("{");
		sb.append("\"u_id\":\""+rs.getString(1)+"\",");
		sb.append("\"startd\":\""+rs.getString(2)+"\",");
		sb.append("\"endd\":\""+rs.getString(3)+"\",");		
		sb.append("\"attach\":\""+rs.getString(4)+"\",");		
		sb.append("\"title\":\""+rs.getString(5)+"\",");
		sb.append("\"content\":\""+rs.getString(6)+"\",");
		sb.append("\"place\":\""+rs.getString(7)+"\"");
		sb.append("},");
	}
	if (sb.length() > 2)
	{
		sb.deleteCharAt(sb.lastIndexOf(","));
		//System.out.println("sb  : " + sb);
	}
	sb.append("]");
	out.write(sb.toString());
	
	rs.close();
	pstmt.close();
	conn.close();
%>