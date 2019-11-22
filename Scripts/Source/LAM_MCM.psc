ScriptName LAM_MCM Extends SKI_ConfigBase
{Configuration menu for The Lusty Argonian Maid, acts as a wrapper for LAM_Config and globals so as to not require SkyUI for all players.}

;Option Properties All USed from LAM_Config
LAM_Config Property config Auto;



Event OnPageReset(String Page)

	If Page == ""
		;Load Custom Splash
	Else
		UnloadCustomContent()
	EndIf
	
	If Page == "General Stats"
	
	ElseIf Page == "Perks"
	
	ElseIf Page == "Debugging"
		;Add Option to UN TF Player
		;Option to Re-TF Player
		
		;Debug Toggle
		AddToggleOptionST("TraceLog_Toggle", "$MCM_LogOption", config.b_LAM_TraceLogging)
	EndIf
	
EndEvent

Function LockMenu()
{Locks all options in menu until all whatever is happening is done}

EndFunction

{Unlocks all menu options as a counterpoint to the above}
Function UnLockMenu()

EndFunction

;OPTION STATES

;Debugging Page

State TraceLog_Toggle
	Event OnSelectST()
		config.b_LAM_TraceLogging = !config.b_LAM_TraceLogging
		SetToggleOptionValueST(config.b_LAM_TraceLogging)
	EndEvent
	
	Event OnDefaultST()
		config.b_LAM_TraceLogging = False
		SetToggleOptionValueST(config.b_LAM_TraceLogging)
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$MCM_LogInfo");
	EndEvent
EndState
