# Secure Code Audit Skill — KISA 2021 기반

「소프트웨어 보안약점 진단가이드(2021, KISA/행정안전부)」의
**설계단계 보안설계 기준 20개 + 구현단계 보안약점 49개**를 전수 점검하는 스킬.

## Purpose
대상 코드베이스를 KISA 2021 69개 진단항목 기준으로 전수 점검하고,
모든 항목을 `PASS` / `VULNERABLE` / `NEEDS_REVIEW` / `N/A`로 판정한다.
단일 출처는 `kisa_00_master_checklist.md`.

## Usage

### 전체 진단 (69개 전수)
`/security-skill`

### 부분 진단 (특정 모듈만)
`/security-skill <module>`

| module 키워드 | 실행 파일 | KISA 항목 |
|---|---|---|
| `master` | kisa_00_master_checklist.md | 전체 인덱스(D-01~A-02) |
| `design` | 01_design_review.md | 설계 20 (D-01~D-20) |
| `input` | 02_input_validation.md | 입력검증 17 (I-01~I-17) |
| `secfunc` | 03_security_function.md | 보안기능 16 (S-01~S-16) |
| `time` | 04_time_and_state.md | 시간및상태 2 (T-01~T-02) |
| `error` | 05_error_handling.md | 에러처리 3 (E-01~E-03) |
| `code` | 06_code_error.md | 코드오류 5 (C-01~C-05) |
| `encap` | 07_encapsulation.md | 캡슐화 4 (P-01~P-04) |
| `apimisuse` | 08_api_misuse.md | API오용 2 (A-01~A-02) |
| `report` | 09_report_template.md | 보고서 템플릿 |

예시: `/security-skill input` → 입력데이터 검증 17개 항목만 진단

## Workflow

**부분 진단**: 해당 모듈 파일을 로드해 그 카테고리 항목만 진단하고,
`09_report_template.md`의 해당 결과표 부분을 채워 출력한다.

**전체 진단**:
1. `kisa_00_master_checklist.md`로 전체 69개 항목을 고정한다.
2. 코드베이스 아키텍처/기술스택을 파악하고 공격 표면을 열거한다.
3. 설계 20개(`01`)를 산출물/코드 구조 기준으로 판정한다.
4. 구현 49개(`02`~`08`)를 각 카테고리 파일의 탐지 위치·체크 방법으로 판정한다.
5. **모든 69개 항목**을 `09_report_template.md`의 결과표에 빠짐없이 채운다.
   - 어떤 항목도 생략 금지. 해당 없으면 `N/A` + 사유 명시.
6. VULNERABLE/NEEDS_REVIEW 항목은 위치·공격 시나리오·수정안(예시 코드)을 상세화한다.
7. 수정 우선순위(P0/P1/P2)를 제시한다.

## 판정 기준
- **PASS**: 방어가 코드/설계에 명확히 존재하고 우회 경로 없음.
- **VULNERABLE**: 약점이 실제 존재하거나 방어 부재. 즉시 수정 대상.
- **NEEDS_REVIEW**: 코드만으로 판단 불가(런타임/외부 의존) → 수동 확인.
- **N/A**: 기술스택상 존재 불가. 사유 필수.
