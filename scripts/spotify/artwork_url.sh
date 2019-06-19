#!/bin/sh
echo "
tell application \"Spotify\"
  return current track's artwork url
end tell
" | osascript - 
