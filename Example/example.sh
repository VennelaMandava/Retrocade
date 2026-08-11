#!/bin/sh
printf '\033c\033]0;%s\a' example
base_path="$(dirname "$(realpath "$0")")"
"$base_path/example.arm32" "$@"
