# EduPoly 캠퍼스 — Design System

> **Poly Blue** (`#0066FF`) 단일 색상을 투명도로 구분하는 블루 톤앤톤 시스템

---

## 1. 색상

### 브랜드 팔레트

| 역할 | 변수 | 값 |
|------|------|-----|
| Primary Blue | `--color-primary` | `#0066FF` |
| Primary Dark | `--color-primary-dark` | `#0052CC` (호버·강조) |
| Primary Deeper | `--color-primary-deeper` | `#003D99` (가장 진한 블루) |
| Primary Light | `--color-primary-light` | `#E8F0FF` (배지·아이콘 배경 틴트) |

### Brand Alpha 토큰 (박스 그림자·포커스 링·배경)

하드코딩 `rgba(0,102,255,...)` 사용 금지 — 반드시 아래 CSS 변수 사용.

| 변수 | 값 |
|------|----|
| `--color-primary-a08` | `rgba(0,102,255,0.08)` |
| `--color-primary-a10` | `rgba(0,102,255,0.10)` |
| `--color-primary-a15` | `rgba(0,102,255,0.15)` |
| `--color-primary-a25` | `rgba(0,102,255,0.25)` |
| `--color-primary-a30` | `rgba(0,102,255,0.30)` |
| `--color-primary-a50` | `rgba(0,102,255,0.50)` |

### 중립(Neutral) — 배경·테두리·텍스트

| 변수 | 값 | 용도 |
|------|-----|------|
| `--color-bg` | `#FFFFFF` | 카드·컴포넌트 배경 |
| `--color-bg-subtle` | `#F7F8FA` | 페이지 배경 |
| `--color-bg-muted` | `#EDEFF2` | 호버·뮤트 배경 |
| `--color-border` | `#E2E5EA` | 기본 테두리 |
| `--color-border-strong` | `#C4C8D0` | 강조 테두리 |
| `--color-text-primary` | `#111827` | 주 텍스트 |
| `--color-text-secondary` | `#6B7280` | 보조 텍스트 |
| `--color-text-tertiary` | `#9CA3AF` | 3차 텍스트·라벨 |
| `--color-text-disabled` | `#D1D5DB` | 비활성 텍스트 |

### 시맨틱 색상 (상태 표시·뱃지·텍스트 전용)

> 경고·위험 색상은 **뱃지·텍스트 상태 표시 전용**. 차트에 사용 금지.

| 역할 | 변수 | 값 |
|------|------|-----|
| 완료·활성 | `--color-success` | `#0066FF` (Brand Blue) |
| 완료 배경 | `--color-success-light` | `#E8F0FF` |
| 경고 | `--color-warning` | `#D97706` |
| 경고 배경 | `--color-warning-light` | `#FFFBEB` |
| 위험 | `--color-danger` | `#DC2626` |
| 위험 배경 | `--color-danger-light` | `#FEF2F2` |

### 사이드바

라이트 모드 흰색 / 다크 모드 차콜 자동 전환.

| 변수 | 라이트 | 다크 |
|------|--------|------|
| `--color-sidebar-bg` | `#FFFFFF` | `#0F0F0F` |
| `--color-sidebar-active` | `#0066FF` | (동일) |
| `--color-sidebar-text` | `rgba(0,0,0,0.52)` | `rgba(255,255,255,0.60)` |
| `--color-sidebar-text-hover` | `#111827` | `#FFFFFF` |
| `--color-sidebar-hover` | `rgba(0,0,0,0.04)` | `rgba(255,255,255,0.07)` |
| `--color-sidebar-border` | `#E2E5EA` | `rgba(255,255,255,0.08)` |
| `--color-sidebar-section` | `#9CA3AF` | `rgba(255,255,255,0.32)` |

---

## 2. 차트 팔레트

Poly Blue `#0066FF` 투명도 단계로 표현. 빨강·주황·그레이 사용 금지.  
라이트/다크 모드 **동일한 기저색** `rgb(0,102,255)` 사용.  
코드에서는 항상 `getChartColors()`를 호출해 현재 테마 색상 배열을 가져올 것.

| 변수 | 값 | 용도 |
|------|--------|------|
| `--chart-1` | `rgba(0,102,255,0.85)` | 최고값·주요 시리즈 |
| `--chart-2` | `rgba(0,102,255,0.60)` | 2순위 |
| `--chart-3` | `rgba(0,102,255,0.38)` | 3순위 |
| `--chart-4` | `rgba(0,102,255,0.22)` | 비교 막대·하위 레이어 |
| `--chart-5` | `rgba(0,102,255,0.13)` | 배경값·미주요 |
| `--chart-6` | `rgba(0,102,255,0.07)` | 라인 fill·최소값 |

> 라이트·다크 모드 모두 동일한 기저색 사용. 다크 모드에서도 `--chart-*` 값 동일.

### 차트 유형별 적용

| 유형 | 적용 방식 |
|------|-----------|
| Bar (비교) | `c[0]` 최고값, `c[1]`~`c[4]` 균등 분배 |
| Stacked Bar | 사용 `c[0]`, 잔여/비교 `c[3]`~`c[5]` |
| Doughnut / Pie | `[c[0], c[1], c[2], c[3]]` 순 |
| Line | borderColor `c[0]`, fill `c[5]` (투명) |
| Progress bar | 인라인 `style="background:var(--chart-N)"` |

---

## 3. 타이포그래피

```
폰트: Inter (Latin 기본) → Pretendard (한국어 보조) → system-ui
```

| 토큰 | 크기 | 용도 |
|------|------|------|
| `--text-xs` | `11px` | 뱃지·레이블 |
| `--text-sm` | `13px` | 보조 텍스트·테이블 |
| `--text-base` | `15px` | 본문 |
| `--text-lg` | `17px` | 페이지 제목·섹션 타이틀 |
| `--text-xl` | `20px` | — |
| `--text-2xl` | `24px` | — |
| `--text-3xl` | `30px` | KPI 수치 |

| 토큰 | 값 |
|------|----|
| `--weight-normal` | `400` |
| `--weight-medium` | `500` |
| `--weight-semibold` | `600` |

---

## 4. 간격 · 테두리 · 그림자

**Spacing scale:** `4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48 · 64px`

| 토큰 | 값 |
|------|----|
| `--space-1` | `4px` |
| `--space-2` | `8px` |
| `--space-3` | `12px` |
| `--space-4` | `16px` |
| `--space-5` | `20px` |
| `--space-6` | `24px` |
| `--space-8` | `32px` |
| `--space-10` | `40px` |
| `--space-12` | `48px` |
| `--space-16` | `64px` |

### Border Radius

| 토큰 | 값 | 용도 |
|------|-----|------|
| `--radius-sm` | `4px` | (내부 소형 요소만) |
| `--radius-md` | `8px` | **버튼·인풋·셀렉트·드롭다운** |
| `--radius-lg` | `12px` | 카드·필터바·큰 컨테이너 |
| `--radius-xl` | `16px` | — |
| `--radius-full` | `9999px` | 뱃지·아바타 |

> 모든 인터랙티브 요소(버튼·인풋·셀렉트·커스텀 셀렉트 트리거·날짜 인풋)는 `--radius-md`(8px) 통일. `--radius-sm` 사용 금지.

### Shadow

| 토큰 | 값 |
|------|----|
| `--shadow-sm` | `0 1px 2px 0 rgba(0,0,0,0.06)` |
| `--shadow-md` | `0 4px 6px -1px rgba(0,0,0,0.08), 0 2px 4px -1px rgba(0,0,0,0.04)` |
| `--shadow-lg` | `0 10px 15px -3px rgba(0,0,0,0.10), 0 4px 6px -2px rgba(0,0,0,0.05)` |

---

## 5. 컴포넌트 높이 (Component Heights)

**모든 입력 요소와 버튼의 높이는 동일해야 한다.**

| 토큰 | 값 | 적용 대상 |
|------|----|-----------|
| `--input-height` | `40px` | `.form-input`, `.form-select`, `select.filter-select`, `.cs-trigger`, `.search-box`, `.fp-date-input`, `.btn` |

- `.btn-sm` 예외 — `height: auto; padding: 6px 12px` (테이블 내 소형 버튼)
- `.form-textarea` 예외 — 자유 높이

---

## 6. 컴포넌트

### KPI 카드

```
구조: [아이콘] [레이블] / [수치] / [변화율]
그리드: repeat(auto-fit, minmax(200px, 1fr))  gap: 16px
```

- **아이콘 색상**: 배경 `var(--color-primary-light)` / 아이콘 `var(--color-primary)` — Poly Blue 단일
- **변화율**: 양수(▲) `--color-success` · 음수(▼) `--color-danger` · 중립 `--color-text-tertiary`

### 뱃지

| 클래스 | 색상 | 사용 |
|--------|------|------|
| `.badge-success` | Poly Blue 틴트 | 재원, 운영중 (완료·활성) |
| `.badge-primary` | Poly Blue 틴트 | 관리자 역할, 정규직 |
| `.badge-neutral` | 회색 모노톤 | 완납, 완료, 재직, 퇴원, 마감, 일반 카테고리 |
| `.badge-warning` | 황색 | 미납, 부분납, 지각, 조퇴, 휴원, 개설예정 |
| `.badge-danger` | 적색 | 결석, 시험일정 |
| `.badge-info` | — | **사용 금지** — badge-success/primary/neutral로 대체 |

> 완료·정상·중립 상태는 `badge-neutral`. 주의가 필요한 상태만 컬러 사용.

### 버튼

| 클래스 | 용도 | 배경 |
|--------|------|------|
| `btn btn-primary` | 주요 액션 (등록·저장) | `var(--color-primary)` |
| `btn btn-secondary` | 보조 액션 (상세·수정·연락) | white, border |
| `btn btn-ghost` | 삭제 액션 | `#4B5563` + 흰색 텍스트 |
| `btn-sm` | 테이블 내 소형 | height auto, padding 6px 12px |

- 높이: `--input-height` (40px) — input/select와 통일
- border-radius: `--radius-md` (8px)

### 카드(Card)

```html
<div class="card">
  <div class="card-header">
    <div class="card-title">제목</div>
  </div>
  <div class="card-body">
    <!-- 콘텐츠 -->
  </div>
</div>
```

- 테이블 `<thead>` — `style="border-top: var(--border-default);"` 인라인 스타일 직접 지정 필수
- `card-body no-pad` 내부 래퍼 — 인라인 padding 대신 `.card-list-pad` 클래스 사용

#### card-list-pad

```html
<div class="card-body no-pad">
  <div class="card-list-pad">
    <!-- 리스트 항목 -->
  </div>
</div>
```

- sidebar 모드: `padding: 16px 24px`
- top 모드: 좌우 패딩 자동 제거 → 카드 타이틀과 그리드 정렬

### 테이블

```
헤더: bg var(--color-bg-subtle) / font-medium / text-secondary
행 hover: var(--color-bg-subtle)
구분선: var(--color-border)
```

**TD 정렬 규칙**

| 클래스 | 정렬 | 용도 |
|--------|------|------|
| (기본) | `center` | 모든 `tbody td` 기본값 |
| `.text-left` | `left` | 제목·강좌명·긴 텍스트 컬럼 |
| `.text-right` | `right` + tabular-nums | 금액·수치 컬럼 |
| `.text-center` | `center` | 명시적 중앙 정렬 |

### 필터바(Filter Bar)

**카드 외부에 독립 배치. 카드 내부(card-header 포함) 금지.**

- 배경: `var(--color-bg-muted)` + `border-radius: var(--radius-lg)` + `padding: 16px 24px`
- 정렬: `justify-content: flex-start` (카드 그리드와 좌측 기준선 일치)
- `.search-box`: `flex: 1` — 남은 공간을 채우고 셀렉트들이 우측 배치

### 모달

| 클래스 | 너비 |
|--------|------|
| `.modal` (기본) | `560px` |
| `.modal-sm` | `400px` |
| `.modal-lg` | `720px` |

- **오버레이**: `rgba(11,19,41,0.55)` + `backdrop-filter: blur(4px)`
- **배경**: `var(--color-bg)` (라이트·다크 자동 대응)
- 구조: 헤더(제목 + 닫기 버튼) / 본문 / 푸터(액션 버튼)

### 커스텀 셀렉트

`select.filter-select` 또는 `select.form-select` 클래스 사용 시 자동으로 커스텀 드롭다운으로 변환.

- `.form-group` 내부: `cs-wrap` 전체 너비(`display: block`), `cs-trigger` 100% 너비 자동 적용
- 드롭다운 리스트 박스: 상하 패딩 없음 — 리스트가 박스 상단부터 바로 시작
- border-radius: `--radius-md` (8px)

**시각 상태**

| 상태 | 외형 |
|------|------|
| 기본 | 테두리 `--color-border`, 배경 white, chevron 우측 |
| 호버 | 테두리 `--color-border-strong` |
| 열림(open) | 테두리 `--color-primary`, 포커스 링 `--color-primary-light` |
| 옵션 호버 | 배경 `--color-bg-subtle` |
| 선택된 옵션 | 텍스트 `--color-primary`, 배경 `--color-primary-light`, 굵기 semibold |

### 날짜 피커 (Flatpickr)

**인풋 스타일** (`.fp-date-input`)

| 상태 | 외형 |
|------|------|
| 기본 | 테두리 `--color-border`, 배경 white, `border-radius: --radius-md`, 높이 `--input-height` |
| 포커스 | 테두리 `--color-primary`, 포커스 링 `--color-primary-light` |

**달력 시각 사양**

- 전체 너비: `324px` / 날짜 그리드: `308px`
- 헤더: 월·연도 텍스트 버튼 클릭 → 달력 내 리스트 드롭다운 (최대 높이 200px)
- 월 표기: 한국어 (1월·2월·…·12월) / 요일: 한국어 (일·월·…·토)
- 다음 달 날짜: 표시 안 함

**날짜 셀 상태**

| 상태 | 외형 |
|------|------|
| 기본 | 투명 배경, `border-radius: --radius-sm` |
| 호버 | 배경 `--color-bg-muted` |
| 오늘 | 테두리 `--color-primary`, 텍스트 `--color-primary`, 굵기 semibold |
| 선택 / 범위 시작·끝 | 배경 `--color-primary`, 텍스트 white |
| 범위 내 | 배경 `--color-primary-light` |
| 비활성 | 텍스트 `--color-text-tertiary` |

### 스크롤바 (OverlayScrollbars)

콘텐츠 위에 오버레이되는 5px 슬림 스크롤바. `os-theme-poly` 테마 적용.

| 상태 | 라이트 | 다크 |
|------|--------|------|
| 핸들 기본 | `var(--color-primary-a22)` | `rgba(255,255,255,0.20)` |
| 핸들 호버 | `var(--color-primary-a42)` | `rgba(255,255,255,0.36)` |
| 핸들 활성 | `var(--color-primary-a50)` | `rgba(255,255,255,0.52)` |

- 너비: `5px` / 핸들 최소 높이: `24px` / `border-radius: 10px`

---

## 7. 레이아웃

### Sidebar 모드 (기본)

```
[사이드바 240px] | [메인 flex-1]
  ├── 로고·브랜드 56px    ├── 탑바 56px
  └── 네비게이션          └── 페이지 콘텐츠 (세로 스크롤)
```

### Top Nav 모드

`initLayout()`이 `data-layout="top"` 부여 시 자동 전환.

```
[탑내비바 56px — sticky top:0]
[히스토리 네비 38px — 콘텐츠와 함께 스크롤]
[page-content — 좌우 padding 40px]
```

- `topnav-bar`: `position: sticky; top: 0` — 스크롤 시 상단 고정
- `topbar`: 콘텐츠와 함께 스크롤되어 올라감
- `topnav-bar`, `topbar`, `page-content` 좌우 패딩 모두 `40px`로 통일
- 카드 `card-header`, `card-body` 좌우 패딩 자동 제거 (전 카드 적용, `flush-x` 불필요)
- 카드 타이틀 위에 `16px × 2px` 파란 액센트 라인 자동 표시

**Top 모드 섹션 간격**

| 영역 | gap / margin |
|------|-------------|
| `.kpi-grid` | `gap: 20px; margin-bottom: 40px` |
| `.section` | `margin-bottom: 40px` |
| `.chart-grid-2`, `.chart-grid-3` | `gap: 40px` |

### 차트 그리드

| 클래스 | 컬럼 | 용도 |
|--------|------|------|
| `.chart-grid-2` | `1fr 1fr` | 동등 2분할 |
| `.chart-grid-3` | `2fr 1fr` | 넓은 차트 + 보조 |

> `[data-layout="top"]`에서 gap 자동 적용 — 인라인 `style="gap:..."` 사용 금지, 반드시 클래스 사용

> 1024px 이하에서 모두 단일 컬럼으로 전환

**차트 캔버스 높이:** `240px` (소) / `320px` (중) / `480px` (대)

---

## 8. 접근성

- 모든 인터랙티브 요소에 `aria-label` 또는 가시 텍스트 필수
- 차트에 `role="img"` + `aria-label` (데이터 요약)
- 색상 단독으로 의미 전달 금지 → 아이콘·텍스트 병행

---

## 9. 다크 모드

탑바 우측 달·해 아이콘 버튼으로 토글. `<html data-theme="dark">` 적용. `localStorage('epTheme')` 저장.

### 토큰 오버라이드

| 역할 | 라이트 | 다크 |
|------|--------|------|
| 기본 배경 | `#FFFFFF` | `#111111` |
| 미묘 배경 | `#F7F8FA` | `#1A1A1A` |
| 뮤트 배경 | `#EDEFF2` | `#252525` |
| 테두리 | `#E2E5EA` | `rgba(255,255,255,0.10)` |
| 텍스트 주 | `#111827` | `#F5F5F5` |
| 텍스트 부 | `#6B7280` | `#9CA3AF` |
| 텍스트 3차 | `#9CA3AF` | `#6B7280` |
| Primary Light | `#E8F0FF` | `rgba(0,102,255,0.22)` |
| Success Light | `#E8F0FF` | `rgba(0,102,255,0.22)` |
| Warning Light | `#FFFBEB` | `rgba(217,119,6,0.18)` |
| Danger Light | `#FEF2F2` | `rgba(220,38,38,0.18)` |
| 사이드바 배경 | `#FFFFFF` | `#0F0F0F` |

### 차트 다크 모드

라이트·다크 모드 모두 `rgb(0,102,255)` 동일 기저색 사용.  
`getChartColors()`가 현재 테마 CSS 변수를 읽어 반환 — 테마 전환 시 자동 반영.
