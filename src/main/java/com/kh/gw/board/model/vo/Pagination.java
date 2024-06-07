package com.kh.gw.board.model.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.kh.gw.board.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		
		int limit = 10;
		int buttonCount = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		startPage = (((int)((double) currentPage / buttonCount + 0.9)) - 1) * buttonCount + 1;
		endPage = startPage + buttonCount - 1;
		
		if(maxPage < endPage) {
			 endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		return pi;
	}
	
	
	
//	public String makeSearch(int currentPage, PageInfo pi)
//	{
//	  
//	 UriComponents uriComponents =
//	            UriComponentsBuilder.newInstance()
//	            .queryParam("page", currentPage)
//	            .queryParam("perPageNum", pi.getLimit())
//	            .queryParam("searchType", ((SearchCriteria)pi).getSearchType())
//	            .queryParam("keyword", encoding(((SearchCriteria)pi).getKeyword()))
//	            .build(); 
//	    return uriComponents.toUriString();  
//	}
//
//	private String encoding(String keyword) {
//		if(keyword == null || keyword.trim().length() == 0) { 
//			return "";
//		}
//		 
//		try {
//			return URLEncoder.encode(keyword, "UTF-8");
//		} catch(UnsupportedEncodingException e) { 
//			return ""; 
//		}
//	}

}
