; Control+Shift+Win+F4
^+#F4:: AddSongToMyLibrary()
^+F1:: F_Switch("explorer.exe", "ahk_class CabinetWClass", "F_Explorers")
^+F3:: F_Switch("OUTLOOK.EXE", "ahk_class rctrl_renwnd32", "F_OUTLOOK")

; This is bad, Electron... WHAI
; TODO: Re-write F_Switch to handle this BS
^+F2:: F_Switch("Code - Insiders.exe", "ahk_class Chrome_WidgetWin_1", "F_VSCode")
^+F4:: F_Switch("slack.exe", "ahk_class Chrome_WidgetWin_1", "F_SLACK")
