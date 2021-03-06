# 윈도우 자동종료 타이머
### Why?  
친구 도와주려고 쉘스크립트로 제작해본 컴퓨터 자동종료 타이머입니다.  


### 작동 방식  
1. `.ps1` 확장자 우클릭-파워쉘에서 실행  
![image](https://upload3.inven.co.kr/upload/2022/05/21/bbs/i013866788288.gif) 

2. `.bat` 확장자 더블클릭이 있습니다.  
![image](https://upload3.inven.co.kr/upload/2022/05/21/bbs/i014030701028.gif)  
둘 다 같은 스크립트 돌리는데 장단점이 있습니다.



### 사용법
1. powershell.bat(배치파일)과 shutdownCounter.ps1(스크립트파일)을 같은 폴더에 둔다.  
2. **배치파일 더블클릭** 또는 **스크립트파일 우클릭-파워쉘에서 실행 클릭**
3. 원하는 종료시간을 입력한다.  
    > 입력포맷 -> 20220520 2359  


### **주의사항** 
1. 경로명에 한글이 있으면 정상적으로 작동하지 않으니 가급적이면 바탕화면에 생성하기  
2. 현재보다 앞선 시점 입력할 경우 바로 종료  
    > 현재 새로운 값을 입력받도록 작업중이지만 앞으로도 적용된다 보장할 수 없음
3. 시간 입력하고 엔터누르기 전에 작업중인 프로그램들은 전부 저장하고 실행  
    > 몇초 남기고 저장한다고 생각하다가 파일 날려먹고 울어도 책임 못짐

### 만드는 방법
1. 파일확장명 보이게 설정해주세요 (모르면 구글 검색)
2. 바탕화면에 `영문`이름 폴더 생성하고 내부에 텍스트파일 2개 생성  
실행파일과 스크립트파일 입니다.  
이름은 적당히 지어주시고 실행파일 확장자는 .bat로 스크립트 파일은 .ps1로 바꿔줍니다.
3. 각 파일에 코드 복붙해서 넣어주세요  
**스크립트파일 이름이 shutdownCounter.ps1이 아닌경우 배치파일 내부에 %cd%\shutdownCounter.ps1 -> %cd%\내가만든파일명.ps1로 변경**

### JobSori
shutdown -s -t 방식 사용하셔도 상관 없습니다.  
이걸 왜 써야하는지 이해가 안간다면 무조건 님말이 맞음. 필요한 사람만 쓰면 됩니다.  

shutdown 명령어랑 차이점  
1. shutdown은 남은 시간을 n초로 입력하고 이 방식은 컴퓨터 종료 시간을 입력합니다.
2. 취소할 때 shutdown -a 대신 동작중인 화면에서 컨트롤 + C를 눌러줍니다.  
동작중 우측 상단의 닫기 버튼 눌러도 취소됩니다.

하다보니 재밌어서 추후 GUI로 개선해볼 생각.

