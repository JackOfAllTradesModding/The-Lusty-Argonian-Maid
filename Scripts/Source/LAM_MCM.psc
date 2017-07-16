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





Function Config(String msg, Bool Forced)

	If Forced
		Debug.Trace("Lusty Argonian Maid: ERROR: " + msg);
	ElseIf bTraceLogging
		Debug.Trace("Lusty Argonian Maid: " + msg);
	EndIf

EndFunction