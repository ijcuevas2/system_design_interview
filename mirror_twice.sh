#!/usr/bin/env bash
#
# mirror_twice.sh — Mirror an image, then mirror it again, overwriting
# the original file in place both times. No new files are created;
# by the end, the file is restored to its original orientation.
#
# Usage:
#   ./mirror_twice.sh [-v] <path-to-image>
#
#   -v   Mirror vertically (top<->bottom) instead of the default
#        horizontal (left<->right) mirror.
#
# WARNING: this overwrites the image in place and keeps no backup.
# Make your own copy first if you need to preserve the original file.
#
# Requires ImageMagick (the "mogrify" command).

set -euo pipefail

usage() {
    echo "Usage: $0 [-v] <path-to-image>" >&2
    exit 1
}

flip_flag="-flop"   # horizontal mirror (left<->right) by default
axis="horizontal"

while getopts ":v" opt; do
    case "$opt" in
        v) flip_flag="-flip"; axis="vertical" ;;   # top<->bottom
        *) usage ;;
    esac
done
shift $((OPTIND - 1))

[[ $# -eq 1 ]] || usage
input_file=$1

[[ -f "$input_file" ]] || { echo "Error: '$input_file' not found." >&2; exit 1; }

if command -v mogrify &>/dev/null; then
    im=(mogrify)
elif command -v magick &>/dev/null; then
    im=(magick mogrify)
else
    echo "Error: ImageMagick is required but not installed." >&2
    echo "Install it with: sudo apt install imagemagick" >&2
    exit 1
fi

echo "Mirror axis: $axis"

echo "Step 1: mirroring '$input_file' in place"
"${im[@]}" "$flip_flag" "$input_file"

echo "Step 2: mirroring '$input_file' in place again"
"${im[@]}" "$flip_flag" "$input_file"

echo "Done. '$input_file' has been overwritten and is back to its original orientation."
