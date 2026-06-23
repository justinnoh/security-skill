# Security Skill for Claude Code

엔터프라이즈 수준의 보안 코드 감사(Secure Code Audit)를 수행하는 Claude Code / Codex 스킬입니다.
아키텍처, 입력 검증, 인증/인가(IDOR/BOLA), 파일 업로드, API 보안, AI 에이전트 보안과
Google Drive · Slack · Obsidian · Railway 연동 보안을 체크리스트 기반으로 점검합니다.

## 설치

### 방법 A — 자동 설치 스크립트

```bash
git clone https://github.com/justinnoh/security-skill.git
cd security-skill
./install.sh
```

`install.sh`는 `security-skill/` 폴더를 `~/.claude/skills/`로 복사합니다.

### 방법 B — 수동 설치

`security-skill/` 폴더를 통째로 아래 위치에 복사하세요.

- macOS / Linux: `~/.claude/skills/security-skill/`
- Windows: `%USERPROFILE%\.claude\skills\security-skill\`

설치 후 새 Claude Code 세션을 시작하면 `/security-skill` 명령으로 사용할 수 있습니다.

## 사용법

- 전체 감사: `/security-skill`
- 부분 감사: `/security-skill <module>` (예: `/security-skill arch`, `/security-skill input`)

모듈 키워드는 [`security-skill/SKILL.md`](security-skill/SKILL.md)의 표를 참고하세요.

## Best Practices

이 스킬이 가장 정확하게 동작하는 코드베이스 조건은
[`security-skill/README.md`](security-skill/README.md)의 *Best Practices* 섹션을 참고하세요.

## License

MIT — see [LICENSE](LICENSE).
