package com.dy.utils;


public class PageBar {
	private Integer pageNumber; // 页码
	private Integer pageSize; // 页面大小
	private Integer startIndex; // 分页查询时的开始索引

	public Integer getStartIndex() {
		if(pageNumber != null){
			startIndex = (pageNumber - 1) * pageSize;
		}
		return startIndex;
	}
	
	public Integer getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
