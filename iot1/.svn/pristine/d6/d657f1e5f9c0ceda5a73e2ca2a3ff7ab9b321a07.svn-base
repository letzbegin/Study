package customer.vo;

public class CustomerVO {
//	id     number(8) constraint customer_id_pk primary key,
//	name   varchar2(30) not null, /*성명*/
//	gender varchar2(3) default '남' not null,  /*성별 */
//	email  varchar2(50), /*이메일 */
//	phone  varchar2(13)  /*연락처*/
	private int id, no;
	private String name, gender, email, phone[], phones;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	//	phones: phone 배열변수의 데이터를 - 로 엮어 하나의 문자열로 관리
	public String getPhones() {
		return phones;
	}
	public void setPhones(String phones) {
		this.phones = phones;
		phone = phones.split("-");
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String[] getPhone() {
		return phone;
	}
	public void setPhone(String[] phone) {
		this.phone = phone;
		phones = String.join("-", phone); //010-1234-5678
	}
	
}
