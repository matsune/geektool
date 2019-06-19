#!/bin/sh
echo "
tell application \"Spotify\"
  return \"\xEF\xA2\x85 \" & current track's name
end tell
" | osascript - 
