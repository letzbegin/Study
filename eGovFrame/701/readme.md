## 배치란??
+ 대용량 데이터 처리를 위한 환경
+ 일반적으로 많은 데이터를 한번에 처리하려고 하면 과부하가 걸릴수 있다. 때문에 1) 사용자가 직접 2)스케쥴에 맞춰 3) 백그라운드(후면) 실행을
통하여 부하를 줄여 처리하는 방식을 말한다.

## Spring Batch
+ 가볍고 이해하기 쉽게 디자인된 엔터프라이즈급 시스템을 지원하는 배치 프로그램
+ Batch Monitoring 지원
+ Commit interval 지원
+ Retry, restart, skip 지원
+ commit/ rollback/ retry count 정보 제공
+ Qurtz, command line, web 등을 통한 실핼 지원


구분 | 설명
---|---
JobLauncher | JobLauncher는 Batch Job을실행시키는역할수행. Job과Parameter를 받아서실행하며JobExecution를 반환. 
JobRepository | 수행되는Job에대한정보를담고있는저장소. Job이수행, 종료, 실행횟수및결과등, Batch수행과 관련된모 든Meta Data가 저장되어있음
Job | 실행시킬작업. 논리적인Job실행의개념. 
JobParameter Batch | Job을실행하는데사용하는파라미터의집합으로Job이실행되는동안에Job을식별하거나Job에서참조 하는데이터로사용 
JobInstance | 논리적인Job 실행(JobInstance=Job+JobParameter) 
Step | Batch Job을구성하는독립적인하나의단계.Job은1개이상의Step으로 구성 실제Batch 처리과정을정의하고, 제어하는데필요한모든정를포함 Step의내용은전적으로개발자의선택에따라구성됨.
Item | 처리할데이터의가장작은구성요소. (예)파일의한줄, DB의한Row, Xml의 특정Element 
ItemReader | Step안에서File 또는DB등에서Item을 읽어들임. 더이상읽어올Item이 없을때에는read() 메소드에서null값을 반환하며그전까지는순차적인값을리턴. 
ItemWriter | Step안에서File 또는DB등으로Item을 저장.
Item Processor | Item reader에서 읽어들인Item에 대하여필요한로직처리작업을수행.
