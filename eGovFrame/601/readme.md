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


