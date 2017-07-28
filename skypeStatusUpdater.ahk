#persistent
#NoTrayIcon
#NoEnv
#SingleInstance, force

; ##########################################################
; #                                                        #
; #  This script is to update skype's status bar           #
; #                                                        #
; ##########################################################


global currentDateShort
global scheduledTime = "~ 0630 - 1500 EDT: " ; will setup a change function for this later

FormatTime, currentDateShort, MMDD, MM/dd
Goto, statusUpdate

statusUpdate:
IfWinActive, Skype for Business, Skype for Business
{
  gosub, statusOptionPick
}
else
{
  WinActivate, Skype for Business
  gosub, statusOptionPick
}
return

statusOptionPick:
Gui, 5:Destroy
Gui,+AlwaysOnTop -sysmenu
Gui, 5:Add, Text, y10, Please enter which option in lowercase `n (L - Lunch, B - Break, C - CMA, `n M - Meeting, N - Normal, T - Training, `n AFK - Away From Keyboard, BRB - Be Right Back, DND - Do Not Disturb, `n A - Available [sub-Status only], O - Off Work [ss only], H - Busy [ss only] ):
Gui, 5:Add, Edit, x180 y125 w120 h20 vstrid5
Gui, 5:Add, Button, x180 y150 default gsubmit5, &SUBMIT
Gui, 5:Add, Button, x110 y150 gcancel5, &CANCEL
Gui, 5:Show, , Connect to TUNA/Larry
return

submit5:
gui, 5:submit
If (strid5 = "l")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send @lunch - %currentDateShort% %scheduledTime%
  Send {tab}
  Send {space}
  Send e
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "b")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send on break - %currentDateShort% %scheduledTime%
  Send {tab}
  Send {space}
  Send e
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "c")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime% CMA
  Send {tab}
  Send {space}
  Send b
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "m")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime% in a meeting
  Send {tab}
  Send {space}
  Send b
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "n")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime%
  Send {tab}
  Send {space}
  Send v
  WinMinimize, Skype for Business
  return
}else If (strid5 = "t")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime% Training today
  Send {tab}
  Send {space}
  Send b
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "afk")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send AFK -- %currentDateShort% %scheduledTime%
  Send {tab}
  Send {space}
  Send e
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "brb")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send brb -- %currentDateShort% %scheduledTime%
  Send {tab}
  Send {space}
  Send e ; sub-Status BRB
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "a")
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
  Send {space}
  Send v ; sub-Status Available
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "o")
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
  Send {space}
  Send w ; sub-Status off work
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "h")
{
  WinActivate, Skype for Business
  send {tab} ; 10 tabs for ss
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {space}
  Send b ; sub-Status Busy
  WinMinimize, Skype for Business
  return
}
else
{
  MsgBox retry, didn't enter what is needed
}

cancel5:
Gui Cancel
return

5GuiEscape:
Gui Cancel
return
