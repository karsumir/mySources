package com.hanb.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;


@Repository
public class WeatherDataDao {

	public String getWeatherData(String code){
		String finalStr="";
		try{
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

		finalStr=str1+str2+str3;		
		}catch(Exception e){e.getMessage();}
		return finalStr;
	}
	
}
