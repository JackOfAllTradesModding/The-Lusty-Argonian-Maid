ScriptName LAM_MCM Extends SKI_ConfigBase
{Configuration menu for The Lusty Argonian Maid, acts as a wrapper for LAM_Config and globals so as to not require SkyUI for all players.}

;Option Properties All USed from LAM_Config}
LAM_Config Property config Auto;
LAM_Util Property util Auto;
LAM_PlayerTF Property TF Auto;

Message Property LAM_TF_Escape_Msg Auto;

Event OnConfigInit()
{Currently used to populate pages, needed for any oninit activities}

Pages = new String[1];
;Pages[0] = "$LAM_MCM_Page0"
;Pages[1] = "$LAM_MCM_Page1"
;Pages[2] = "$LAM_MCM_Page2"
Pages[0] = "$LAM_MCM_Page2"
EndEvent

Event OnPageReset(String Page)

	If Page == ""
		;Load Custom Splash
		;LoadCustomContent(LAM/LAM_MCM.swf)
	Else
		UnloadCustomContent()
	EndIf
	
	If Page == "General Stats"
		SetCursorPosition(0);
		SetCursorFillMode(TOP_TO_BOTTOM);
	ElseIf Page == "Perks"
		SetCursorPosition(0);
		SetCursorFillMode(TOP_TO_BOTTOM);
	ElseIf Page == "Debugging"
		SetCursorPosition(0);
		SetCursorFillMode(LEFT_TO_RIGHT);
		;Add Option to UN TF Player
		;Option to Re-TF Player
		
		;Debug Toggle
		AddToggleOptionST("TraceLog_Toggle", "$LAM_MCM_LogOption", config.b_LAM_TraceLogging);
		AddTextOptionST("UnTF_Button", "$LAM_MCM_UnTF", "");
	EndIf
	
EndEvent

Function LockMenu()
{Locks all options in menu until all whatever is happening is done}

EndFunction

Function UnLockMenu()
{Unlocks all menu options as a counterpoint to the above}

EndFunction

;OPTION STATES

;Debugging Page
;Tracelogging
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
		SetInfoText("$LAM_MCM_LogInfo");
	EndEvent
EndState

;UnTF
State UnTF_Button
	Event OnSelectST()
		util.log("Player has activated the Emergency Un-TF");
		LAM_TF_Escape_Msg.Show();
		Utility.Wait(0.1);
		TF.UnTransform();
	EndEvent
	
	Event OnDefaultST()
		;Literally nothing
	EndEvent
	
	Event OnHighlightST()
		SetInfoText("$LAM_MCM_UnTFInfo");
	EndEvent
EndState
