package common.vo;

public class PageVO {
	private int pageList = 10; //페이지당 보여질 목록수
	private int blockPage = 10; //블럭당 보여질 페이지수
	private int totalList; //총 목록수: DB에서 조회
	private int totalPage; //총 페이지수: 총목록수/페이지당 보여질 목록수 .. 나머지가 있으면 +1
	private int totalBlock; //총 블럭수: 총페이지수/블럭당 보여질 페이지수.. 나머지가 있으면 +1
	private int curPage; //현재 페이지번호
	private int curBlock; //현재 블럭번호
	//페이지에서 보여질 목록번호: 시작목록번호, 끝목록번호
	private int beginList, endList;
	//페이지에서 보여질 페이지번호: 시작페이지번호, 끝페이지번호
	private int beginPage, endPage;
	
	//검색형태, 검색키워드
	private String search, keyword;
	
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPageList() {
		return pageList;
	}
	public void setPageList(int pageList) {
		this.pageList = pageList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getTotalList() {
		return totalList;
	}
	public void setTotalList(int totalList) {
		this.totalList = totalList;
		//DB에서 조회해온 총 목록수에 따라
		//총 페이지수가 결정된다. 총목록수/페이지당보여질목록수, 나머지 있으면+1
		totalPage = totalList / pageList 
					+ (totalList % pageList==0 ? 0 : 1) ;
		//총 페이지수에 따라 총 블럭수가 결정된다.
		//총페이지수/블럭당 보여질 페이지수, 나머지 있으면+1
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage >0) ++totalBlock;
		
		//페이지번호에 따라 
		//끝 목록번호 :총 목록수 - (페이지번호-1) * 페이지당 보여질 목록수
		endList = totalList - (curPage-1)*pageList;
		//시작 목록번호 : 끝 목록번호 - (페이지당 보여질 목록수-1)
		beginList = endList - (pageList-1);
		
		//현재블럭에 따라 보여지는 페이지번호가 다르므로 현재 몇블럭인지부터 알아야 한다.
		//블럭번호 = 페이지번호 / 블럭당 보여질 페이지수, 나머지 있으면+1
		curBlock = curPage / blockPage;
		if( curPage % blockPage >0 ) ++curBlock;
		
		//블럭번호에 따라서 보여지는 페이지번호가 다르므로
		//끝 페이지번호 : 블록번호 * 블록당 보여질 페이지수
		endPage = curBlock * blockPage;
		//시작 페이지번호 : 끝 페이지번호 - (블럭당 보여질 페이지수-1)
		beginPage = endPage - (blockPage-1);
		//마지막 블럭에서 끝 페이지번호가 총 페이지수보다 클 수 없으므로
		//총 페이지수를 끝 페이지번호로 한다.
		if( endPage>totalPage ) endPage = totalPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getBeginList() {
		return beginList;
	}
	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}
	public int getEndList() {
		return endList;
	}
	public void setEndList(int endList) {
		this.endList = endList;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
