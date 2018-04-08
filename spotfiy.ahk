; Control+Shift+Win+F4
^+#F4:: AddSongToMyLibrary()


AddSongToMyLibrary() {
  spotify := "ahk_class Chrome_WidgetWin_0"
  IfWinExist %spotify%
  {
    ; Store starting window ID and mouse position.
    MouseGetPos x, y, startingWinId

    ; Activate Spotify.
    WinActivate %spotify%
    WinWaitActive %spotify%
    
    ; Search for the plus button in the bottom left corner of the app.
    WinGetPos,  ,  ,  , spotifyHeight, %spotify%
    if (spotifyHeight < 100) {
      ; Spotify's latest update really did something strange, Hard code the height
      spotifyHeight := A_ScreenHeight - 40
    }
    
    topLeftX := 0
    topLeftY := spotifyHeight - 90
    bottomRightX := 250
    bottomRightY := spotifyHeight
    saveToYourLibraryIcon = %A_WorkingDir%\SaveToYourLibraryIcon.png

    ImageSearch FoundX, FoundY, topLeftX, topLeftY, bottomRightX, bottomRightY, %saveToYourLibraryIcon%
    If (ErrorLevel = 0) {
      Click %FoundX%, %FoundY%
    } else if (ErrorLevel = 2) {
      MsgBox Could Not Search
    } else if (ErrorLevel = 1) {
      MsgBox Could Not Find
    }

    ; Restore original window and mouse position.
    WinActivate ahk_id %startingWinId%
    MouseMove %x%, %y%
  }
}