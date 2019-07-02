ScriptName LAM_TF_Timer Extends Quest
{Effectively a semaphore to help with variable latency during the actual TF}

;This script is triggered by LAM_PlayerTF and exists purely as a synchronization tool

Bool Property RaceMenuOpen = False Auto;

LAM_Util Property util Auto; Allows debug logging

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
	util.Log("RaceMenu opened...");
EndEvent

Event OnMenuClose(String MenuName)
	Utility.Wait(0.1);Just in case. This is blocked by menus and will not complete until the menu is closed
	RaceMenuOpen = False;
	util.Log("RaceMenu closed!");
EndEvent
