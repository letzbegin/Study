package common.vo;

public class PageVO {
	private int pageList = 10; //�������� ������ ��ϼ�
	private int blockPage = 10; //���� ������ ��������
	private int totalList; //�� ��ϼ�: DB���� ��ȸ
	private int totalPage; //�� ��������: �Ѹ�ϼ�/�������� ������ ��ϼ� .. �������� ������ +1
	private int totalBlock; //�� ����: ����������/���� ������ ��������.. �������� ������ +1
	private int curPage; //���� ��������ȣ
	private int curBlock; //���� ����ȣ
	//���������� ������ ��Ϲ�ȣ: ���۸�Ϲ�ȣ, ����Ϲ�ȣ
	private int beginList, endList;
	//���������� ������ ��������ȣ: ������������ȣ, ����������ȣ
	private int beginPage, endPage;
	
	//�˻�����, �˻�Ű����
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
		//DB���� ��ȸ�ؿ� �� ��ϼ��� ����
		//�� ���������� �����ȴ�. �Ѹ�ϼ�/�������纸������ϼ�, ������ ������+1
		totalPage = totalList / pageList 
					+ (totalList % pageList==0 ? 0 : 1) ;
		//�� ���������� ���� �� ������ �����ȴ�.
		//����������/���� ������ ��������, ������ ������+1
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage >0) ++totalBlock;
		
		//��������ȣ�� ���� 
		//�� ��Ϲ�ȣ :�� ��ϼ� - (��������ȣ-1) * �������� ������ ��ϼ�
		endList = totalList - (curPage-1)*pageList;
		//���� ��Ϲ�ȣ : �� ��Ϲ�ȣ - (�������� ������ ��ϼ�-1)
		beginList = endList - (pageList-1);
		
		//������� ���� �������� ��������ȣ�� �ٸ��Ƿ� ���� ����������� �˾ƾ� �Ѵ�.
		//����ȣ = ��������ȣ / ���� ������ ��������, ������ ������+1
		curBlock = curPage / blockPage;
		if( curPage % blockPage >0 ) ++curBlock;
		
		//����ȣ�� ���� �������� ��������ȣ�� �ٸ��Ƿ�
		//�� ��������ȣ : ��Ϲ�ȣ * ��ϴ� ������ ��������
		endPage = curBlock * blockPage;
		//���� ��������ȣ : �� ��������ȣ - (���� ������ ��������-1)
		beginPage = endPage - (blockPage-1);
		//������ ������ �� ��������ȣ�� �� ������������ Ŭ �� �����Ƿ�
		//�� ���������� �� ��������ȣ�� �Ѵ�.
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
