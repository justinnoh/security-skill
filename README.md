# Security Skill for Claude Code

「소프트웨어 보안약점 진단가이드(2021, KISA/행정안전부)」 기반의 보안 코드 진단
Claude Code / Codex 스킬입니다. **설계단계 보안설계 기준 20개 + 구현단계 보안약점 49개**
(총 69개 항목)를 전수 점검하고, 모든 항목을 `PASS / VULNERABLE / NEEDS_REVIEW / N/A`로 판정합니다.

자세한 진단 항목 구성과 사용법은 [`security-skill/README.md`](security-skill/README.md)를 참고하세요.

## 설치

먼저 저장소를 클론합니다(모든 OS 공통).

```bash
git clone https://github.com/justinnoh/security-skill.git
cd security-skill
```

설치 스크립트는 `security-skill/` 폴더를 Claude Code의 스킬 디렉토리로 복사합니다.
기존 설치가 있으면 자동으로 교체합니다.

### macOS / Linux

```bash
chmod +x install.sh   # 최초 1회 (이미 실행권한이 있으면 생략 가능)
./install.sh
```

설치 위치: `~/.claude/skills/security-skill/`

### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

설치 위치: `%USERPROFILE%\.claude\skills\security-skill\`

### Windows (Git Bash / WSL)

Git Bash 또는 WSL을 쓴다면 macOS/Linux와 동일하게 `./install.sh`를 사용할 수 있습니다.

### 수동 설치 (모든 OS)

스크립트 없이 설치하려면 `security-skill/` 폴더를 통째로 아래 위치에 복사하세요.

- macOS / Linux: `~/.claude/skills/security-skill/`
- Windows: `%USERPROFILE%\.claude\skills\security-skill\`

### 설치 후

새 Claude Code 세션을 시작하면 `/security-skill` 명령으로 사용할 수 있습니다.
(이미 실행 중인 세션에는 새로 추가된 스킬이 보이지 않으므로 세션을 다시 시작하세요.)

## 사용법

- 전체 감사: `/security-skill`
- 부분 감사: `/security-skill <module>` (예: `/security-skill arch`, `/security-skill input`)

모듈 키워드는 [`security-skill/SKILL.md`](security-skill/SKILL.md)의 표를 참고하세요.

## Best Practices

이 스킬이 가장 정확하게 동작하는 코드베이스 조건은
[`security-skill/README.md`](security-skill/README.md)의 *Best Practices* 섹션을 참고하세요.

## License

MIT — see [LICENSE](LICENSE).
