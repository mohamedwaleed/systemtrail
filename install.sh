#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  bash install.sh global [codex|cursor|claude|devin|all]
  bash install.sh repo /path/to/repo [codex|cursor|claude|devin|all]

Defaults to codex. Codex, Cursor, and Devin share .agents/skills.
Global installs link to this checkout. Repo installs copy skill folders.
EOF
}

case ${1:-} in
  -h|--help) usage; exit 0 ;;
  global)
    if [[ $# -gt 2 ]]; then usage >&2; exit 2; fi
    scope=global
    root=${HOME:?HOME must be set for a global install}
    agent=${2:-codex}
    ;;
  repo)
    if [[ $# -lt 2 || $# -gt 3 || ! -d $2 ]]; then
      usage >&2
      exit 2
    fi
    scope=repo
    root=$(cd -- "$2" && pwd -P)
    agent=${3:-codex}
    ;;
  *) usage >&2; exit 2 ;;
esac

case $agent in
  codex|cursor|devin) destinations=("$root/.agents/skills") ;;
  claude) destinations=("$root/.claude/skills") ;;
  all) destinations=("$root/.agents/skills" "$root/.claude/skills") ;;
  *) usage >&2; exit 2 ;;
esac

source_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.agents/skills" && pwd -P)
skills=(system-cartographer feature-tracer architecture-impact-reviewer codebase-reorientation)

for skill in "${skills[@]}"; do
  if [[ ! -f "$source_root/$skill/SKILL.md" ]]; then
    printf 'Missing source skill: %s\n' "$source_root/$skill/SKILL.md" >&2
    exit 1
  fi
done

same_install() {
  local source=$1 target=$2
  if [[ $scope == global ]]; then
    [[ -L $target && $(readlink "$target") == "$source" ]]
  else
    [[ -d $target && ! -L $target ]] && diff -qr "$source" "$target" >/dev/null
  fi
}

# Check every destination before making changes.
for destination in "${destinations[@]}"; do
  for directory in "${destination%/*}" "$destination"; do
    if [[ ( -e $directory || -L $directory ) && ! -d $directory ]]; then
      printf 'Expected a directory at %s\n' "$directory" >&2
      exit 1
    fi
  done
  for skill in "${skills[@]}"; do
    target="$destination/$skill"
    if [[ -e $target || -L $target ]] && ! same_install "$source_root/$skill" "$target"; then
      printf 'Existing skill differs at %s. Move it aside or merge the changes before rerunning.\n' "$target" >&2
      exit 1
    fi
  done
done

for destination in "${destinations[@]}"; do
  mkdir -p "$destination"
  for skill in "${skills[@]}"; do
    source="$source_root/$skill"
    target="$destination/$skill"
    if same_install "$source" "$target"; then
      printf 'Already installed: %s\n' "$target"
    elif [[ $scope == global ]]; then
      ln -s "$source" "$target"
      printf 'Linked: %s\n' "$target"
    else
      cp -R "$source" "$target"
      printf 'Copied: %s\n' "$target"
    fi
  done
done
