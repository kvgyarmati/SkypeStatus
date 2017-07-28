#persistent
#NoTrayIcon
#NoEnv

; ##########################################################
; #                                                        #
; #  This script is to update skype's status bar           #
; #                                                        #
; ##########################################################


global currentDateShort
global scheduledTime = "~ 0630 - 1500 EDT: " ; will setup a change function for this later

FormatTime, currentDateShort, MMDD, MM/dd
MsgBox, Today is %currentDateShort%
MsgBox, %currentDateShort% %scheduledTime%

Goto, statusUpdate

statusUpdate:
IfWinActive, Skype for Business, Skype for Business
{
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  gosub, statusOptionPick
}
else
{
  WinActivate, Skype for Business
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  gosub, statusOptionPick
}
return

statusOptionPick:


;statusOption:
;If (stOp = "2")
;{
;  %currentDateShort% %scheduledTime%: on break
;  send {tab}
;  send {space}
;  e
;  return
;} elseif (stOp = "1") {
  ;%currentDateShort% %scheduledTime%: at lunch
;  send {tab}
;  send {space}
;  e
;  return
;} elseif (stOp = "3") {
;  %currentDateShort% %scheduledTime%:
;  send {tab}
;  send {space}
;  b
;  return
;} elseif (stOp = "4") {
;  %currentDateShort% %scheduledTime%: CL CMA
;  send {tab}
;  send {space}
;  b
;  return
;}
