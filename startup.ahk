; Map Ctrl + e to email@hotmail.com
^e::
Send, email@hotmail.com
return

; Map Ctrl + r to password
^q::
Send, password{!}
return

; Map Ctrl + Alt + e to email.rs@gmail.com
^!e::
Send, email.rs@gmail.com
return
;LWin::LButton
; Map Ctrl + Alt + q to passwordtwo
^!q::
Send, passwordtwo
return

; Map Ctrl + Shift + c to open Hyper Terminal
^!c::
Run, C:\Users\Remco\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Hyper
return
GroupAdd, browser, ahk_exe chrome.exe
GroupAdd, browser, ahk_exe firefox.exe
GroupAdd, browser, ahk_exe msedge.exe
GroupAdd, browser, ahk_exe brave.exe
GroupAdd, browser, ahk_exe opera.exe
#IfWinActive ahk_group browser
RButton & WheelUp::Send ^{PgDn} 
RButton & WheelDown::Send ^{PgUp}
#IfWinActive


