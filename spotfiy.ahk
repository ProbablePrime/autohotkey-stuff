; Control+Shift+Win+F4
^+#F4:: AddSongToMyLibrary()


AddSongToMyLibrary() {
  spotify := "ahk_class SpotifyMainWindow"
  IfWinExist %spotify%
  {
    ; Store starting window ID and mouse position.
    MouseGetPos x, y, startingWinId

    ; Activate Spotify.
    WinActivate %spotify%
    WinWaitActive %spotify%

    ; Search for the plus button in the bottom left corner of the app.
    WinGetPos,  ,  ,  , spotifyHeight, %spotify%
    topLeftX := 0
    topLeftY := spotifyHeight - 90
    bottomRightX := 360
    bottomRightY := spotifyHeight
    saveToYourLibraryIcon = %A_WorkingDir%\SaveToYourLibraryIcon.png

    ImageSearch FoundX, FoundY, topLeftX, topLeftY, bottomRightX, bottomRightY, %saveToYourLibraryIcon%
    If (ErrorLevel = 0) {
      Click %FoundX%, %FoundY%
    }

    ; Restore original window and mouse position.
    WinActivate ahk_id %startingWinId%
    MouseMove %x%, %y%
  }
}