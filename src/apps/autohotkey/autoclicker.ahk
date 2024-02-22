#MaxThreadsPerHotkey 3

^z::
Toggle := !Toggle

Loop
{
	If (!Toggle)
		Break
	Sendinput {Click down}
  Sleep 5
  Sendinput {Click up}
	Sleep 5 ; Make this number higher for slower clicks, lower for faster.
}

Escape::ExitApp

Return