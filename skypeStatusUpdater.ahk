#persistent
#NoTrayIcon
#NoEnv

; ##########################################################
; #                                                        #
; #  This script is to update skype's status bar           #
; #                                                        #
; ##########################################################




statusUpdate:
IfWinExist, Skype for Business
{
  WinActive, Skype for Business
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
  gosub, statusOption
}
return

statusOption:
If (stOp = "2")
{
  %currentDateShort% %scheduledTime%: on break
  send {tab}
  send {space}
  e
} elseif (stOp = "1") {
  %currentDateShort% %scheduledTime%: at lunch
  send {tab}
  send {space}
  e
} elseif (stOp = "3") {
  %currentDateShort% %scheduledTime%:
  send {tab}
  send {space}
  b
} elseif (stOp = "4") {
  %currentDateShort% %scheduledTime%: CL CMA
  send {tab}
  send {space}
  b
}
