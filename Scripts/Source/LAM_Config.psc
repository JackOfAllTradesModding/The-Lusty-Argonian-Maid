ScriptName LAM_Config Extends Quest 
{The actual configuration script for LAM, the MCM is essentially a wrapper for this, which is essentially a wrapper for GV to keep the abstracted from code because I hate using a bunch of Global Variables}


;Booleans--------------------------
;Note, treating 0 as false and all other values as true

GlobalVariable Property LAM_TraceLogging Auto; 	Actual obfuscated Global
Bool Property b_LAM_TraceLogging; 				Boolean for access
{Tracelogging for Debugging and testing purposes.}
	Bool Function Get()
		If (LAM_TraceLogging.GetValue() != 0) 
			Return True;
		Else
			Return False;
		EndIf
	EndFunction

	Function Set(bool val) 
		If (val == True) 
			LAM_TraceLogging.SetValue(1);
		Else
			LAM_TraceLogging.SetValue(0);
		EndIf
	EndFunction

EndProperty

