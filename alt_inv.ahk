;;;HOW TO SETUP;;; First download and install Autohotkey.com (very simple)
;;;;;Then Create New Autohotkey Script and copy this into the new .AHK file
;;;;;OR simply download this file, rename and erase .ahk.TXT to just .AHK
;;;;;Place in your WC3 folder and create shortcut on desktop
;;;;;Might require right-click and setting to Run as Admin
;;;;;In WC3 press NumLock to pause Script on/off for chat
;;;;;Now your Invetory hotkeys are switched to Alt + QWEASD
;;;;;Also disables WinKey or Alt+QQ from closing your game
;;;;;Any Hotkeys can be modified to your liking at the very bottom
;;;;;If mouse supports extra buttons can be remapped at bottom


#SingleInstance force		;force a single instance
#HotkeyInterval 0		;disable the warning dialog if a key is held down
#InstallKeybdHook		;Forces the unconditional installation of the keyboard hook
#UseHook On			;might increase responsiveness of hotkeys
#MaxThreads 20			;use 20 (the max) instead of 10 threads
SetBatchLines, -1		;makes the script run at max speed
SetKeyDelay , -1, -1		;faster response (might be better with -1, 0)
;Thread, Interrupt , -1, -1	;not sure what this does, could be bad for timers
SetTitleMatchMode Regex
SetDefaultMouseSpeed, 0 ;Move the mouse faster for mouse moving commands

IfExist, Warcraft III.exe
  menu, tray, Icon, Warcraft III.exe, 1, 1

;;;;; Variables ;;;;;
bInChatRoom := False
bHealthBarOn := False
Return ; End Auto-Execute Section

; AutoCast Function
AutoCast(iSpellQWERHotkey)
{
  MouseGetPos, iMousePosX, IMousePosY
  if (iSpellQWERHotkey == 1)
  {
    iMouseGotoX := A_ScreenWidth*4//5
    iMouseGotoY := A_ScreenHeight*4//5
  }
  else if (iSpellQWERHotkey == 2)
  {
    iMouseGotoX := A_ScreenWidth*4//5
    iMouseGotoY := A_ScreenHeight*22//25
  }
  else if (iSpellQWERHotkey == 3)
  {    iMouseGotoX := A_ScreenWidth*4//5
    iMouseGotoY := A_ScreenHeight*19//20
  }
  else if (iSpellQWERHotkey == 4)
  {
    iMouseGotoX := A_ScreenWidth*17//20
    iMouseGotoY := A_ScreenHeight*4//5
  }
  else if (iSpellQWERHotkey == 5)
  {
    iMouseGotoX := A_ScreenWidth*17//20
    iMouseGotoY := A_ScreenHeight*22//25
  }
  else if (iSpellQWERHotkey == 6)
  {
    iMouseGotoX := A_ScreenWidth*17//20
    iMouseGotoY := A_ScreenHeight*19//20
  }
  else if (iSpellQWERHotkey == 7)
  {
    iMouseGotoX := A_ScreenWidth*9//10
    iMouseGotoY := A_ScreenHeight*4//5
  }
  else if (iSpellQWERHotkey == 8)
  {
    iMouseGotoX := A_ScreenWidth*9//10
    iMouseGotoY := A_ScreenHeight*22//25
  }
  else if (iSpellQWERHotkey == 9)
  {
    iMouseGotoX := A_ScreenWidth*9//10
    iMouseGotoY := A_ScreenHeight*19//20
  }
  else if (iSpellQWERHotkey == 10)
  {
    iMouseGotoX := A_ScreenWidth*19//20
    iMouseGotoY := A_ScreenHeight*4//5
  }
  else if (iSpellQWERHotkey == 11)
  {
    iMouseGotoX := A_ScreenWidth*19//20
    iMouseGotoY := A_ScreenHeight*22//25
  }
  else if (iSpellQWERHotkey == 12)
  {
    iMouseGotoX := A_ScreenWidth*19//20
    iMouseGotoY := A_ScreenHeight*19//20
  }
  Click, Right, %iMouseGotoX%, %iMouseGotoY%
  MouseMove, %iMousePosX%, %iMousePosY%
}

#ifWinActive ahk_class ((WarcraftIII)|(OsWindow)|(Qt5QWindowIcon))

;;;;; Enable/disable all hotkeys ;;;;;

;; Escape will cancel chatting, so turn the hotkeys back on
*NumLock::
Suspend, Permit
bInChatRoom := not bInChatRoom
if (bInChatRoom == True)
{
  Suspend, On
  SetNumLockState, Off
  SoundPlay,*64
}
else
{
  Suspend, Off
  SetNumLockState, On
  SoundPlay,*48
}
return


; Hotkeys Remapper:

; Disable Toggles
Lwin::return
<!r::return
<!t::return
<!f::return
;;to enable formation toggle add ;; to the line above

; Inventory Keys:
!q::SendInput, {Numpad7}
+!q::SendInput, +{Numpad7}
!w::SendInput, {Numpad8}
+!w::SendInput, +{Numpad8}
!a::SendInput, {Numpad4}
+!a::SendInput, +{Numpad4}
!s::SendInput, {Numpad5}
+!s::SendInput, +{Numpad5}
!z::SendInput, {Numpad1}
+!z::SendInput, +{Numpad1}
!x::SendInput, {Numpad2}
+!x::SendInput, +{Numpad2}

; Quick Chat Msgs
Numpad1::SendInput, +{Enter}Careful{Enter}
Numpad2::SendInput, +{Enter}Attack{Enter}
Numpad3::SendInput, +{Enter}Focus Units{Enter}
Numpad4::SendInput, +{Enter}Back{Enter}
Numpad5::SendInput, +{Enter}Rush{Enter}
Numpad6::SendInput, +{Enter}Focus Hero{Enter}
Numpad7::SendInput, +{Enter}TP{Enter}
Numpad8::SendInput, +{Enter}Counter{Enter}
Numpad9::SendInput, +{Enter}Fast Expo{Enter}
Numpad0::SendInput, +{Enter}Repair{Enter}

; User Specified Hotkeys:
CapsLock::Send, {Backspace}
+CapsLock::Send, +{Backspace}

Xbutton1::F1
Xbutton2::Numpad7
Mbutton::Tab
; these^ are middle mouse and extra mouse buttons

;;LCtrl::Space
;;Space::LCtrl
;To swap the Ctrl key with the Spacebar just remove the ;; from the 2 lines above