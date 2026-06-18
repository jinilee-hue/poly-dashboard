# Poly AI Agent — 프로젝트 컨텍스트

## 프로젝트 개요
- **제품**: Poly AI Agent (경영 분석 AI 플랫폼) 프로토타입
- **경로**: `D:\이진희\#WORK\#AI\Claude\dashboard\poly-agent\`
- **빌드**: 없음 — Vanilla JS + HTML, 브라우저에서 직접 열어 확인
- **GitHub Pages**: https://jinilee-hue.github.io/poly-ai-agent/
- **GitHub 소스**: https://github.com/jinilee-hue/poly-ai-agent (repo: `poly-ai-agent-repo`)

## 파일 구조
```
poly-agent/
├── home.html           홈
├── reports.html        리포트 목록 (3D 카드 플립)
├── report-view.html    리포트 상세 (차트 + AI 채팅)
├── projects.html       프로젝트 목록
├── project-detail.html 프로젝트 상세
├── chat.html           채팅 상세
├── chat-list.html      채팅 목록
└── images/             리포트 썸네일 (1.png ~ 5.png)
```

## 스타일 시스템
- `../styles/tokens.css` — CSS 변수 (색상·간격·타이포)
- `../styles/common.css` — 공통 컴포넌트 스타일
- 각 HTML 파일 내 `<style>` 블록 — 페이지 전용 스타일
- GitHub Pages 레포(`poly-ai-agent-repo`)로 복사 시 경로를 `../styles/` → `styles/`로 변경

## 브랜드 컬러 시스템
| 브랜드 | Primary | 토큰 키 |
|--------|---------|---------|
| POLY | `#0066FF` | `--color-primary` |
| CANB | `#BC216D` | `--color-primary` |

- 브랜드 전환 시 `BRAND_TOKENS` JS 객체로 CSS 변수 오버라이드
- 다크 모드에서는 `BRAND_DARK_OVERRIDES`로 `--color-primary-light` 추가 오버라이드 필수
- 모든 색상은 하드코딩 금지 → 반드시 `var(--color-primary)`, `var(--color-primary-a30)` 등 CSS 변수 사용

## 핵심 CSS 토큰 (alpha)
```
--color-primary-a08  ~ a10 / a15 / a25 / a30 / a50
--chart-1 ~ chart-6  (브랜드 전환 시 자동 변경)
--color-sidebar-section  (라이트: #9CA3AF / 다크: rgba(255,255,255,0.32))
```

## 주요 컴포넌트 패턴
- `.poly-nav-label` — 사이드바 섹션 헤더 (모든 7개 파일에 정의 필요, font-size: var(--text-xs), color: var(--color-sidebar-section))
- `.icon-btn` — 36×36px 아이콘 버튼 (common.css 정의)
- `.rc-preview img` — 리포트 카드 썸네일 (object-fit: cover, object-position: top)
- `.chat-fab` — 채팅 FAB 버튼 (box-shadow에 반드시 CSS 변수 사용)
- `.proj-card-icon` — 프로젝트 아이콘 (background/color 모두 primary 토큰 사용)

## GitHub 배포 절차
로컬 수정 후 레포에 반영할 때:
```powershell
$content = Get-Content ".\파일.html" -Raw -Encoding UTF8
$content = $content -replace '\.\./styles/', 'styles/'
$content = $content -replace '\.\./js/', 'js/'
$content | Set-Content "D:\이진희\#WORK\#AI\Claude\poly-ai-agent-repo\파일.html" -Encoding UTF8 -NoNewline
```

## 주의 사항
- `common.css`의 `.poly-sidebar-brand`에 다크 모드 흰색 필터 적용됨 (`filter: brightness(0) invert(1)`)
- 차트 색상은 `buildCharts()` + `getComputedStyle`로 CSS 변수 읽어 동적 반영 필수 (하드코딩 금지)
- 인쇄 시 `@page { size: A4 portrait }` + `zoom: 0.72` + `.view-shell { margin-left: 0 }` 필수
- `theme-toggle-2` ID는 서브 페이지 topbar 토글 버튼 (home은 `theme-toggle`)
