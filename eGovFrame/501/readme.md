## AOP
+ __기본 개념__
  + OOP를 보완하는 개념으로 관심사에 따라 분리하여 처리하는 방식
  
+ __주요 개념__
>  + join Point
>    + 모듈안에 실행 가능한 어떤 특정 위치
>    + (예 : 메소드 호출, 메소드 실행, 클래스 초기화, 객체생성 등등)
>  + pointcut
>    + 어떤 클래스에 joinPoint를 사용할 것인지 결정하는 기능
>    + (예 : 특정 클래스의 모든 메소드 호출)
>  + advice
>    + Aspect의 구현체로 joinpoint에 삽입되어 동작할수 있는 코드
>    + 동작 시점에 따라 before, after, around 타입으로 구분
>       + before advice : joinpoint 전에 수행
>       + after returning advice: joinpoint가 성공적으로 리턴후 수행
>       + after throwing advice : 예외가 발생하여 joinpoint를 빠져나갈때 수행
>       + after (finally) advice: joinpoint 를 빠져나가는 방법에 상관없이 수행
>       + around advice : joinpoint 전,후 에 수행되는 advice
>    + __joinpoint에서 실행되는 코드__
>  + aspect
>    + advice와 Pointcut의 조합
>    + 어플리 케이션이 가지고 있어야 할 로직과 실행 지점을 정의
>  + Weaving
>    + pointcut에 의해서 결정된 joinpoint에 지정된 advice를 삽입하는 
>    + 기존 코드에 영향을 주지 않으면서, 특정 코드를 삽입하게 해주는 핵심 처리과정
> +진행단계 pointcut > joinpoint > advice > weaving
    
  + Weaving 방식
    + 컴파일시 : _별도의 컴파일러_ 를 이용 Aspect가 적용된 __바이너리를 만드는 방식__
    + 클래스 로딩 시 : 별도의 Agent를 이용 JVM이 클래스를 _로딩_ 할때 __바이너리 정보를 변경__
    + 런타임 시 : __프록시__ 를 이용하여 AOP를 지원하는 방식(스프링에서 쓰는 방식)
    
##Spring AOP
+ 방식
  + @AspectJ annotaion 이용
  + XML Schema를 이용(실습예제) - AOP선언을 한눈에 알수 있다
  + 스프링 API를 이용
  
+ pointcut 정의 예제

Pointcut | 선택된 Joinpoints 
---|---
execution(public * *(..)) | public 메소드 실행 
execution(* set*(..)) | 이름이 set으로 시작하는 모든 메소드명 실행 
execution(* com.xyz.service.AccountService.*(..)) | AccountService 인터페이스의 모든 메소드 실행 
execution(* com.xyz.service.*.*(..)) | service 패키지의 모든 메소드 실행 
execution(* com.xyz.service..*.*(..)) | service 패키지와 하위 패키지의 모든 메소드 실행 
within(com.xyz.service.*) | service 패키지 내의 모든 결합점 
within(com.xyz.service..*) | service 패키지 및 하위 패키지의 모든 결합점 
this(com.xyz.service.AccountService) | AccountService 인터페이스를 구현하는 프록시 개체의 모든 결합점 
target(com.xyz.service.AccountService) | AccountService 인터페이스를 구현하는 대상 객체의 모든 결합점 
args(java.io.Serializable) | 하나의 파라미터를 갖고 전달된 인자가 Serializable인 모든 결합점
@target(org.springframework.transaction.annotation.Transactional) | 대상 객체가 @Transactional 어노테이션을 갖는 모든 결합점 
@within(org.springframework.transaction.annotation.Transactional) | 대상 객체의 선언 타입이 @Transactional 어노테이션을 갖는 모든 결합점
@annotation(org.springframework.transaction.annotation.Transaction al) | 실행 메소드가 @Transactional 어노테이션을 갖는 모든 결합점
@args(com.xyz.security.Classified) | 단일 파라미터를 받고, 전달된 인자 타입이 @Classified 어노테이션을 갖는 모든 결합점 
bean(accountRepository) | “accountRepository” 빈 
!bean(accountRepository) | “accountRepository” 빈을 제외한 모든 빈 
bean(*) | 모든 빈 
bean(account*) | 이름이 'account'로 시작되는 모든 빈 
bean(*Repository) | 이름이 “Repository”로 끝나는 모든 빈 
bean(accounting/*) | 이름이 “accounting/“로 시작하는 모든 빈 
bean(*dataSource) \|\| bean(*DataSource) | 이름이 “dataSource” 나 “DataSource” 으로 끝나는 모든 빈

    
