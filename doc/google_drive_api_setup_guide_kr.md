# ☁️ Google Drive API 연동 키 (client_secrets.json) 발급 가이드

Joy Markdown Studio의 구글 드라이브 동기화 기능을 자신만의 구글 클라우드 개발자 계정 프로젝트 키로 사용하고 싶다면, Google Cloud Console에서 클라이언트 보안 비밀번호 인증키를 생성하여 다운로드해야 합니다. 

아래 단계를 따라 하시면 누구나 쉽고 안전하게 `client_secrets.json` 파일을 발급받아 등록할 수 있습니다.

---

## 🛠️ [1단계] Google Cloud 프로젝트 생성

1. **Google Cloud Console** 웹사이트([console.cloud.google.com](https://console.cloud.google.com))에 접속하여 구글 계정으로 로그인합니다.
2. 화면 상단 좌측의 **프로젝트 선택 드롭다운**을 클릭한 뒤, 우측 상단의 **"새 프로젝트 (New Project)"** 버튼을 누릅니다.
3. 프로젝트 이름(예: `JoyMarkdownStudio`)을 입력하고 **"만들기 (Create)"** 버튼을 클릭합니다.
4. 생성이 완료되면 알림창에서 프로젝트 선택을 눌러 생성한 프로젝트 환경으로 진입합니다.

---

## 🔑 [2단계] Google Drive API 사용 설정

1. 콘솔 왼쪽 상단의 **탐색 메뉴(줄 3개 버튼)**를 클릭하고 **"API 및 서비스 (APIs & Services) > 라이브러리 (Library)"**로 이동합니다.
2. 검색창에 **"Google Drive API"**를 입력하고 검색합니다.
3. 검색 결과에서 **"Google Drive API"**를 클릭한 후, 파란색 **"사용 설정 (Enable)"** 버튼을 누릅니다.

---

## 🎨 [3단계] OAuth 동의 화면 (Consent Screen) 구성

OAuth 인증 프로세스를 거칠 때 사용자에게 보여줄 안내 화면을 설정하는 단계입니다.

1. 왼쪽 메뉴에서 **"OAuth 동의 화면 (OAuth consent screen)"** 탭을 클릭합니다.
2. User Type에서 **"외부 (External)"**를 선택하고 **"만들기 (Create)"** 버튼을 누릅니다.
3. **앱 정보**를 입력합니다:
   * **앱 이름 (App name)**: `Joy Markdown Studio` (또는 원하는 이름)
   * **사용자 지원 이메일 (User support email)**: 본인의 구글 이메일 주소 선택
   * **개발자 연락처 정보 (Developer contact information)**: 본인의 이메일 주소 입력
   * *다른 항목들은 빈칸으로 비워두고* 하단의 **"저장 후 계속 (Save and Continue)"**을 누릅니다.
4. **범위 (Scopes)** 단계:
   * **"범위 추가 또는 삭제"** 버튼을 누릅니다.
   * 필터 또는 목록에서 **`.../auth/drive.file`** 권한을 찾아 체크박스를 선택합니다. (이 권한은 앱이 직접 생성한 파일만 액세스하는 안전한 비민감 권한입니다.)
   * 맨 아래 **"업데이트"**를 누르고, 화면 하단 **"저장 후 계속"**을 클릭합니다.
5. **테스트 사용자 (Test users)** 단계 (중요):
   * **"Add Users (사용자 추가)"** 버튼을 누릅니다.
   * 동기화 연동에 실제 사용할 본인의 구글 계정(Gmail) 이메일 주소를 입력한 뒤 추가합니다.
   * **"저장 후 계속"**을 클릭합니다.
6. **요약 (Summary)** 단계에서 설정 내용을 확인하고 맨 아래 **"대시보드로 돌아가기"**를 클릭합니다.
7. **게시 상태 변경 (Production 상태)**:
   * OAuth 동의 화면 대시보드 중앙의 **Publishing status**에서 **"앱 게시 (Publish App)"** 버튼을 클릭하여 테스트 상태에서 프로덕션 상태로 전환합니다. (이렇게 해야 테스트 사용자 차단 문구 없이 원활히 로그인할 수 있습니다.)

---

## ⬇️ [4단계] 사용자 인증 정보 생성 및 JSON 다운로드

1. 왼쪽 메뉴에서 **"사용자 인증 정보 (Credentials)"** 탭을 클릭합니다.
2. 상단의 **"+ 사용자 인증 정보 만들기 (+ Create Credentials)"** 버튼을 누른 후 **"OAuth 클라이언트 ID (OAuth client ID)"**를 선택합니다.
3. 애플리케이션 유형(Application type) 드롭다운에서 **"데스크톱 앱 (Desktop app)"**을 선택합니다.
4. 이름(예: `JMStudio Desktop`)을 적고 하단의 **"만들기 (Create)"** 버튼을 누릅니다.
5. 생성 완료 팝업이 뜨면 확인을 누릅니다.
6. **OAuth 2.0 클라이언트 ID** 목록에 방금 만든 인증 키가 추가된 것을 볼 수 있습니다.
7. 해당 키 우측에 있는 **"JSON 다운로드 (⬇️ 모양 아이콘)"** 버튼을 클릭하여 파일을 다운로드합니다.
8. 다운로드된 파일의 이름(예: `client_secret_xxxx...xxxx.json`)을 **`client_secrets.json`**으로 변경합니다.

---

## 📂 [5단계] 앱에 등록하여 사용하기

다운로드하여 이름을 변경한 `client_secrets.json` 파일을 아래 방법 중 하나를 선택해 적용합니다.

* **방법 A (권장)**: 앱을 실행하고 클라우드 싱크 패널의 안내 모달창에서 **"인증키 파일 선택하기"** 버튼을 클릭하여 다운로드한 `client_secrets.json` 파일을 가져옵니다. (앱이 자동으로 파일을 복사해 등록합니다.)
* **방법 B**: 다운로드한 `client_secrets.json` 파일을 Joy Markdown Studio 실행 파일(`.exe`)과 **동일한 폴더 경로**에 직접 복사해서 배치합니다.

적용 완료 후 연동하기를 진행하면 새로운 구글 클라우드 프로젝트 환경과 정상적으로 연동이 작동하게 됩니다!
