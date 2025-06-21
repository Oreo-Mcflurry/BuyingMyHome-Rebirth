# BuyingMyHome

🏠 집 구매를 위한 iOS 앱

## 📱 프로젝트 소개

BuyingMyHome은 집 구매를 도와주는 iOS 앱입니다. Tuist를 이용한 Micro Features Architecture로 구성되어 있으며, RxSwift와 RxFlow를 사용하여 반응형 프로그래밍과 네비게이션을 구현했습니다.

## 🏗️ 아키텍처

### Micro Features Architecture

```
BuyingMyHome/
├── Projects/
│   ├── App/                    # 메인 앱
│   ├── ThirdParty/             # 외부 라이브러리 래퍼 (RxSwift, RxFlow 등)
│   ├── Domain/                 # 비즈니스 로직, UseCase, Repository 인터페이스
│   ├── Core/                   # 공통 유틸리티, 네트워킹, 로컬 스토리지
│   ├── DesignSystem/           # 공통 UI 컴포넌트, 디자인 시스템
│   ├── Navigation/             # RxFlow 기반 네비게이션 관리
│   └── Features/               # 각 기능별 모듈
│       ├── HomeFeature/        # 홈 화면
│       ├── SearchFeature/      # 검색 기능
│       ├── FavoriteFeature/    # 관심목록
│       └── ProfileFeature/     # 프로필
├── Tuist/
│   ├── ProjectDescriptionHelpers/  # 재사용 가능한 프로젝트 설정
│   └── Templates/              # Scaffold 템플릿
└── Workspace.swift             # 전체 워크스페이스 설정
```

### 의존성 그래프

```
App
├── ThirdParty (RxSwift, RxFlow, RxCocoa, RxRelay)
├── Domain
│   └── ThirdParty
├── Core
│   └── ThirdParty
├── DesignSystem
├── Navigation
│   ├── ThirdParty
│   └── Domain
└── Features
    ├── HomeFeature → ThirdParty, Domain, Core, DesignSystem, Navigation
    ├── SearchFeature → ThirdParty, Domain, Core, DesignSystem, Navigation
    ├── FavoriteFeature → ThirdParty, Domain, Core, DesignSystem, Navigation
    └── ProfileFeature → ThirdParty, Domain, Core, DesignSystem, Navigation
```

### 레이어 설명

- **ThirdParty**: 모든 외부 라이브러리를 래핑하여 중앙 관리
- **Domain**: 비즈니스 로직, UseCase, Repository 인터페이스 정의
- **Core**: 네트워킹, 로컬 스토리지, 공통 유틸리티
- **DesignSystem**: 공통 UI 컴포넌트, 색상, 폰트 등
- **Navigation**: RxFlow 기반 네비게이션 관리
- **Features**: 각 기능별 독립적인 모듈

## 🚀 시작하기

### 필요 요구사항

- Xcode 15.0+
- iOS 15.0+
- Tuist 4.49.1+

### 설치 및 실행

1. 리포지토리 클론
```bash
git clone https://github.com/yoo/BuyingMyHome.git
cd BuyingMyHome
```

2. 의존성 설치
```bash
tuist install
```

3. 프로젝트 생성
```bash
tuist generate
```

4. Xcode에서 BuyingMyHome.xcworkspace 열기

## 🛠️ 개발

### 새로운 Feature 추가

Tuist Scaffold 기능을 사용하여 새로운 Feature를 쉽게 추가할 수 있습니다:

```bash
tuist scaffold feature --name NewFeature
```

이 명령어는 다음을 자동으로 생성합니다:
- Project.swift
- ViewController + ViewModel
- 테스트 파일
- Demo 앱

### 프로젝트 구조 수정

프로젝트 구성을 수정하려면 `Tuist/ProjectDescriptionHelpers/` 디렉토리의 파일들을 편집하세요:

- `ModuleType.swift`: 모듈 타입 정의
- `Project+Templates.swift`: 프로젝트 템플릿
- `TargetDependency+Templates.swift`: 의존성 관리

### 빌드 및 테스트

```bash
# 전체 빌드
tuist build

# 특정 스킴 빌드
tuist build BuyingMyHome

# 테스트 실행
tuist test
```

## 📦 외부 라이브러리

모든 외부 라이브러리는 `ThirdParty` 모듈을 통해 관리됩니다:

- **RxSwift**: 반응형 프로그래밍
- **RxCocoa**: UIKit과 RxSwift 연동
- **RxRelay**: 안전한 Subject 래퍼
- **RxFlow**: 네비게이션 관리

새로운 의존성 추가는 `Tuist/Package.swift`에서 관리합니다.

## 🧭 네비게이션

RxFlow를 사용하여 Coordinator 패턴으로 네비게이션을 관리합니다:

- `Navigation` 모듈에서 모든 네비게이션 로직 관리
- Feature 간 의존성 없이 네비게이션 가능
- 중앙 집중식 네비게이션 관리

## 🔧 코드 스타일

프로젝트는 SwiftLint를 사용하여 일관된 코드 스타일을 유지합니다.

```bash
# SwiftLint 실행
swiftlint
```

## 🚀 CI/CD

GitHub Actions를 사용하여 자동화된 CI/CD 파이프라인을 구성했습니다:

- **CI**: Pull Request 및 Push 시 빌드 및 테스트 자동 실행
- **Release**: 태그 푸시 시 자동 릴리즈 빌드

## 📝 기여하기

1. 이 리포지토리를 Fork 합니다
2. 새로운 Feature 브랜치를 생성합니다 (`git checkout -b feature/AmazingFeature`)
3. 변경사항을 커밋합니다 (`git commit -m 'Add some AmazingFeature'`)
4. 브랜치에 푸시합니다 (`git push origin feature/AmazingFeature`)
5. Pull Request를 생성합니다

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

## 👥 개발자

- **Yoo** - *Initial work* - [yoo](https://github.com/yoo)

## 🙏 감사의 말

- [Tuist](https://tuist.io) - 모듈러 아키텍처 구성을 위한 도구
- [RxSwift](https://github.com/ReactiveX/RxSwift) - 반응형 프로그래밍 라이브러리
- [RxFlow](https://github.com/RxSwiftCommunity/RxFlow) - 네비게이션 관리 라이브러리 