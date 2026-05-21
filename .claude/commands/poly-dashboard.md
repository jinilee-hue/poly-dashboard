# Poly Dashboard — 프로젝트 컨텍스트

EduPoly 캠퍼스 관리 대시보드입니다. 작업 전 이 컨텍스트를 기준으로 삼으세요.

---

## 프로젝트 개요

- **제품명**: EduPoly 캠퍼스 관리 대시보드
- **경로**: `d:\이진희\#WORK\#AI\Claude\dashboard`
- **빌드**: 없음 — Vanilla JS + HTML, 브라우저에서 직접 열기
- **담당자**: 이진희 (관리자, jini.lee@edu-poly.com)

---

## 파일 구조

```
dashboard/
├── styles/
│   ├── tokens.css        CSS 변수 (색상·간격·타이포그래피)
│   └── common.css        레이아웃·전체 컴포넌트 스타일
├── js/
│   ├── utils.js          포맷 함수, fpLocale, getChartColors(), setChartDefaults
│   └── layout.js         사이드바 렌더링, 테마 토글, 브레드크럼, 커스텀 셀렉트, Flatpickr 커스텀 드롭다운
├── index.html            대시보드 홈
├── students.html         학생 관리
├── courses.html          수강 관리
├── attendance.html       출결 관리
├── grades.html           성적 관리
├── payments.html         수납 관리
├── teachers.html         강사 관리
├── notices.html          공지사항
├── counseling.html       상담 관리
├── settings.html         설정
├── modal-demo.html       컴포넌트 데모 (날짜 피커·모달·커스텀 셀렉트)
└── design system.md      디자인 시스템 문서 (컬러·타이포·컴포넌트 스펙)
```

---

## 기술 스택 & CDN 로드 순서

```html
<!-- CSS — common.css가 라이브러리보다 뒤에 오도록 -->
<link rel="stylesheet" href="styles/tokens.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.16.0/styles/overlayscrollbars.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="styles/common.css">

<!-- JS — utils.js → layout.js 순서 필수 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>  <!-- 차트 페이지만 -->
<script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.16.0/browser/overlayscrollbars.browser.es5.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<script src="js/utils.js"></script>
<script src="js/layout.js"></script>
```

---

## 핵심 디자인 원칙

**Poly Blue `#0066FF` 단일 색상을 투명도로만 구분하는 블루 톤앤톤 시스템.**

- 빨강·주황·회색 계열 차트 색상 절대 사용 금지
- 상태 색상(success/warning/danger)은 뱃지·텍스트 전용, 차트에 불가
- 사이드바: 라이트 모드 흰색(`#FFFFFF`) / 다크 모드 차콜(`#0F0F0F`) — 모드별 자동 전환
- 차트 색상은 `--chart-1`~`--chart-6` CSS 변수로 관리 — 라이트/다크 모드 동일 기저색
  - 기저색: `rgb(0,102,255)` (`#0066FF` 원색) — 라이트·다크 모드 모두 동일하게 적용
- `--chart-*` 변경은 차트·진행률 바에만 영향. 텍스트·배지·아이콘은 `--color-primary` 등 별도 토큰 사용 — 영향 없음

### 브랜드 컬러 스케일

| 토큰 | 값 | 용도 |
|------|----|------|
| `--color-primary` | `#0066FF` | 브랜드 기준색 |
| `--color-primary-light` | `#E8F0FF` | 배지·아이콘 배경 틴트 |
| `--color-primary-dark` | `#0052CC` | 호버·강조 |
| `--color-primary-deeper` | `#003D99` | 가장 진한 단계 |

---

## 사이드바(LNB) 스타일 규칙

- **라이트 모드**: 흰색 배경(`#FFFFFF`), 텍스트·아이콘은 중립 계열
- **다크 모드**: 차콜 배경(`#0F0F0F`) — 콘텐츠 배경(`#111111`)보다 진하게 유지
- `--color-sidebar-hover`: `rgba(0,0,0,0.04)` — 블루 틴트 금지, 중립 어둠으로만
- `.sidebar-brand`: `font-size: 24px`, `color: var(--color-text-primary)` — 다크 모드에서 `#FFFFFF`로 오버라이드
- `.user-avatar`: `background: var(--color-bg-muted)`, `color: var(--color-text-primary)` — 블루 배경 금지
- `.user-name`: `color: var(--color-text-primary)` — 다크 모드에서 `#FFFFFF`로 오버라이드
- 사이드바 OverlayScrollbars 초기화 금지 — 내부 너비 축소로 콘텐츠 영역과 틈 발생

---

## 배지(Badge) 색상 규칙

상태 배지는 정보 우선순위에 따라 색상 부여. **완료/정상/중립 상태는 모노톤(`badge-neutral`)**, 주의가 필요한 상태만 컬러 사용.

| 배지 클래스 | 색상 | 사용 케이스 |
|-------------|------|-------------|
| `badge-success` | Poly Blue | 재원, 운영중(활성 상태) |
| `badge-primary` | Poly Blue | 관리자 역할, 정규직 |
| `badge-neutral` | 회색 모노톤 | 완납, 완료, 재직, 퇴원, 마감(강좌), 시간강사, 과목 태그, 일반 카테고리 |
| `badge-warning` | 황색 | 미납, 부분납, 지각, 조퇴, 휴원, 개설예정 |
| `badge-danger` | 적색 | 결석, 시험일정(공지 카테고리) |
| `badge-info` | — | **사용 금지** — badge-success/primary/neutral로 대체 |

---

## 버튼(Button) 규칙

| 클래스 | 용도 |
|--------|------|
| `btn btn-primary` | 주요 액션 (등록, 저장) — Poly Blue 배경 |
| `btn btn-secondary` | 보조 액션 (상세, 영수증, 연락하기, 수정) — 중립 |
| `btn btn-ghost` | 삭제 액션 — `#4B5563` 배경 + 흰색 텍스트 (수정 버튼과 시각적으로 구분) |
| `btn-sm` | 테이블 내 작은 버튼 |

---

## 카드(Card) 구조 규칙

```html
<!-- 카드 기본 구조 -->
<div class="card">
  <div class="card-header">
    <div class="card-title">제목</div>
    <!-- 우측에 period-tabs 등 선택적 추가 -->
  </div>
  <div class="card-body">
    <!-- 콘텐츠 -->
  </div>
</div>
```

- `.card-body` — `no-pad` 클래스 사용 금지. 테이블 카드도 표준 `card-body`만 사용
- 테이블 `<thead>` — `style="border-top: var(--border-default);"` 인라인 스타일 직접 지정 필수
- 테이블 마지막 행 — `tbody tr:last-child { border-bottom: var(--border-default); }` (전역 CSS 자동 적용)

---

## 필터바(Filter Bar) 규칙

**필터바는 항상 카드 외부에 독립 배치.** 카드 내부(card-header 포함) 절대 금지.

```html
<!-- 올바른 패턴: 필터바 → 카드 순서로 분리 -->
<div class="filter-bar">
  <div class="search-box">...</div>
  <select class="filter-select">...</select>
</div>
<div class="card section">
  <div class="card-header">
    <div class="card-title">목록 제목</div>
  </div>
  <div class="card-body">
    <div class="table-wrapper">...
```

---

## 차트 설정 규칙

### setChartDefaults() — utils.js

```javascript
Chart.defaults.datasets.bar.barPercentage = 0.45;
Chart.defaults.datasets.bar.maxBarThickness = 32;  // 막대 최대 픽셀 너비 고정
```

### 막대 차트 데이터셋 (전역 기본값과 별도로 명시)

```javascript
datasets: [{
  barPercentage: 0.45,   // 항상 명시 (belt-and-suspenders)
  borderRadius: 3,
  backgroundColor: c[0],
}]
```

### 라인 차트 통일 스타일 (점 솔리드 도트)

```javascript
{
  type: 'line',
  fill: true,
  borderWidth: 2,
  pointRadius: 5,
  pointHoverRadius: 7,
  pointBackgroundColor: c[0],     // 솔리드 도트 — 전역 기본값(링 스타일) 오버라이드 필수
  pointBorderColor: 'transparent',
  pointBorderWidth: 0,
}
```

### 강좌별 출석률 패턴 (attendance.html)

각 항목을 개별 카드 박스로 표현. 최고값 하이라이트 포함:

```javascript
const maxRate = Math.max(...subData.map(d => d.rate));
subData.map(d => {
  const barColor  = d.rate === maxRate ? 'var(--chart-1)' : d.rate >= 95 ? 'var(--chart-2)' : d.rate >= 88 ? 'var(--chart-3)' : 'var(--chart-4)';
  const textColor = d.rate === maxRate ? 'var(--chart-1)' : 'var(--color-text-secondary)';
  return `<div style="padding:var(--space-5);border:var(--border-default);border-radius:var(--radius-lg);">...</div>`;
});
```

---

## 공통 초기화 패턴

모든 페이지 `<script>` 블록 최상단:

```javascript
initLayout('현재파일명.html');   // 사이드바 + 테마 토글 버튼 + 브레드크럼 렌더링
```

**차트 페이지 초기화 패턴 (테마 대응):**

```javascript
let _charts = {};

function buildCharts() {
  setChartDefaults();
  Object.values(_charts).forEach(ch => ch && ch.destroy());
  const c = getChartColors();   // 현재 테마에 맞는 --chart-* 색상 배열

  _charts.myChart = new Chart(el, {
    data: { datasets: [{ backgroundColor: c[0], barPercentage: 0.45, ... }] }
  });
}

buildCharts();
window.addEventListener('themechange', buildCharts);  // 테마 토글 시 자동 재빌드
```

**Flatpickr 사용 시:**

```javascript
flatpickr('#inputId', {
  locale: fpLocale,
  dateFormat: 'Y.m.d',
  disableMobile: true,
  onReady:       function(_, __, fp) { initFlatpickrSelects(fp); },
  onMonthChange: function(_, __, fp) { syncFlatpickrMonthLabel(fp); },
});
```

**커스텀 셀렉트:** `<select class="filter-select">` 클래스만 붙이면 자동 변환

---

## 브레드크럼(Breadcrumb) 네비게이션

`layout.js`의 `initLayout()` 호출 시 자동 생성. `.topbar-title` 요소를 대체:
- index.html: 현재 페이지명만 표시
- 그 외 페이지: 홈 아이콘 `›` 현재 페이지명 형태로 렌더링

---

## 중요 구현 제약사항

| 항목 | 규칙 |
|------|------|
| HTML 내 JS 템플릿 리터럴 | `<script>` 밖 HTML에 `${...}` 사용 금지 — 브라우저가 원문 그대로 렌더링함. 반드시 정적 HTML로 작성 |
| `.flatpickr-calendar` CSS | `overflow: visible !important` 만 사용. `position: relative !important` 절대 금지 (팝업 위치 깨짐) |
| `.fp-cal-dropdown` | 기본 `top: -9999px` — JS가 open 시 `headerHeight px`로 설정 |
| `numInputWrapper` 숨김 | CSS `!important`로 숨기면 JS `display:none`이 무시됨 — JS로만 숨길 것 |
| 차트 색상 업데이트 | `getChartColors()` + `buildCharts()` 패턴 사용. `layout.js`가 `themechange` 이벤트 dispatch — 페이지에서 `window.addEventListener('themechange', buildCharts)` 등록 필수 |
| CSS 변수 차트 색상 | Progress bar 등 비Chart.js 요소는 `style="background:var(--chart-N)"` 사용 — 테마 전환 자동 반영 |
| 필터바 위치 | 카드 내부 금지 — 반드시 카드 외부 독립 배치 |
| 막대 그래프 두께 | `barPercentage: 0.45` + `maxBarThickness: 32` 항상 적용 |
| 라인 차트 점 | dataset 레벨에서 `pointBackgroundColor: c[0]`, `pointBorderColor: 'transparent'` 명시 필수 — 전역 기본값이 링 스타일이라 오버라이드 안 하면 흰 링으로 표시됨 |

---

## 다크 모드

`<html data-theme="dark">` 로 제어. `localStorage('epTheme')` 저장.
탑바 우측 달·해 아이콘 버튼이 자동 삽입됨 (`layout.js`).
