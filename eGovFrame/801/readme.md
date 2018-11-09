## 화면레이어

![]()

# WorkFlow

+ Client의 요청이 들어오면 __DispatchServlet__이 가장 먼저 요청을 받는다.
+ __HandlerMapping__이 요청에 해당하는 __Controller__를 return한다.
+ __Controller__는 비지니스 로직을 수행(호출)하고 결과 데이터를 __ModelAndView__에 반영하여 return한다.
+ __ViewResolver__는 view name을 받아 해당하는 __View__ 객체를 return한다.
+ __View__는 __Model__ 객체를 받아 rendering한다



### Spring MVC 핵심 component
+ dispatcherServlet
  + Front Controller, 웹요청과 응답의 생명주기를 관리
+ HandlerMapping
  + 웹 요청시 해당 URL을 어떤 Controller가 처리 할지를 결정
+ Controller
  + 비지니스 로직을 ModelandView에 반영
+ ModleandView
  + Controller가 수행 결과를 방영하는 Model 데이터 객체와 이동할 페이지 정보(또는 View 객체)로 이루어짐
+ ViewResolver
  + 어떤 View를 선택할지 결정
+ View

### DispatcherServlet, ApplicationContext, WebApplicationContext
+ 권장 사항이며, 거의 대분분이 아래와 같은 방식으로 설정파일을 나누어 진행한다

+ WebApplicationContext : client가 보는 화면을 구성하는 설정을 관리하는 파일 (DispatcherServlet에 의해 생성)
+ ApplicationContext : 나머지 service, DAO등을 관리하는 설정 파일 (ContextLoaderListener에 의해 생성)

# 작업 순서
