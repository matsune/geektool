#!/bin/sh


if [ $(ps aux | grep Spotify | grep -v grep | wc -l) -lt 1 ]; then
  echo Not Running
  exit 0
fi


function playing() {
  local RES=`echo "
    tell application \"Spotify\"
      if player state is playing then
        return \"\xEF\x85\x84\"
      else
        return \"\xEF\x8A\x8B\"
      end if
    end tell
  " | osascript -`
  echo "$RES \c"
}
playing

function position() {
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
}
position

function track_name() {
  echo "
    tell application \"Spotify\"
      return \"\xEF\xA2\x85 \" & current track's name
    end tell
  " | osascript - 
}
track_name

function artist() {
  echo "
    tell application \"Spotify\"
      return \"\xEF\x94\x88 \" & current track's artist
    end tell
  " | osascript - 
}
artist

function album() {
  echo "
    tell application \"Spotify\"
      return \"\xEF\x94\xA4 \" & current track's album
    end tell
  " | osascript - 
}
album

function volume() {
  echo "
    tell application \"Spotify\"
      return \"\xEF\xA9\xBD \" & sound volume
    end tell
  " | osascript -
}
volume

