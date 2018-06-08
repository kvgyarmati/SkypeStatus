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
global scheduledTime = "~ 0830 - 1700 EDT: " ; will setup a change function for this later
global currentTimeZone = "EDT"
global TimeZoneLow = "MST"




; ##########################################################
; #                                                        #
; #  Editing ToDos   -       2/20/18                       #
; #                                                        #
; #   1) Allowing for time saving                          #
; #      a) %scheduledTime%                                #
; #      b) Pushing calc timeZone into time.ini file       #
; #                                                        #
; #                                                        #
; #                                                        #
; #                                                        #
; #                                                        #
; #                                                        #
; ##########################################################

;Goto, TestTimeZone

;TestTimeZone: ; # Sets up pull from Host for the Full length time zone name
;RegREad, TimeZone, HKEY_LOCAL_MACHINE, SYSTEM\ControlSet001\Control\TimeZoneInformation, TimeZoneKeyName
; MsgBox, %TimeZone%

;if (TimeZone = "Eastern Standard Time")
;  {
;    TimeZoneLow = EST
;  }
;else if (TimeZone = "Eastern Daylight Time")
;  {
;    TimeZoneLow = EDT
;  }
;Goto, Main

; ##############################################################################

;TimeSet:

;If ()

;InputBox, scheduledTime, Scheduled Time of Work, Please enter your scheduled time of work - this will be saved to a settings file.

; ##############################################################################
; #   time ini push saved
; ##############################################################################

;dfltsk:
;Run data\dfltskills.exe
;Return




; ##############################################################################
; #   time ini read saved
; ##############################################################################

;pos:
;Process Exist, pos.exe
;PID := ErrorLevel
;If %PID% = 0
;{
;Run data/pos.exe
;Menu, skillz, ToggleCheck, POS
;}
;else
;{
;Process Close, pos.exe
;Menu, skillz, uncheck, POS
;}
;Return

;sco:
;Process Exist, sco.exe
;PID := ErrorLevel
;If %PID% = 0
;{
;Run data/sco.exe
;Menu, skillz, ToggleCheck, SCO
;}
;else
;{
;Process Close, sco.exe
;Menu, skillz, uncheck, SCO
;}
;Return

;clst:
;Process Exist, clst.exe
;PID := ErrorLevel
;If %PID% = 0
;{
;Run data/clst.exe
;Menu, skillz, ToggleCheck, ClickList
;}
;else
;{
;Process Close, clst.exe
;Menu, skillz, uncheck, ClickList
;}
;Return




; ##############################################################################

; Main:
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
Gui, 5:Add, Text, y10, Please enter which option in lowercase `n (L - Lunch, B - Break, C - CMA, `n M - Meeting, N - Normal, T - Training, `n D - Documentation, AFK - Away From Keyboard, `n BRB - Be Right Back, DND - Do Not Disturb, `n A - Available [sub-Status only], O - Off Work [ss only], H - Busy [ss only] ):
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
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send @lunch - %currentDateShort% %scheduledTime%
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send e
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "b")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send on break - %currentDateShort% %scheduledTime%
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send e
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "c")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime% CMA
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send b
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "m")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime% in a meeting
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send b
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "n")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime%
;  Send %TimeZoneLow% ~ This was testing for the above timezone setter.
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send v
  WinMinimize, Skype for Business
  return
}else If (strid5 = "t")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime% Training today
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send b
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "d")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send %currentDateShort% %scheduledTime% Working on Documentation
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send b
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "afk")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send AFK -- %currentDateShort% %scheduledTime%
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send e
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "brb")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs to status bar - MS -16 , 5 tabs for MSO16+
  send {tab}
  send {tab}
  send {tab}
  send {tab}
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2} ; clears line
  Send brb -- %currentDateShort% %scheduledTime%
  Send {tab} ; 1 tab to status mode MS -16, 2 tab for MSO16
  Send {tab}
  Send {space}
  Send e ; sub-Status BRB
  WinMinimize, Skype for Business
  return
}
else If (strid5 = "a")
{
  WinActivate, Skype for Business
  send {tab} ; 9 tabs if MS -16 , 7 MSO16
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
  send {tab} ; 9 tabs if MS -16 , 7 MSO16
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
  send {tab} ; 9 tabs if MS -16 , 7 MSO16
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
