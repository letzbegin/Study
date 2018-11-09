참고 주소 : https://blog.outsider.ne.kr/903

## 핸들러란?
+ dispather 에서 요청할때 특정 url과 controller를 연결해 주는 라이브러리

### 주요 속성
이름 | 내용
---| ---
interceptors |사용할 인터셉터의 목록 baen을 통해 class 등록이 가능하다.
defaultHandler | 매칭되는 핸들러를 찾지 못했을 때 사용할 기본 핸들러.
order | 스프링은 order 프로퍼티 값에 기반해서 컨텍스트에서 사용할 수 있는 모든 핸들러 매핑을 정렬하고 가장 먼저 일치하는 핸들러를 적용한다.
alwaysUseFullPath | 이 값이 true이면 스프링은 적절한 핸들러를 찾을 때 현재 서블릿 컨텍스트 내에서 전체 경로를 사용한다. false(기본값)이면 현재 서블릿 매핑내에서 경로를 사용한다. 예를 들어 서블릿이 /testing/*로 매핑되어 있고 alwaysUseFullPath 프로퍼티가 true이면 /testing/viewPage.html를 사용하고 이 프로퍼티가 false이면 /viewPage.html를 사용한다.
urlDecode | 스프링 2.5부터 기본값은 true이다. 인코딩된 경로를 비교하는 것을 좋아한다면 이 플래그를 false로 설정해라. 하지만 HttpServletRequest는 항상 디코딩된 형식으로 서블릿 경로를 노출한다. 인코딩된 경로와 비교할 때는 서블릿 경로가 매치되지 않는 다는 것을 알아두어라.
