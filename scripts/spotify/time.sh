#!/bin/sh

echo "
on to_mm_ss(sec)
  set mm to sec div 60
  set ss to sec mod 60
  if ss < 10 then
    set ss to "0" & ss
  end if
  set t to mm as string & \":\" & ss as string
  return t
end to_mm_ss

on bar(percent)
  set n to round(percent / 0.1) rounding up
  set s to \"\"
  repeat n times
    set s to s & \"■\"
  end repeat
  repeat 10 - n times
    set s to s & \" \"
  end repeat
  return s
    
end bar

tell application \"Spotify\"
  set pos_sec to player position as integer
  set len_sec to round ((the duration of the current track) / 1000) rounding down
  set percent to pos_sec / len_sec
  return my to_mm_ss(pos_sec) & my bar(percent) & my to_mm_ss(len_sec)
end tell
" | osascript - 
