# Security Skill — KISA 2021 소프트웨어 보안약점 진단

「소프트웨어 보안약점 진단가이드(2021, KISA/행정안전부)」 기반 전수 점검 스킬입니다.
**설계단계 보안설계 기준 20개 + 구현단계 보안약점 49개**(총 69개 항목)를
모두 `PASS / VULNERABLE / NEEDS_REVIEW / N/A`로 판정합니다.

## 진단 항목 (69개)

| 카테고리 | 항목 수 | 파일 |
|----------|---------|------|
| 설계단계 보안설계 | 20 (D-01~D-20) | `01_design_review.md` |
| 입력데이터 검증 및 표현 | 17 (I-01~I-17) | `02_input_validation.md` |
| 보안기능 | 16 (S-01~S-16) | `03_security_function.md` |
| 시간 및 상태 | 2 (T-01~T-02) | `04_time_and_state.md` |
| 에러처리 | 3 (E-01~E-03) | `05_error_handling.md` |
| 코드오류 | 5 (C-01~C-05) | `06_code_error.md` |
| 캡슐화 | 4 (P-01~P-04) | `07_encapsulation.md` |
| API 오용 | 2 (A-01~A-02) | `08_api_misuse.md` |

전체 항목 인덱스는 `kisa_00_master_checklist.md`(단일 출처),
결과표 템플릿은 `09_report_template.md`를 참고하세요.
각 항목은 **목적 / 공격 시나리오 / 탐지 위치 / 체크 방법 / PASS·VULNERABLE·NEEDS_REVIEW 기준 / 수정 가이드 / 예시 코드** 필드로 구성됩니다.

## 사용법

- 전체 진단(69개 전수): `/security-skill`
- 부분 진단: `/security-skill <module>` (예: `/security-skill input`, `/security-skill secfunc`)

모듈 키워드는 `SKILL.md`의 표를 참고하세요.

## Best Practices — 이 스킬이 가장 잘 작동하는 조건

이 체크리스트는 아래 조건을 충족하는 코드베이스에서 가장 정확하게 동작합니다.

### 코드베이스 구조
- **모노레포 권장** — `client/`, `server/`가 한 워크스페이스에 있어야 프론트–백 경계(CORS, 인증 흐름)를 함께 분석할 수 있습니다.
- **명확한 레이어 분리** — `routes/`, `controllers/`, `services/`, `middleware/` 구조가 있으면 공격 표면 매핑이 쉬워집니다.
- **라우트 파일이 한곳에 모여 있을 것** — API 전수 검토가 가능해집니다.

### 언어 / 타입
- **TypeScript 선호** — 타입 정보가 있으면 IDOR 분석(id가 number vs string)과 입력 유효성 누락 탐지 정확도가 높아집니다.
- **스키마 검증 라이브러리 사용** — `zod`, `joi`, `class-validator` 등이 있으면 입력 검증 체크리스트를 자동화할 수 있습니다.

### 환경 설정
- **`.env.example` 존재** — 필요한 환경변수를 알아야 시크릿 노출 여부를 판단할 수 있습니다.
- **환경별 config 분리** — `development` / `production` 설정이 구분되어야 프로덕션 전용 취약점을 탐지할 수 있습니다.

### 인증 구조
- **미들웨어가 명시적일 것** — 라우트마다 `auth` 미들웨어가 명시적으로 붙어 있어야 누락을 탐지할 수 있습니다.
- **역할(Role) 체계가 코드에 드러날 것** — `role: 'admin'` 같은 상수가 코드에 있어야 권한 에스컬레이션 분석이 가능합니다.

### 외부 연동
- **서비스별 파일 분리** — `s3Service.js`, `smsService.js`처럼 외부 서비스가 분리되어 있어야 SSRF·암호·API 오용 진단이 정확해집니다.
- **Webhook 처리 코드는 명시적으로** — 라우트 이름이나 주석에 webhook임이 표시되어야 서명 검증(S-10) 체크가 가능합니다.
