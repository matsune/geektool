#!/bin/sh
echo "
tell application \"Spotify\"
  if player state is playing then
    return \"\xEF\x85\x84\"
  else
    return \"\xEF\x8A\x8B\"
  end if
end tell
" | osascript - 
