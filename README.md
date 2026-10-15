# zihao-skills

A personal Claude Code plugin marketplace that wraps skill repos which don't ship
their own `.claude-plugin/marketplace.json`. Each entry points at the upstream repo
with no pinned version, so installs track upstream commits.

| Plugin | Upstream | Skill loaded |
|---|---|---|
| `apple-design` | [emilkowalski/skills](https://github.com/emilkowalski/skills) `skills/apple-design` | apple-design |
| `nature-figure` | [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) `skills/` | nature-figure only (nature-shared files are fetched alongside for its `../nature-shared/` references) |

## Install

```bash
claude plugin marketplace add zihaofeng2001/zihao-skills
claude plugin install apple-design@zihao-skills
claude plugin install nature-figure@zihao-skills
```

Auto-update is off by default for third-party marketplaces. Turn it on in
`/plugin` → Marketplaces → zihao-skills → Enable auto-update.
