package com.kh.gw.common.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.codehaus.jackson.map.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {
	
	@RequestMapping(value="/login.vi", method = RequestMethod.POST)
	public String loginCheck() {
		//System.out.println("memberController 불림");
		return "main/main";
	}
	
	@RequestMapping(value="/goDash.vi")
	public String moveDash() {
		//System.out.println("대시보드로 이동");
		return "main/main";
	}
	

	@RequestMapping("/showLogin.vi")
	public String showLogin() {
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/logout.vi")
	public String goLogin(HttpServletRequest request) {		
		request.getSession().invalidate();
		return "redirect:index.jsp";
	}
	
	@RequestMapping("/weather.vi")
	public String goWeather(Model model, HttpServletRequest request) {		
		
		String locationCode = "09680650"; 
		String getCode = request.getQueryString();
		if(getCode != null) {
			locationCode = getCode;
		}
		
		HttpPost http = new HttpPost("https://weather.naver.com/rgn/townWetr.nhn?naverRgnCd=" + locationCode);

		HttpClient httpClient = HttpClientBuilder.create().build();

		 try {
			HttpResponse response = httpClient.execute(http);
			HttpEntity entity = response.getEntity();
				
			ContentType contentType = ContentType.getOrDefault(entity);

	        Charset charset = contentType.getCharset();
	        BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));

		    StringBuffer sb = new StringBuffer();

		    String line = "";

		    while((line=br.readLine()) != null){
		    	sb.append(line+"\n");
		    }
		    //System.out.println(sb.toString());

		    Document doc = Jsoup.parse(sb.toString());
			Elements currentWeather = doc.select(".w_now2");
			Elements currentLocation = doc.select(".c_tit2");
			List<Element> currentLocation2 = doc.select("h4");
//			System.out.println(currentLocation2.get(0));
//			System.out.println(currentLocation2.get(1));
//			System.out.println(currentLocation2.get(2));
//			System.out.println(currentLocation2.get(3));
			//System.out.println(currentWeather.toString().replaceAll("\n", ""));
			Elements weatherTable1 = doc.select(".tbl_today3");
			Elements weatherTable2 = doc.select(".tbl_today4");
			
			Elements currentWeatherATag = currentWeather.select("a");
			currentWeatherATag.remove();
			
			model.addAttribute("doc", doc);
			model.addAttribute("currentLocation", currentLocation.toString().replaceAll("\n", ""));
			model.addAttribute("currentLocation2", currentLocation2.get(1).toString().replaceAll("\n", ""));
			model.addAttribute("currentWeather", currentWeather.toString().replaceAll("\n", ""));
			model.addAttribute("weatherTable1", weatherTable1.toString().replaceAll("\n", ""));
			model.addAttribute("weatherTable2", weatherTable2.toString().replaceAll("\n", ""));

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "common/weatherInHome";
	}
}
