#!/usr/bin/env bash
# Copy upstream skill folders into plugins/. Re-run any time; it mirrors upstream exactly.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

# repo | path in repo | destination under plugins/
MAPPINGS=(
  "emilkowalski/skills|skills/apple-design|apple-design/skills/apple-design"
  "emilkowalski/skills|LICENSE|apple-design/LICENSE"
  "Yuan1z0825/nature-skills|skills/nature-figure|nature-figure/skills/nature-figure"
  "Yuan1z0825/nature-skills|skills/nature-shared|nature-figure/skills/nature-shared"
  "Yuan1z0825/nature-skills|LICENSE|nature-figure/LICENSE"
  "Adkid-Zephyr/anti-defensive-writing-Skill|skills/anti-defensive-writing-en|anti-defensive-writing/skills/anti-defensive-writing-en"
  "Adkid-Zephyr/anti-defensive-writing-Skill|LICENSE|anti-defensive-writing/LICENSE"
)

for m in "${MAPPINGS[@]}"; do
  IFS='|' read -r repo src dst <<<"$m"
  dir="$TMP/${repo//\//_}"
  [ -d "$dir" ] || git clone -q --depth 1 "https://github.com/$repo.git" "$dir"
  if [ -d "$dir/$src" ]; then
    mkdir -p "$ROOT/plugins/$dst"
    rsync -a --delete --exclude .git "$dir/$src/" "$ROOT/plugins/$dst/"
  else
    mkdir -p "$(dirname "$ROOT/plugins/$dst")"
    cp "$dir/$src" "$ROOT/plugins/$dst"
  fi
done
