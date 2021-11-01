#Include IME.ahk

; for Microsoft Teams
; 改行        : Enter        => Shift + Enter
; チャット送信 : Ctrl + Enter => Enter
#IfWinActive, ahk_exe Teams.exe
  Enter::
    if IME_GetConverting() >= 1 {
      send,{Enter}
    } else {
      send,+{Enter}
    }
    Return

  ^Enter::
    if IME_GetConverting() >= 1 {
      send,^{Enter}
    } else {
      send,{Enter}
    }
    Return

;;  Space::
;  if IME_GetConverting() >= 1 {
;    send,{Tab}
;  } else {
;    send,{Space}
;  }
;  Return

#IfWinActive

;; Ctrl + LAlt + ;  => 西暦日付 yyyyMMdd
;^!;::
;FormatTime, now,, yyyyMMdd
;Clipboard = %now%
;Send,^v
;Clipboard =
;return

; 無変換キー利用
;vk1D & i::Send,{Up}
;vk1D & j::Send,{Left}
;vk1D & k::Send,{Down}
;vk1D & l::Send,{Right}

; 変換キー利用
vk1C & i::
  If GetKeyState("LAlt", "P")       ; 一つ上のフォルダ
    Send,!{Up}
  Else If GetKeyState("LWin", "P")  ; ウィンドウ最大化
    WinMaximize, A
  Else If GetKeyState("Shift", "P") ; Shift + ↑
    Send,+{Up}
  Else
    Send,{Up}
Return

vk1C & j::
  If GetKeyState("Ctrl", "P")      ; 左隣タブ
    Send,^{Left}
  Else If GetKeyState("Shift", "P") ; Shift + ←
    Send,+{Left}
  Else
    Send,{Left}
Return

vk1C & k::
  If GetKeyState("LWin", "P")      ; ウィンドウサイズ元に戻す or 最小化
    {  
       WinGet, tmp, MinMax, A
       If tmp = 1  ; 0:通常 1:最大化 -1:最小化
         WinRestore, A
       Else
         WinMinimize, A
    }
  Else If GetKeyState("Shift", "P") ; Shift + ↓
    Send,+{Down}
  Else
    Send,{Down}
Return

vk1C & l::
  If GetKeyState("Ctrl", "P")      ; 右隣タブ
    Send,^{Right}
  Else If GetKeyState("Shift", "P") ; Shift + →
    Send,+{Right}
  Else
    Send,{Right}
Return

vk1C & u::
  If GetKeyState("Lwin", "P")      ;ウィンドウ左寄せ
    Send,#{Left}
  Else
    Send,{Home} 
Return

vk1C & o::
  If GetKeyState("Lwin", "P")      ;ウィンドウ右寄せ
    Send,#{Right}
  Else
    Send,{End} 
Return

; 変換 + 無変換の複合

; かな変換
!space::
  if IME_GET() >= 1 {
    IME_SET(0)
  } else {
    IME_SET(1)
  }
  Return

; 無効化
vk1D::Return
ScrollLock::Return
Insert::Return
