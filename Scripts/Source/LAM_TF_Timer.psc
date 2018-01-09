ScriptName LAM_TF_Timer Extends Quest
{Effectively a semaphore to help with variable latency during the actual TF}

;This script is triggered by LAM_PlayerTF and exists purely as a synchronization tool

Bool Property RaceMenuOpen = False Auto;

Event OnInit()
	If RaceMenuOpen
		RaceMenuOpen = False
	EndIf
	RegisterForMenu("RaceSex Menu")
	RegisterForMenu("RaceSexMenu")	;Cannot prove this is necessary, whether or not the menus are two separate words is inconsistent
EndEvent

Event OnPlayerLoadGame()
	If RaceMenuOpen
		RaceMenuOpen = False
	EndIf
	RegisterForMenu("RaceSex Menu")
	RegisterForMenu("RaceSexMenu")
EndEvent

Event OnMenuOpen(String MenuName)
	RaceMenuOpen = True; Set to true when the menu opens
	;Utility.Wait(0.1);
EndEvent

Event OnMenuClose(String MenuName)
	Utility.Wait(0.1);Just in case
	RaceMenuOpen = False;
EndEvent
