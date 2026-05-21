# EduPoly 캠퍼스 — Design System

> **Poly Blue** (#004F9F) 단일 색상을 투명도로 조절하는 블루 톤앤톤 시스템

---

## 1. 색상

### 브랜드 팔레트

| 역할 | 변수 | 값 |
|------|------|-----|
| Primary Blue | `--color-primary` | `#004F9F` |
| Dark Navy | `--color-primary-dark` | `#263985` |
| Deeper Navy | `--color-primary-deeper` | `#1A2760` |
| Primary Light | `--color-primary-light` | `#E8F0FA` |

### 시맨틱 색상 (상태 표시 전용)

| 역할 | 변수 | 값 |
|------|------|-----|
| 완료·활성 | `--color-success` | `#1A6EC2` (Medium Blue) |
| 완료 배경 | `--color-success-light` | `#E0EEF8` |
| 경고 | `--color-warning` | `#D97706` |
| 경고 배경 | `--color-warning-light` | `#FFFBEB` |
| 위험 | `--color-danger` | `#DC2626` |
| 위험 배경 | `--color-danger-light` | `#FEF2F2` |

> 경고·위험 색상은 **뱃지·텍스트 상태 표시 전용**입니다. 차트에는 사용하지 않습니다.

### 배경·텍스트·테두리

| 변수 | 값 | 용도 |
|------|-----|------|
| `--color-bg` | `#FFFFFF` | 카드·컴포넌트 배경 |
| `--color-bg-subtle` | `#F4F7FD` | 페이지 배경 |
| `--color-bg-muted` | `#E8EEF8` | 호버·뮤트 배경 |
| `--color-border` | `#C8D5EB` | 기본 테두리 |
| `--color-border-strong` | `#A8BDD8` | 강조 테두리 |
| `--color-text-primary` | `#0D1B3E` | 주 텍스트 |
| `--color-text-secondary` | `#3A5080` | 보조 텍스트 |
| `--color-text-tertiary` | `#7090B8` | 3차 텍스트·라벨 |

### 사이드바 (다크 블루)

| 변수 | 값 |
|------|-----|
| `--color-sidebar-bg` | `#263985` |
| `--color-sidebar-active` | `#004F9F` |
| `--color-sidebar-text` | `rgba(255,255,255,0.72)` |
| `--color-sidebar-text-hover` | `#FFFFFF` |
| `--color-sidebar-hover` | `rgba(255,255,255,0.08)` |

---

## 2. 차트 팔레트

Poly Blue 투명도 단계로 표현. 빨강·주황·그레이 사용 금지.  
라이트/다크 모드별 기저색이 다르며, CSS 변수 `--chart-1`~`--chart-6`으로 관리.  
코드에서는 항상 `getChartColors()`를 호출해 현재 테마 색상을 가져올 것.

### 라이트 모드 기저색: `rgb(0,88,210)` — hsl(214°, 100%, 41%)

흰 배경 합성 시 채도 유지를 위해 원본 Poly Blue보다 밝은 기저색 사용.

| 변수 | CSS 값 | 용도 |
|------|--------|------|
| `--chart-1` | `rgba(0,88,210,0.85)` | 최고값·주요 시리즈 |
| `--chart-2` | `rgba(0,88,210,0.60)` | 2순위 |
| `--chart-3` | `rgba(0,88,210,0.38)` | 3순위 |
| `--chart-4` | `rgba(0,88,210,0.22)` | 비교 막대·하위 레이어 |
| `--chart-5` | `rgba(0,88,210,0.13)` | 배경값·미주요 |
| `--chart-6` | `rgba(0,88,210,0.07)` | 라인 fill·최소값 |

### 다크 모드 기저색: `rgb(0,79,159)` — Poly Blue, hsl(214°, 100%, 31%)

| 변수 | CSS 값 |
|------|--------|
| `--chart-1` | `rgba(0,79,159,0.85)` |
| `--chart-2` | `rgba(0,79,159,0.60)` |
| `--chart-3` | `rgba(0,79,159,0.38)` |
| `--chart-4` | `rgba(0,79,159,0.22)` |
| `--chart-5` | `rgba(0,79,159,0.13)` |
| `--chart-6` | `rgba(0,79,159,0.07)` |

### 차트 유형별 적용

| 유형 | 적용 방식 |
|------|-----------|
| Bar (비교) | `c[0]` 최고값, `c[1]`~`c[4]` 균등 분배 |
| Stacked Bar | 사용 `c[0]`, 잔여/비교 `c[5]` |
| Doughnut / Pie | `[c[0], c[1], c[2], c[3]]` 순 |
| Line | borderColor `c[0]`, fill `rgba(0,79,159,0.07)` 고정 |
| Progress bar | 인라인 `style="background:var(--chart-N)"` |

---

## 3. 타이포그래피

```
폰트: Inter (Latin 기본) → Pretendard (한국어 보조) → system-ui
```

| 용도 | 크기 | 굵기 |
|------|------|------|
| 페이지 제목 | `17px` | 600 |
| 섹션 타이틀 | `17px` | 500 |
| KPI 수치 | `30px` | 600 |
| 본문 | `15px` | 400 |
| 보조 텍스트 | `13px` | 400 |
| 뱃지·레이블 | `11px` | 500 |

---

## 4. 간격 · 테두리 · 그림자

**Spacing scale:** `4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48 · 64px`

| 컴포넌트 | 패딩 |
|----------|------|
| KPI 카드 | `20px 24px` |
| 카드 헤더 | `20px 24px` |
| 테이블 셀 | `12px 16px` |
| 버튼 | `8px 16px` |
| 뱃지 | `2px 8px` |

| 토큰 | 값 | 용도 |
|------|-----|------|
| `--radius-sm` | `4px` | 버튼·인풋 |
| `--radius-md` | `8px` | 카드·드롭다운 |
| `--radius-lg` | `12px` | 큰 카드 |
| `--radius-full` | `9999px` | 뱃지·아바타 |
| `--shadow-sm` | `0 1px 2px rgba(38,57,133,0.06)` | |
| `--shadow-md` | `0 4px 6px -1px rgba(38,57,133,0.08)` | |
| `--shadow-lg` | `0 10px 15px -3px rgba(38,57,133,0.10)` | |

---

## 5. 컴포넌트

### KPI 카드

```
구조: [아이콘] [레이블] / [수치] / [변화율]
그리드: repeat(auto-fit, minmax(200px, 1fr))  gap: 16px
```

- **아이콘 색상**: 배경 `#E8F0FA` / 아이콘 `#004F9F` (클래스 색상과 무관하게 Poly Blue 단일 사용)
- **변화율**: 양수(▲) `--color-success` · 음수(▼) `--color-danger` · 중립 `--color-text-tertiary`

### 뱃지

| 클래스 | 배경 | 텍스트 | 사용 |
|--------|------|--------|------|
| `.badge-success` | `#E0EEF8` | `#1A6EC2` | 완료·활성·재직 |
| `.badge-warning` | `#FFFBEB` | `#D97706` | 예정·주의 |
| `.badge-danger`  | `#FEF2F2` | `#DC2626` | 오류·미납 |
| `.badge-primary` | `#E8F0FA` | `#004F9F` | 주요 정보 |
| `.badge-neutral` | `#E8EEF8` | `#3A5080` | 중립 |

### 버튼

| 유형 | 배경 | 호버 | 텍스트 |
|------|------|------|--------|
| Primary | `#004F9F` | `#263985` | white |
| Secondary | white | `#E8EEF8` | `#3A5080` |
| Danger | `#DC2626` | `#B91C1C` | white |
| 소형(`.btn-sm`) | — | — | 동일, `padding: 4px 10px` |

### 테이블

```
헤더: bg #F4F7FD  /  font-medium  /  text-secondary
행 hover: bg-subtle (#F4F7FD)
구분선: #C8D5EB
```

**TD 정렬 규칙**

| 클래스 | 정렬 | 용도 |
|--------|------|------|
| (기본) | `center` | 모든 `tbody td` 기본값 |
| `.text-left` | `left` | 제목·강좌명·긴 텍스트 컬럼 |
| `.text-right` | `right` + tabular-nums | 금액·수치 컬럼 |
| `.text-center` | `center` | 명시적 중앙 정렬 |

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

`select.filter-select` 클래스 사용 시 자동으로 커스텀 드롭다운으로 변환됩니다.

**시각 상태**

| 상태 | 외형 |
|------|------|
| 기본 | 테두리 `--color-border`, 배경 white, chevron 아이콘 우측 |
| 호버 | 테두리 `--color-border-strong` |
| 열림(open) | 테두리 `--color-primary`, 포커스 링 `--color-primary-light` |
| 옵션 호버 | 배경 `--color-bg-subtle` |
| 선택된 옵션 | 텍스트 `--color-primary`, 배경 `--color-primary-light`, 굵기 semibold |

- 드롭다운은 뷰포트 기준 절대 위치 — 스크롤·z-index에 안전하게 오버레이

### 날짜 피커 (Flatpickr)

**인풋 스타일** (`.fp-date-input`)

| 상태 | 외형 |
|------|------|
| 기본 | 테두리 `--color-border`, 배경 white, `border-radius: --radius-sm` |
| 포커스 | 테두리 `--color-primary`, 포커스 링 `--color-primary-light` |

**달력 시각 사양**

- 전체 너비: `324px` / 날짜 그리드: `308px`
- 헤더: 월·연도 각각 텍스트 버튼(호버 시 미묘 배경), 좌우 화살표 탐색
- 월·연도 클릭 시 달력 내부에 리스트 드롭다운 표시 (스크롤 가능, max-height 200px)
- 요일 헤더: 영문 약어 (Sun · Mon · Tue · Wed · Thu · Fri · Sat)
- 월 표기: 영문 (Jan · Feb · … · Dec)
- 다음 달 날짜: 표시 안 함 (빈 공간 없이 그리드 종료)

**날짜 셀 상태**

| 상태 | 외형 |
|------|------|
| 기본 | 투명 배경, `border-radius: --radius-sm` |
| 호버 | 배경 `--color-bg-muted` |
| 오늘 | 테두리 `--color-primary`, 텍스트 `--color-primary`, 굵기 semibold |
| 선택 / 범위 시작·끝 | 배경 `--color-primary`, 텍스트 white |
| 범위 내 | 배경 `--color-primary-light`, 박스 섀도로 좌우 연결 |
| 비활성 | 텍스트 `--color-text-tertiary` |
| 이전 달 날짜 | 텍스트 `--color-border-strong` |

### 스크롤바 (OverlayScrollbars)

콘텐츠 위에 오버레이되는 5px 슬림 스크롤바. `os-theme-poly` 테마 적용.

| 상태 | 라이트 | 다크 |
|------|--------|------|
| 핸들 기본 | `rgba(0,79,159,0.22)` | `rgba(255,255,255,0.20)` |
| 핸들 호버 | `rgba(0,79,159,0.42)` | `rgba(255,255,255,0.36)` |
| 핸들 활성 | `rgba(0,79,159,0.60)` | `rgba(255,255,255,0.52)` |

- 너비: `5px` / 핸들 최소 높이: `24px` / `border-radius: 10px`
- 마우스가 영역을 벗어나면 자동 숨김

---

## 6. 레이아웃

```
[사이드바 240px #263985] | [메인 flex-1]
  ├── 로고 영역 56px        ├── 탑바 56px white
  └── 네비게이션            └── 페이지 콘텐츠 (세로 스크롤)
                                  ├── 페이지 헤더
                                  ├── KPI 행
                                  ├── 차트 그리드
                                  └── 테이블
```

**차트 그리드**

| 클래스 | 컬럼 | 용도 |
|--------|------|------|
| `.chart-grid-2` | `1fr 1fr` | 동등 2분할 |
| `.chart-grid-3` | `2fr 1fr` | 넓은 차트 + 보조 |

> 1024px 이하에서 모두 단일 컬럼으로 전환

**차트 캔버스 높이:** `240px` (소) / `320px` (중) / `480px` (대)

---

## 7. 접근성

- 모든 인터랙티브 요소에 `aria-label` 또는 가시 텍스트 필수
- 차트에 `role="img"` + `aria-label` (데이터 요약)
- 색상 단독으로 의미 전달 금지 → 아이콘·텍스트 병행
- 다크 사이드바 텍스트 대비: `rgba(255,255,255,0.72)` ≈ 5.8:1 ✓

---

## 8. 다크 모드

탑바 우측 달·해 아이콘 버튼으로 토글. `<html data-theme="dark">` 적용.

### 토큰 오버라이드

| 역할 | 라이트 | 다크 |
|------|--------|------|
| 기본 배경 | `#FFFFFF` | `#0B1329` |
| 미묘 배경 | `#F4F7FD` | `#111D3D` |
| 뮤트 배경 | `#E8EEF8` | `#1A2B52` |
| 테두리 | `#C8D5EB` | `rgba(255,255,255,0.10)` |
| 텍스트 주 | `#0D1B3E` | `#E8F0FA` |
| 텍스트 부 | `#3A5080` | `#88BCEB` |
| 텍스트 3차 | `#7090B8` | `#5A9FD8` |
| Primary Light | `#E8F0FA` | `rgba(0,79,159,0.22)` |
| Success Light | `#E0EEF8` | `rgba(26,110,194,0.20)` |
| Warning Light | `#FFFBEB` | `rgba(217,119,6,0.18)` |
| Danger Light | `#FEF2F2` | `rgba(220,38,38,0.18)` |

- 사이드바 색상 변경 없음 — 이미 다크 네이비(`#263985`)

### 차트 다크 모드

`--chart-*` CSS 변수가 `[data-theme="dark"]`에서 자동으로 원본 Poly Blue 기저색으로 전환됨.  
차트 코드가 `getChartColors()`를 사용하면 테마 전환 시 색상이 자동 반영됨.

| 요소 | 라이트 | 다크 |
|------|--------|------|
| 데이터 기저색 | `rgb(0,88,210)` (밝은 Poly Blue) | `rgb(0,79,159)` (원본 Poly Blue) |
| 축 레이블·레전드 | `#7090B8` | `#88BCEB` |
| 그리드 선 | `rgba(200,213,235,0.5)` | `rgba(255,255,255,0.06)` |
| 툴팁 배경 | `#FFFFFF` | `#1A2B52` |
| 라인차트 포인트 | `#FFFFFF` | `#111D3D` |
| 도넛·파이·폴라 구분선 | `2px / #fff` | `0px / transparent` |
