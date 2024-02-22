; Allows for control + t to open a new window in the current directory
#IfWinActive, ahk_exe WindowsTerminal.exe
  ^t::
    Send, setCWD {enter}
    Send, ^t