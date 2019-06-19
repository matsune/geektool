#!/bin/sh
echo "
tell application \"Spotify\"
  return \"\xEF\xA7\x82 \" & sound volume
end tell
" | osascript -
