# Secure Code Audit Skill

## Purpose
Enterprise security review skill for Claude Code/Codex.

## Usage

### Full audit (모든 모듈 실행)
`/security-skill`

### Partial audit (특정 모듈만 실행)
`/security-skill <module>`

| module 키워드 | 실행 파일 |
|---|---|
| `arch` | 01_architecture_review.md |
| `input` | 02_input_validation.md |
| `auth` | 03_authentication.md |
| `idor` | 04_authorization_idor_bola.md |
| `upload` | 05_file_upload.md |
| `api` | 06_api_security.md |
| `ai` | 07_ai_agent_security.md |
| `drive` | 08_google_drive_security.md |
| `slack` | 09_slack_security.md |
| `obsidian` | 10_obsidian_security.md |
| `railway` | 11_railway_security.md |

예시: `/security-skill input` → Input Validation 체크리스트만 실행

## Workflow

If a module keyword is provided, load and apply only that module's checklist file, then report findings using the template in 12_report_template.md.

If no keyword is provided:
1. Analyze architecture (01)
2. Enumerate attack surface
3. Run all checklists (02–11)
4. Report PASS/VULNERABLE/NEEDS_REVIEW using 12_report_template.md
5. Suggest fixes
