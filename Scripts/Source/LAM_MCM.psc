ScriptName LAM_MCM Extends SKI_ConfigBase
{Configuration menu for The Lusty Argonian Maid}

;Option Properties
Bool Property bTraceLogging = False Auto



Event OnPageReset(String Page)

	If Page == ""
	
	Else
		UnloadCustomContent()
	EndIf
	
	

EndEvent