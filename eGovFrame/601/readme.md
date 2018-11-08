## 목차
+ DataSource
+ Data Access
+ ORM
+ Transaction

### DataSource
+DB와 연결하는 연결객체를 획득하는 단계
  +획득방법
    + Spring DataSource
    + DBCP DataSource
    + C3PO DataSource(DBCP와 유사)
    + JNDI DataSource
    
__기본코드__

 DataSource 설정
---
```java
<bean id= " dataSource " class = " org.springframework.jdbc.datasource.DriverManagerDataSource " > 
<property name= " driverClassName " value = "${driver}" /> 
<property name= " url " value = "${ dburl }" /> 
<property name= " username " value = "${username}" /> 
<property name= " password " value = "${password}" />
</bean>
``` 

테스트코드
---
```java
@Resource(name = "dataSource") DataSource dataSource; 
@Test public void testJdbcDataSource() throws Exception { 
assertNotNull(dataSource); 
assertEquals("org.springframework.jdbc.datasource.DriverManagerDataSource", dataSource.getClass().getName());
Connection con = null;     Statement stmt = null;     ResultSet rs = null; 
try { 
con = dataSource.getConnection();   
assertNotNull(con); 
stmt = con.createStatement(); 
rs = stmt.executeQuery("select 'x' as x from dual"); 
while (rs.next()) { assertEquals("x", rs.getString(1));  ……. } }
```

__DBCP코드__

 DataSource 설정
 ---
 ```java
 <bean id= " dataSource " class= " org.apache.commons.dbcp. BasicDataSource “ destroy-method= "close“ > 
 <property name= " driverClassName " value = "${driver}" /> //클래스 name
 <property name= " url " value = "${ dburl }" />             //url
 <property name= " username " value = "${username}" />       //name
 <property name= " password " value = "${password}" />       //pw
 <property name= " defaultAutoCommit " value = "false" />    //리턴된 connection에 대해 auto-commit 여부
 <property name= " poolPreparedStatements " value = "true" /> // PreparedStaement 사용여부
 </bean> 
```
테스트 코드
---
```java
@Resource(name = "dataSource") 
DataSource dataSource;
@Test public void testDbcpDataSource() throws Exception {
assertNotNull(dataSource);
assertEquals("org.apache.commons.dbcp.BasicDataSource", dataSource.getClass().getName());
Connection con = null;      Statement stmt = null;      ResultSet rs = null; 
try {
con = dataSource.getConnection(); 
assertNotNull(con); 
stmt = con.createStatement();
rs = stmt.executeQuery("select 'x' as x from dual");
while (rs.next()) { assertEquals("x", rs.getString(1));
}
}
}
```

### Data Access
+ ibatis
+ mybatis

__ibatis__

구성요소|설명
---|---
SqlMapConfig XML File File |  iBatis 동작을 위한 DataSource, Data Mppaer 및 Thread
SqlMap XML File | XML 방식으로 실행할 SQL문과 매핑 정보를 설정
SQL Map |  iBatis는 PreparedStatement 인스턴스를 생성하고, 제공된 파라미터 객체를 사용해서 파라미터를 셋팅한 후, Statement를 실행하고 결과 객체를 생성
Mapped Statement |  Parameter 객체와 Result 객체를 이용하여 SQL Statement로 치환 
Parameter Object |  파마리터 객체는 JavaBean, Map, Primitive 객체로서, 입력값을 셋팅하기 위해 사용되는 객체
Result Object | 결과 객체는 JavaBean, Map, Primitive 객체로서, 쿼리문의 결과값을 담는 객체

개발순서

1. [iBatis 설정 1] SQL Mapping XML 파일 작성
  + __실행할 SQL문과 관련 정보 설정__
  + SELECT/INSERT/UPDATE/DELETE, Parameter/Result Object, Dynamic SQL 등
2. [iBatis 설정 2] iBatis Configuration XML 파일 작성
  + iBatis 동작에 필요한 옵션을 설정
  + <sqlMap>: SQL Mapping XML 파일의 위치
3. [스프링연동 설정] SqlMapClientFactoryBean 정의
  + Spring와 iBatis 연동을 위한 설정
  + 역할) iBatis 관련 메서드 실행을 위한 SqlMapClient 객체를 생성
  + dataSource: DB Connection 생성
  + configLocation: iBatis Configuration XML 파일의 위치
  + mappingLocations: 모든 SQL Mapping XML 파일을 일괄 지정 가능
4. DAO 클래스 작성
  + 실행할 SQL문을 호출하기 위한 메서드 구현: SQL Mapping XML 내에 정의한 각 Statement id를 매개변수로 전달
  + 규칙) SqlMapClientDaoSupport를 상속하는 EgovAbstractDAO 클래스를 상속받아 확장/구현


