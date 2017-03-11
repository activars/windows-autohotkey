; Autohotkey script to translate some Mac shortcuts for Windows
; Use ScrollLock key to temporary activate / descativate the current script, in case of get some trouble

#UseHook
#InstallKeybdHook

SC056::`
+SC056::~

LWin & a::Send {LCtrl Down}{a}{LCtrl Up}
LWin & b::Send {LCtrl Down}{b}{LCtrl Up}
LWin & c::Send {LCtrl Down}{c}{LCtrl Up}
LWin & d::Send {LCtrl Down}{d}{LCtrl Up}
LWin & e::Send {LCtrl Down}{e}{LCtrl Up}
LWin & g::Send {LCtrl Down}{g}{LCtrl Up}
LWin & h::Send {LCtrl Down}{h}{LCtrl Up}
LWin & i::Send {LCtrl Down}{i}{LCtrl Up}
LWin & j::Send {LCtrl Down}{j}{LCtrl Up}
LWin & k::Send {LCtrl Down}{k}{LCtrl Up}

;LWin & f::Send {LCtrl Down}{f}{LCtrl Up}
LWin & f::
GetKeyState, ShiftState, Shift, P
if (ShiftState == "D")
  Send {LCtrl Down}+{f}{LCtrl Up}
else
  Send {LCtrl Down}{f}{LCtrl Up}
return

LWin & m::Send {LCtrl Down}{m}{LCtrl Up}

;If Desktop or Explorer active, Alt+Shift+n create a new folder and Alt+N open an new window
LWin & n::
GetKeyState, ShiftState, Shift, P
if (ShiftState == "D") and (WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass"))
  Send !fn{enter} ; Folder is in first so Send enter directly else other type of document will be selected
else if (ShiftState == "U" and (WinActive("ahk_class Progman") or WinActive("ahk_class ExploreWClass") or WinActive("ahk_class CabinetWClass")))
  Run explorer
else if (ShiftState == "D")
  Send {LCtrl Down}+{n}{LCtrl Up}
else
  Send {LCtrl Down}{n}{LCtrl Up}
return

LAlt & s::Send {ß}

LAlt & u::
  input, command, L1 ; L3 to limit the input to 2 keys
  if (GetKeyState("Shift", "P")) {
    if (command = "a") {
      Send Ä
    } else if (command = "o") {
      Send Ö
    } else if (command = "u") {
      Send Ü
    }
  } else {
    if (command = "a") {
      Send ä
    } else if (command = "o") {
      Send ö
    } else if (command = "u") {
      Send ü
    }
  }
return

LWin & o::Send {LCtrl Down}{o}{LCtrl Up}
LWin & p::Send {LCtrl Down}{p}{LCtrl Up}
LWin & q::Send {LCtrl Down}{q}{LCtrl Up}
;LWin & r::Send {LCtrl Down}{r}{LCtrl Up};
LWin & r::
GetKeyState, ShiftState, Shift, P
if (ShiftState == "D")
  Send {LCtrl Down}+{r}{LCtrl Up}
else
  Send {LCtrl Down}{r}{LCtrl Up}
return

LWin & s::Send {LCtrl Down}{s}{LCtrl Up}
LWin & t::Send {LCtrl Down}{t}{LCtrl Up}

;LWin & u::Send {LCtrl Down}{u}{LCtrl Up}
;LWin & v::Send {LCtrl Down}{v}{LCtrl Up}
LWin & v::
  if (WinActive("ahk_class ConsoleWindowClass")) {
    SendInput {Raw}%clipboard%
  } else {
    GetKeyState, ShiftState, Shift, P
    if (ShiftState == "D") {
      Send {LCtrl Down}+{v}{LCtrl Up}
    } else {
      Send {LCtrl Down}{v}{LCtrl Up}
    }
  }
return

LWin & w::Send {LCtrl Down}{w}{LCtrl Up}
LWin & x::Send {LCtrl Down}{x}{LCtrl Up}
LWin & y::
  GetKeyState, ShiftState, Shift, P
  if (ShiftState == "D") {
    Send {LCtrl Down}+{y}{LCtrl Up}
  } else {
    Send {LCtrl Down}{y}{LCtrl Up}
  }
return

LWin & z::
GetKeyState, ShiftState, Shift, P
  if (ShiftState == "D") {
    Send {LCtrl Down}+{z}{LCtrl Up}
  } else {
    Send {LCtrl Down}{z}{LCtrl Up}
  }
return


LWin & 7::
  GetKeyState, ShiftState, Shift, P
  if (ShiftState == "D") {
    Send {LAlt Down}{&}{LAlt Up}
  } else {
    Send {LAlt Down}{7}{LAlt Up}
  }
return

; Explorer -> delete file
LWin & BS::Send {Del}

; OSX NAVIGATION AND SELECTION WITH CMD
#Up::Send {ctrl down}{Home}{ctrl up}
#Down::Send {ctrl down}{End}{ctrl up}
#+Up::Send {ctrl down}{shift down}{Home}{shift up}{ctrl up}
#+Down::Send {ctrl down}{shift down}{End}{shift up}{ctrl up}
#Left::Send {Home}
#Right::Send {End}
#+Left::Send {shift down}{Home}{shift up}
#+Right::Send {shift down}{End}{shift up}


; OSX NAVIGATION AND SELECTION WITH ALT
!Left::Send {ctrl down}{Left}{ctrl up}
!Right::Send {ctrl down}{Right}{ctrl up}
!+Left::Send {ctrl down}{shift down}{Left}{shift up}{ctrl up}
!+Right::Send {ctrl down}{shift down}{Right}{shift up}{ctrl up}

; OSX Switch Desktop Workspace
; ctrl + left/right => map to => Ctrl + Win + left/right

LCtrl & Left::Send {LWin down }{LCtrl down}{Left}{LWin up}{LCtrl up}
LCtrl & Right::Send {LWin down }{LCtrl down}{Right}{LWin up}{LCtrl up}

; DISABLES UNMODIFIED WIN-KEY IN FAVOR OF OSX SPOTLIGHT-LIKE BEHAVIOR
LWin::return
RWin::return
#Space::LWin


; REPLACES ALT-TAB APPLICATION SWITCHING WITH OSX CMD-TAB
LWin & Tab::AltTab
!Tab::return

; Explorer: Jump to parent dir
LWin & Up::
 GetKeyState, ShiftState, Shift, P
  if (ShiftState == "D") {
    Send {LAlt down}+{Up}{LAlt up}
  } else {
    Send {LAlt down}{Up}{LAlt up}
  }
return

LWin & Down::
 GetKeyState, ShiftState, Shift, P
  if (ShiftState == "D") {
    Send {LAlt down}+{Down}{LAlt up}
  } else {
    Send {LAlt down}{Down}{LAlt up}
  }
return


; **********
; Greenshot
; **********

LWin & 4::
 GetKeyState, ShiftState, Shift, P
  if (ShiftState == "D") {
    Send {PrintScreen}
  } else {
    Send {4}
  }
return


; ************
;   IntelliJ
; ************
; self defined keymap for IntelliJ 'VCS Operations Popup'

#If WinActive("ahk_exe" "idea.exe")
  LWin & \::Send {LAlt Down}{\}{LAlt Up}
  ^#F7::Send {LCtrl down}{LAlt down}{F7}{LAlt up}{LCtrl up}
  LWin & F8::Send {LAlt Down}{F8}{LAlt Up}

  ;Inline Comments
  LWin & /::Send {LCtrl Down}}{/}{LCtrl Up} 

  ; IJ Organize Imports
  LCtrl & o::
    if (GetKeyState("LWin", "P")) {
      Send {LCtrl Down}{LAlt Down}{o}{LAlt Up}{LCtrl Up}
    } else {
      Send {LCtrl Down}{o}{LCtrl Up}
    }
  return

  ; import methods
  LWin & Enter::Send {LAlt down}{Enter}{LAlt up}

  ; private snagit shortcut
  LWin & 4::
   GetKeyState, ShiftState, Shift, P
    if (ShiftState == "D") {
      Send {LAlt down}+{4}{LAlt up}
    } else {
      Send {LAlt down}{4}{LAlt up}
    }
  return
#If


; #############
; Sublime Text
; #############
#If WinActive("ahk_exe" "sublime_text.exe")
  LWin & /::Send {LCtrl Down}{/}{LCtrl Up}
  LCtrl & Up::
    if (GetKeyState("LWin", "P")) {
      Send {LShift down}{LCtrl down}+{up}{LShift up}{LCtrl up}
    } else {
      Send {LShift down}{LCtrl down}{up}{LShift up}{LCtrl up}
    }
  return

  LCtrl & Down::
    if (GetKeyState("LWin", "P")) {
      Send {LShift down}{LCtrl down}+{down}{LShift up}{LCtrl up}
    } else {
      Send {LShift down}{LCtrl down}{down}{LShift up}{LCtrl up}
    }
  return

  LWin & p::
    GetKeyState, ShiftState, Shift, P
    if (ShiftState == "D") {
      Send {LShift down}{LCtrl down}+{p}{LShift up}{LCtrl up}
    } else {
      Send {LShift down}{LCtrl down}{p}{LShift up}{LCtrl up}
    }
  return
  
  LWin & t::Send {LCtrl down}{p}{LCtrl up}
  LWin & [::Send {LCtrl down}{[}{LCtrl up}
  LWin & ]::Send {LCtrl down}{]}{LCtrl up}
#if


; #############
; Chrome
; #############
#If WinActive("ahk_exe" "chrome.exe")
  LWin & t::
    GetKeyState, ShiftState, Shift, P
    if (ShiftState == "D") {
      Send {LShift down}{LCtrl down}+{t}{LShift up}{LCtrl up}
    } else {
      Send {LCtrl down}{t}{LCtrl up}
    }
  return

  LWin & i::
    GetKeyState, ShiftState, Shift, P
    if (ShiftState == "D") {
      Send {LShift down}{LCtrl down}+{i}{LShift up}{LCtrl up}
    } else {
      Send {LShift down}{LCtrl down}{i}{LShift up}{LCtrl up}
    }
  return
#if


;##########
;ConsoleZ2 Mapping to iTerm shortcut
;##########

#If WinActive("ahk_exe" "Console.exe")
  ; new tab
  LWin & t::Send {LCtrl down}{f1}{LCtrl up}

  ; switch next
  LWin & ]::
    GetKeyState, ShiftState, Shift, P
    if (ShiftState == "D") {

      ; switch to next tab
      Send {LCtrl down}+{Tab}{LCtrl up}
    } else {

      ; switch to next view
      Send {LCtrl down}{PgDn}{LCtrl up}
    }
  return

  ; switch to previous
  LWin & [::
    GetKeyState, SiftState, Shift, P
    if (ShiftState == "D") {

      ; switch to previous tab
      Send {LCtrl down}{LShift down}+{Tab}{LCtrl up}{LShift up}
    } else {

      ; switch previous view
      Send {LCtrl down}{PgUp}{LCtrl up}
    }
  return

  LWin & d::
    GetKeyState, SiftState, Shift, P
    if (ShiftState == "D") {
      ; Split Windows Horizontally
      Send {LCtrl down}{LShift down}{o}{LShift up}{LCtrl up}
    } else {
      ; Split Windows Vertically
      Send {LCtrl down}{LShift down}{e}{LShift up}{LCtrl up}
    }
  return 
#If

