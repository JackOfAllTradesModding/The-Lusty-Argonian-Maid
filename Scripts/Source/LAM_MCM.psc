ScriptName LAM_MCM Extends SKI_ConfigBase
{Configuration menu for The Lusty Argonian Maid, acts as a wrapper for LAM_Config and globals so as to not require SkyUI for all players.}

;Option Properties
Bool Property bTraceLogging = False Auto



Event OnPageReset(String Page)

	If Page == ""
	
	Else
		UnloadCustomContent()
	EndIf
	
	

EndEvent