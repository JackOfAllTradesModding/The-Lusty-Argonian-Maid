Scriptname LAM_Util extends Quest  
{Handles some utility functions for The Lusty Argonian Maid}

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
;FADE IN AND OUT, now using quick properties and exclusively vanilla assets.

; Fades the screen to black and holds it there.  Call FadeFromBlack() to reverse it.
Function FadeToBlackAndHold()
    FadeToBlackImod.Apply()
    Utility.Wait(2)
    FadeToBlackImod.PopTo(FadeToBlackHoldImod)
EndFunction

; Fades the screen from black back to normal.  Reverses the effects of FadeToBlackAndHold().
Function FadeFromBlack()
    Utility.Wait(2)
    FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
    FadeToBlackHoldImod.Remove()
EndFunction

; Equips the maid outfit to the player
Function EquipMaidOutfit()
	PlayerRef.AddItem(LAM_MaidAmulet, 1, True);
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
EndFunction