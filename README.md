### Soma WeatherApp

<p align="center"><img width="600" src="https://velog.velcdn.com/images/heyksw/post/75cd43ed-d96f-4aa7-bc12-a9932bb7fddf/image.png"></p>

- SW 마에스트로 13기에서, Best Practice 용도로 만든 날씨 앱

- 모듈화, 클린 아키텍처

- Tuist 도입 : Swift 로 프로젝트 생성 및 모듈 의존 관계 설정 용이. Tuist graph 지원

***

### 프로젝트 빌드 방법

1. tuist 설치   
**curl -Ls https://install.tuist.io | bash**

2. git clone

3. 클론 받은 프로젝트에서 터미널에 **tuist fetch** 를 실행 (SPM 등 의존성 설치)

4. tuist fetch 가 끝나면 **tuist generate** 를 실행

5. 프로젝트 활성화 완료

***

### Tuist Graph - 모듈 구조

<p align="center"><img width="500" src="https://velog.velcdn.com/images/heyksw/post/1c4ab565-354c-424c-b648-9d73bf9542ed/image.png"></p>

- **SomaWeather (앱 모듈)**
  - DI 주입, Coordinator 패턴 구현 - 피쳐 모듈간 의존성 없이 화면 전환
  - AppCoordinator, TabBarCoordinator
- **Domain (도메인 모듈)** 
  - VO, UseCase, RepositoryProtocol 등
  - UseCase 에서 DTO 를 VO 로 변환
- **Entity (엔티티 모듈)**
  - DTO
- **Data (데이터 모듈)** 
  - RepositoryImpl, Network 등
- **Home (홈 모듈)**
  - HomeView, HomeViewModel (현재 날씨)
  - 현재 날씨
- **Forecast (일기 예보 모듈)** 
  - ForecastView, ForecastViewModel (일주일간 일기 예보)
- **Search (도시 검색 모듈)** 
  - SearchView, SearchViewModel (도시 이름 검색 - 날씨 정보)
- **Common** 
  - 피쳐의 공통기능 (enum, extension 등)
- **CommonUI**
  - 피쳐에서 공통적으로 사용할 UI (Custom View, Table View 등)

***

### 아키텍처

![](https://velog.velcdn.com/images/heyksw/post/bed105b5-3c14-4c5b-a432-dc312430fc4c/image.png)



> **모듈화**

- 비슷한 책임을 갖는 코드끼리 묶어 모듈로 나누었습니다.
- 모듈화를 해서 모듈끼리의 의존 관계를 설정하고, 코드의 결합도를 낮추고, 응집도를 높입니다. 이로 인해 프로젝트의 유지 보수성이 좋아집니다.
- 모듈 별로 책임이 다르기 때문에 다른 사람이 봤을 때 이런 코드가 이런 모듈 안에 들어갈 것 같다고 예측을 할 수 있습니다. 코드 가독성과 개발 효율이 높아집니다.
- 의존성 없이 잘 만들어 놓은 모듈은 다른 프로젝트에서도 재활용할 수 있습니다.

> **클린 아키텍처**

- Data Layer : 백엔드 or 로컬 데이터로부터 데이터를 가져오는 책임을 갖습니다. Repository 를 갖습니다.
- Domain Layer : 앱의 비즈니스 로직을 담당합니다. UseCase, VO (Value Object), Repository Protocol 을 갖습니다.
- Presentaion Layer : UI 로직 관련 책임을 갖습니다. MVVM 패턴을 활용했습니다.

> **코디네이터 패턴 (Coordinator)**

- 화면 전환을 담당하는 객체입니다.
- 화면간 의존성을 줄이고 화면 이동을 할 수 있게 돕습니다.
- 코디네이터는 자식 코디네이터를 가질 수 있습니다. 예를 들어 이 프로젝트에서는 TabBarCoordinator 는 자식으로 HomeCoordinator, ForecastCoordinator, SearchCoordinator 를 갖습니다. 
- 서로 다른 피쳐 모듈간 화면 이동이 필요하게 되었을 때, 코디네이터를 활용하면 모듈간 의존성 없이 화면 이동이 가능합니다.

***

### 사용 라이브러리

- **Swinject** : DI
- **SnapKit** : Layout 
- **RxSwift / RxDataSources / RxCocoa** : 비동기 처리
- **Moya / RxMoya** : Network
- **Kingfisher** : 이미지 처리

