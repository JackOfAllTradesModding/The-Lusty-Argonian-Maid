Scriptname LAM_Util extends Quest  
{Handles some utility functions for The Lusty Argonian Maid, referenced by multiple scripts.}

;Player
Actor Property PlayerRef Auto;

;Fade in and out properties
ImageSpaceModifier Property FadeToBlackImod Auto;
ImageSpaceModifier Property FadeToBlackHoldImod Auto;
ImageSpaceModifier Property FadeToBlackBackImod Auto;

;Maid outfit properties
Armor Property LAM_MaidAmulet Auto
Armor Property LAM_MaidApron Auto
Armor Property LAM_MaidArmlet Auto
Armor Property LAM_MaidClothes Auto
Armor Property LAM_MaidHeaddress Auto
Armor Property LAM_MaidKneeSocks Auto
Armor Property LAM_MaidShoes Auto
Armor Property LAM_MaidSkirt Auto
Armor Property LAM_MaidPanty Auto

Bool Property LockEquipment Auto

;Tracelogging GV so it cna be set without an MCM menu
GlobalVariable Property LAM_TraceLogging Auto; 
;Note: Originally my code was written to work with a bool, but since getting and setting GV is atomic (or as close to atomic as papyrus gets) using a GV may not be as neat but is essentially as efficient. Second note: 0: False, Anything else is True.
String Property LogName = "LAM_log" Auto; The filename of the user log.

;FADE IN AND OUT, now using quick properties and exclusively vanilla assets.

; Fades the screen to black and holds it there.  Call FadeFromBlack() to reverse it.
Function FadeToBlackAndHold()
	Log("Fading to black...")
    FadeToBlackImod.Apply()
    Utility.Wait(2)
    FadeToBlackImod.PopTo(FadeToBlackHoldImod)
EndFunction

; Fades the screen from black back to normal.  Reverses the effects of FadeToBlackAndHold().
Function FadeFromBlack()
	Log("Fading from black...")
    Utility.Wait(2)
    FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
    FadeToBlackHoldImod.Remove()
EndFunction


; Equips the maid outfit to the player, may get moved to the TF script
Function EquipMaidOutfit()
	Log("Equipping new maid uniform...");
	PlayerRef.AddItem(LAM_MaidAmulet, 1, abSilent=True);
	PlayerRef.EquipItem(LAM_MaidAmulet, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidApron, 1, True);
	PlayerRef.EquipItem(LAM_MaidApron, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidArmlet, 1, True);
	PlayerRef.EquipItem(LAM_MaidArmlet, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidClothes, 1, True);
	PlayerRef.EquipItem(LAM_MaidClothes, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidHeaddress, 1, True);
	PlayerRef.EquipItem(LAM_MaidHeaddress, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidKneeSocks, 1, True);
	PlayerRef.EquipItem(LAM_MaidKneeSocks, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidShoes, 1, True);
	PlayerRef.EquipItem(LAM_MaidShoes, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidSkirt, 1, True);
	PlayerRef.EquipItem(LAM_MaidSkirt, LockEquipment, True);
	PlayerRef.AddItem(LAM_MaidPanty, 1, True);
	PlayerRef.EquipItem(LAM_MaidPanty, LockEquipment, True);
	Log("Maid uniform equipped!")
EndFunction


;DEBUG Logging. Uses a custom user log.
Function Log(String text, Bool Error = False)
	;Custom user log should be LAM_log.X
	;Log should always be open if enabled.
	
	If Error && (LAM_TraceLogging.GetValue() == 0)
		;Error log but no userlog, just trace
		Debug.Trace("LAM ERROR: " + text);
	ElseIf Error
		;Error log but userlog is open
		Debug.OpenUserLog(LogName)
		Debug.TraceUser(LogName, "ERROR: " + text, 2);
	ElseIf LAM_TraceLogging.GetValue() != 0
		;User log is open, not an error
		Debug.OpenUserLog(LogName)
		Debug.TraceUser(LogName, text)
	Else
		;No point to trace this shit, this condition just exists for my own completionist tendencies
	EndIf
EndFunction

;End of Content Popup
Function EoC(String version)
	Debug.MessageBox("You have reached the end of content for version " + version + "! Thank you for playing, please let Feliks know what you thought or if you encountered any issues!");
EndFunction
