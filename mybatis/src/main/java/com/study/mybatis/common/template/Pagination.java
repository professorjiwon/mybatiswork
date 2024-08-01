package com.study.mybatis.common.template;

import com.study.mybatis.common.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int totalRecord, int nowPage, int numPerPage, int pagePerBlock) {
		int totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
		int startPage = (nowPage-1) / pagePerBlock * pagePerBlock + 1;
		int endPage = startPage + pagePerBlock - 1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		return new PageInfo(totalRecord, numPerPage, pagePerBlock, nowPage, totalPage, startPage, endPage);
	}
}
