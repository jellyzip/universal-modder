#!/usr/bin/env bash
# SessionStart hook: put universal-modder's bin/ on PATH for every later Bash call in the session,
# so skills can just say `um ...`. Arg 1: the toolkit root (plugin root or the cloned repo).
root="${1:-${CLAUDE_PLUGIN_ROOT:-${CLAUDE_PROJECT_DIR:-}}}"
[ -n "$root" ] && [ -n "${CLAUDE_ENV_FILE:-}" ] && [ -x "$root/bin/um" ] || exit 0
grep -qs "universal-modder-path" "$CLAUDE_ENV_FILE" && exit 0
printf 'export PATH="%s/bin:$PATH"  # universal-modder-path\n' "$root" >> "$CLAUDE_ENV_FILE"
exit 0
