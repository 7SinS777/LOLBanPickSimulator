# 롤 밴픽 시뮬레이터
**※ eclipse 개발 툴을 사용하며 작성하였으며, java는 JDK 15.0.2버전으로, springframework는 4.3.22릴리스 버전으로 작성하였습니다.**
**※ 2022.09.22부터 시작한 프로젝트이며, 현재도 진행중입니다.**

* 개요 : 현재 e스포츠 대회 종목인 리그오브레전드 게임에서 사용하는 토너먼트 드래프트 방식의 밴픽페이지를 제작함.
* 목적 : 통계적으로 알기 어려운 정보들을 밴픽과 전략을 통해 데이터를 산출하기 위한 페이지임.
* 사용 기술
  * java
  * html, css, javascript
  * jsp
  * bootstrap4
  * jquery
  * Oracle sql
  * springframework
  * mybatis
  * jstl
  * EL
* 기능
  * 팀 정보 - 선수 변경, 삭제
    * 지금까지 등록되어있는 팀과 소속된 선수들의 명단을 확인할 수 있음.
    * 등록된 선수들의 소속팀, 포지션, 닉네임을 변경할 수 있고, 삭제할 수 있음.
    * 등록된 팀에 소속된 선수가 없을 경우 소속팀을 삭제할 수 있음.(업데이트 예정)
    * 팀명을 클릭할 경우 팀 통계를 선수명을 클릭할 경우 선수 통계로 이동시킴.(업데이트 예정)
  * 팀 등록
    * 팀명과 팀이니셜을 등록할 수 있음.
    * 팀명과 팀이니셜은 중복해서 할 수 없도록 함.
    * 팀명은 2에서 20자로 팀이니셜은 영타로 2에서 3자 내외로 함.(업데이트 예정)
  * 선수 등록
    * 선수의 포지션, 소속팀, 선수명을 등록할 수 있음.
    * 선수명은 중복할 수 없도록 함.
    * 최대 10명의 선수를 등록할 수 있음.
  * 팀 선택 - 밴픽 진행
    * 밴픽을 진행할 두 팀을 선택함.
    * 팀의 포지션에 선수가 공백일 경우 선택할 수 없도록 함.(업데이트 예정)
    * 소속된 포지션에 선수가 다수일 경우 1명을 선택할 수 있음.
    * 패치버전을 작성함.
    * 타이머와 밴픽 화면을 통해 대회에서 보던 밴픽페이즈를 실감나게 함.
    * 챔피언 선택은 수동으로 함.
    * 밴픽이 완료된 후 승패를 가르면 경기가 등록됨.
  * 경기기록
    * 실제로 등록된 경기의 팀들과 밴픽 단계를 보여줌.
    * 팀명을 누르면 팀 통계로, 챔피언 이미지를 누르면 챔피언 통계로 이동함.
    * 팀명을 검색하거나 패치버전을 검색해서 경기기록을 확인할 수 있음.
  * 통계
    * 팀 통계, 선수 통계, 챔피언 통계로 나눠짐.(업데이트 예정)
* 특징
  * MVC패턴의 구조를 지님
  * 실제로 리그오브레전드에서 사용하는 통계들을 접목시키고자 함
  * 리그오브레전드에서 랭킹을 매기는 방식인 솔로 랭크 시스템보단 프로 대회에 초점을 맞춘 방식임(대회와 솔로랭크의 해석이 다르기 때문)
* 비고
  * 프로젝트 인원 : 1명
  * 역할 : 내용 기획 및 기능 구현
  * 다음 업데이트 예정 시간 : 미정
  * 주의사항
    * DB는 Dto 폴더에 있는 Dto 클래스들의 명칭을 카피해야함.
    * sql 계정이름은 lol, 비밀번호는 lol0922로 맞춰야 함.
    * 전체적인 디자인은 범주에 두지 않았으므로 단조로워 보일 수 있음.

### 기타사항
질문, 피드백 언제나 환영합니다.
* 연락처 010-9430-4914
* 이메일 ghkdwns9979@naver.com
