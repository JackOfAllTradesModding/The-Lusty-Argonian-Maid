ScriptName LAM_InnManager Extends Quest
{Script to handle such business as patrons at the inn, new management, etc. UNDER REVISION}

;Booleans to check if patrons are staying in either room
Bool Property Patron01_b Auto
Bool Property Patron02_b Auto

;ReferenceAlias Properties to their aliases on LAM_Core which houses this manager
ReferenceAlias Property Patron01 Auto
ReferenceAlias Property Patron02 Auto

;Functions to attempt to assign a new resident
;Functions to evict current residents
;TODO Functions to forcibly assign a new resident, if needed.

Int Function MoveIn(Actor Patron)
{Attempts to assign an actor to one of the two guest rooms. Return of zero means it failed, otherwise is the room assigned.}
	
	If !Patron01_b
		Patron01.ForceRefTo(Patron);
		Patron01_b = True;
		Return 1;
	ElseIf !Patron02_b
		Patron02.ForceRefTo(Patron);
		Patron02_b = True;
		Return 2;
	Else
		Return 0;
	EndIf
	
EndFunction

Function Evict(Int Room)
{Clears whichever Alias is selected}
	If Room == 1
		Patron01.Clear()
		Patron01_b = False;
	ElseIf Room == 2
		Patron02.Clear()
		Patron02_b = False;
	Else
		;Error Log
	EndIf
EndFunction
