;https://github.com/asvas/AsVas_AutoHotkey_Scripts/blob/master/ahk_Scripts.ahk

;---------------------------------------------------------------------------------
;Switch Function - Switching between different instances of the same executable or running it if missing
F_Switch(Target,TClass,TGroup,TPath = 0) {
	;Checking state of existence
	IfWinExist, ahk_exe %Target% 
	{
		;Definition of the group (grouping all instance of this class) (Not the perfect spot as make fo unnecessary reapeats of the command with every cycle, however the only easy option to keep the group up to date with the introduction of new instances)
		GroupAdd, %TGroup%, %TClass% 
		;Status check for active window if belong to the same instance of the "Target"
		IfWinActive %TClass%
			GroupActivate, %TGroup%, r ;If the condition is met cycle between targets belonging to the group
		else
			WinActivate %TClass% ;you have to use WinActivatebottom if you didn't create a window group.
	} 
	else
	{ 
		if TPath = 0 
			Run, %Target%
		else
			Run, %TPath% ;Command for running target if conditions are satisfied
	}
	Return
}