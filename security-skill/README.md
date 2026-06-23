# Security Skill Pack

This is a starter pack. Expand each checklist into detailed rules, attack scenarios, detection logic, fixes, and code examples.

## 사용법

- 전체 감사: `/security-skill`
- 부분 감사: `/security-skill <module>` (예: `/security-skill arch`, `/security-skill input`)

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
- **서비스별 파일 분리** — `s3Service.js`, `smsService.js`처럼 외부 서비스가 분리되어 있어야 `08`~`11` 모듈이 정확히 작동합니다.
- **Webhook 처리 코드는 명시적으로** — 라우트 이름이나 주석에 webhook임이 표시되어야 서명 검증 체크가 가능합니다.
