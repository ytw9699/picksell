package com.mycom.common;

public class Paging {

	private int currentPage;  
	private int totalCount;	 
	private int totalPage;	
	private int blockCount;	 
	private int blockPage;	 
	private int startCount;	
	private int endCount;	 
	private int startPage;	 
	private int endPage;	 
	private String torrentName;

	private StringBuffer pagingHtml;

	
	public Paging(int currentPage, int totalCount, int blockCount,
			int blockPage, String torrentName) {

		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.torrentName = torrentName;

		
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		
		if (endPage > totalPage) {
			endPage = totalPage;
		}


		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a class='page prv' href=" + torrentName + ".torrent?currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
		}

		
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			} else {
				pagingHtml.append("<a class='page' href=" + torrentName + ".torrent?currentPage=");
				pagingHtml.append(i);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}

		
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a class='page next' href=" + torrentName + ".torrent?currentPage=" + (endPage + 1) + ">");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
		}
	}

	
	public Paging(int currentPage, int totalCount, int blockCount, int blockPage,String torrentName, int searchNum, String isSearch){
		
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if(totalPage == 0){
			totalPage = 1;
		}
		
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		startCount = (currentPage -1) * blockCount;
		endCount = startCount + blockCount -1;
		
		startPage = (int)((currentPage -1) / blockPage) * blockPage +1;
		endPage = startPage + blockPage -1;
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		
		pagingHtml = new StringBuffer();
		if(currentPage > blockPage){
			if(isSearch != "")
				pagingHtml.append("<a class='page prv' href=" + torrentName + ".torrent?currentPage=" + (startPage - 1) + "&searchNum="+searchNum+ "&isSearch="+isSearch+">");
			else                    
				pagingHtml.append("<a class='page prv' href=" + torrentName + ".torrent?currentPage=" + (startPage - 1) + ">");
			pagingHtml.append("&lt;");
			pagingHtml.append("</a>");
			}
		
		
		for(int i = startPage; i <= endPage; i++){
			if(i > totalPage){
				break;
			}
			if(i == currentPage){
				pagingHtml.append("<strong>");
				pagingHtml.append(i);
				pagingHtml.append("</strong>");
			}
			else{
				pagingHtml.append("<a class='page' href=" + torrentName + ".torrent?currentPage=" + i);
				if(isSearch != "")
					pagingHtml.append("&isSearch=" + isSearch+"&searchNum="+searchNum);
				pagingHtml.append(">");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
		}
		
		if(totalPage - startPage >= blockPage){
			pagingHtml.append("<a class='page next' href=" + torrentName + ".torrent?currentPage=" + (endPage + 1));
			if(isSearch != "")
				pagingHtml.append("&isSearch=" + isSearch+"&searchNum="+searchNum);
			pagingHtml.append(">");
			pagingHtml.append("&gt;");
			pagingHtml.append("</a>");
		}
			
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public String gettorrentName() {
		return torrentName;
	}

	public void settorrentName(String torrentName) {
		this.torrentName = torrentName;
	}
}