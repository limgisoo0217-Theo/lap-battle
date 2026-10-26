#!/usr/bin/env bash
# 스피드 랩 레전드 - iOS 프로젝트 자동 생성 (macOS + Node.js 18+ + Xcode 필요)
set -e

if [ "$(uname)" != "Darwin" ]; then
  echo "iOS 앱 빌드는 macOS(Xcode)에서만 가능합니다."; exit 1
fi

npm install
npx cap add ios
npm run assets          # resources/icon.png, splash.png -> iOS 아이콘/스플래시 자동 생성
npx cap sync ios

# 세로 모드 고정 (iPhone)
PLIST=ios/App/App/Info.plist
/usr/libexec/PlistBuddy -c "Delete :UISupportedInterfaceOrientations" "$PLIST" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :UISupportedInterfaceOrientations array" "$PLIST"
/usr/libexec/PlistBuddy -c "Add :UISupportedInterfaceOrientations:0 string UIInterfaceOrientationPortrait" "$PLIST"

echo ""
echo "완료! 이제 'npx cap open ios' 로 Xcode를 열고 가이드의 3단계를 진행하세요."
