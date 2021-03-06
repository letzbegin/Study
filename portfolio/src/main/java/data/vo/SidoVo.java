package data.vo;

public class SidoVo {
	private String[] Seoul ={
			"종로구",
			"중구",
			"용산구",
			"성동구",
			"광진구",
			"동대문구",
			"중랑구",
			"성북구",
			"강북구",
			"도봉구",
			"노원구",
			"은평구",
			"서대문구",
			"마포구",
			"양천구",
			"강서구",
			"구로구",
			"금천천",
			"영등포구",
			"동작구",
			"관악구",
			"서초구",
			"강남구",
			"송파구",
			"강동구"
	};
	
	private String[] Busan = {"중구","서구","동구","영도구","부산진구","동래구","남구","북구","강서구","해운대구","사하구","금정구","연제구","수영구","사상구"}; 
	private String[] Daegu={"중구","동구","서구","남구","북구","수성구","달서구","달성군"};
	private String[] Incheon={"중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군"};
	private String[] Gwangju={"동구","서구","남구","북구","광산구"};
	private String[] Daejeon={"동구","중구","서구","유성구","대덕구"};
	private String[] Ulsan={"중구","남구","동구","북구","울주군"};
	private String[] Sejong={"세종"};
	private String[] Gyeonggi={
			"수원시","장안구","권선구","팔달구","영통구","성남시","수정구","중원구","분당구","안양시",
			"만안구","동안구","안산시","상록구","단원구","용인시","처인구","기흥구","수지구","광명시","평택시","과천시","오산시","시흥시","군포시","의왕시","하남시","이천시","안성시","김포시","화성시","광주시","여주시","부천시",
			"양평군","고양시","덕양구","일산동구","일산서구","의정부시","동두천시","구리시","남양주시","파주시","양주시","포천시","연천군","가평군"};
	private String[] Gangwon={"춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시","홍천군","횡성군","영월군","평창군","정선군","철원군","화천군","양구군","인제군","고성군","양양군"};
	private String[] NorthChungcheong ={"청주시","상당구","서원구","흥덕구","청원구","충주시","제천시","보은군","옥천군","영동군","진천군","괴산군","음성군","단양군","증평군"};
	private String[] SouthChungcheong={"천안시","동남구","서북구","공주시","보령시","아산시","서산시","논산시","계룡시",
			"당진시","금산군","부여군","서천군","청양군","홍성군","예산군","태안군"};
	private String[] NorthJeolla={"전주시","완산구","덕진구","군산시","익산시","정읍시","남원시","김제시",
			"완주군","진안군","무주군","장수군","임실군","순창군","고창군","부안군"};
	private String[] SouthJeolla={"목포시","여수시","순천시","나주시","광양시","담양군","곡성군","구례군","고흥군","보성군","화순군","장흥군","강진군","해남군","영암군","무안군","함평군","영광군","장성군","완도군","진도군","신안군"};
	private String[] NorthGyeongsang={"포항시","남구","북구","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시","군위군","의성군","청송군","영양군","영덕군","청도군","고령군","성주군","칠곡군","예천군","봉화군","울진군","울릉군"};
	private String[] SouthGyeongsang={"의령군","함안군","창녕군","고성군","남해군","하동군","산청군","함양군","거창군","합천군","진주시","통영시","사천시","김해시","밀양시","거제시","양산시","의창구","성산구","마산합포구","마산회원구","진해구","창원시"};
	private String[] Jeju={"제주"};
	
	
	public String[] getSeoul() {
		return Seoul;
	}
	public void setSeoul(String[] seoul) {
		Seoul = seoul;
	}
	public String[] getBusan() {
		return Busan;
	}
	public void setBusan(String[] busan) {
		Busan = busan;
	}
	public String[] getNorthChungcheong() {
		return NorthChungcheong;
	}
	public void setNorthChungcheong(String[] northChungcheong) {
		NorthChungcheong = northChungcheong;
	}
	public String[] getIncheon() {
		return Incheon;
	}
	public void setIncheon(String[] incheon) {
		Incheon = incheon;
	}
	public String[] getGangwon() {
		return Gangwon;
	}
	public void setGangwon(String[] gangwon) {
		Gangwon = gangwon;
	}
	public String[] getGyeonggi() {
		return Gyeonggi;
	}
	public void setGyeonggi(String[] gyeonggi) {
		Gyeonggi = gyeonggi;
	}
	public String[] getNorthJeolla() {
		return NorthJeolla;
	}
	public void setNorthJeolla(String[] northJeolla) {
		NorthJeolla = northJeolla;
	}
	public String[] getGwangju() {
		return Gwangju;
	}
	public void setGwangju(String[] gwangju) {
		Gwangju = gwangju;
	}
	public String[] getSouthChungcheong() {
		return SouthChungcheong;
	}
	public void setSouthChungcheong(String[] southChungcheong) {
		SouthChungcheong = southChungcheong;
	}
	public String[] getDaejeon() {
		return Daejeon;
	}
	public void setDaejeon(String[] daejeon) {
		Daejeon = daejeon;
	}
	public String[] getDaegu() {
		return Daegu;
	}
	public void setDaegu(String[] daegu) {
		Daegu = daegu;
	}
	public String[] getSouthGyeongsang() {
		return SouthGyeongsang;
	}
	public void setSouthGyeongsang(String[] southGyeongsang) {
		SouthGyeongsang = southGyeongsang;
	}
	public String[] getSouthJeolla() {
		return SouthJeolla;
	}
	public void setSouthJeolla(String[] southJeolla) {
		SouthJeolla = southJeolla;
	}
	public String[] getUlsan() {
		return Ulsan;
	}
	public void setUlsan(String[] ulsan) {
		Ulsan = ulsan;
	}
	public String[] getNorthGyeongsang() {
		return NorthGyeongsang;
	}
	public void setNorthGyeongsang(String[] northGyeongsang) {
		NorthGyeongsang = northGyeongsang;
	}
	public String[] getJeju() {
		return Jeju;
	}
	public void setJeju(String[] jeju) {
		Jeju = jeju;
	}
	public String[] getSejong() {
		return Sejong;
	}
	public void setSejong(String[] sejong) {
		Sejong = sejong;
	}
	
	
	
	
	
	
	
	
	
	
}
