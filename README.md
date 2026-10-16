# zihao-skills

A personal Claude plugin marketplace that mirrors skills from repos which don't
ship their own `.claude-plugin/marketplace.json`.

The plugin files live in this repo (`plugins/`), because claude.ai's
**Customize > Plugins** installs plugins packaged inside the marketplace repo.
A GitHub Action (`.github/workflows/sync-upstream.yml`) runs
`scripts/sync-upstream.sh` daily and commits any upstream changes.

| Plugin | Upstream | Skills |
|---|---|---|
| `apple-design` | [emilkowalski/skills](https://github.com/emilkowalski/skills) (MIT) | apple-design |
| `nature-figure` | [Yuan1z0825/nature-skills](https://github.com/Yuan1z0825/nature-skills) (Apache-2.0) | nature-figure, nature-shared (shared references it reads via `../nature-shared/`) |
| `anti-defensive-writing` | [Adkid-Zephyr/anti-defensive-writing-Skill](https://github.com/Adkid-Zephyr/anti-defensive-writing-Skill) (MIT) | anti-defensive-writing-en (English version only) |

## Install

- Claude desktop / claude.ai: **Customize > Plugins > Add > Add marketplace**, enter
  `zihaofeng2001/zihao-skills`, then add the plugins. Turn on **Sync automatically**.
- Claude Code CLI:

  ```bash
  claude plugin marketplace add zihaofeng2001/zihao-skills
  claude plugin install apple-design@zihao-skills
  claude plugin install nature-figure@zihao-skills
  claude plugin install anti-defensive-writing@zihao-skills
  ```

## Add another skill

Add a line to `MAPPINGS` in `scripts/sync-upstream.sh`, run it, add a
`plugins/<name>/.claude-plugin/plugin.json`, and list the plugin in
`.claude-plugin/marketplace.json`.
