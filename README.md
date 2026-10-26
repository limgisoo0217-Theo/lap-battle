# 스피드 랩 레전드

10초 동안 랩 버튼을 더 많이 누르는 대결 스톱워치 게임. 티어와 레벨이 있고, 지금은 서버 없이 AI와 대결해요.

## 구조
- `www/` — 게임 본체 (오프라인 동작, 홈 화면 앱/PWA 지원)
- `www/local.html` — 근처 대결 버전. 서버 없이 같은 와이파이의 두 기기가 코드를 주고받아 직접 연결해요 (웹 주소 뒤에 `/local.html`)
- `.github/workflows/pages.yml` — `main` 푸시 시 웹 버전 자동 배포 (GitHub Pages)
- `.github/workflows/android-apk.yml` — `main` 푸시 시 안드로이드 APK 자동 빌드 → Releases(`apk-latest`)
- `capacitor.config.json`, `package.json`, `setup.sh` — iOS 앱(Capacitor) 설정
- `앱스토어_제출_가이드.md` — Mac에서 빌드해 앱스토어에 제출하는 순서
