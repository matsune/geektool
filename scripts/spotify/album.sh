#!/bin/sh
echo "
tell application \"Spotify\"
  return \"\xEF\x94\xA4 \" & current track's album
end tell
" | osascript - 
