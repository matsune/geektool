#!/bin/sh
echo "
tell application \"Spotify\"
  return \"\xEF\x94\x88 \" & current track's artist
end tell
" | osascript - 
