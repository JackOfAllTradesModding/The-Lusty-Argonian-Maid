Scriptname LAM_KassenTF extends Quest  
{Handles Transformation of Kassen}

ReferenceAlias Property LAM_VigilantKassen Auto; KAssen the vigilant
ReferenceAlias Property LAM_Kassen Auto;		 Kassen the yinglet. No wait, that's not right.

ReferenceAlias Property LAM_HoldingCellMarker Auto; Holding cell to store things like disabled or unnecessary actors

Explosion Property LAM_ExplosionTF Auto; The Hysteria Explosion effect (ExplosionIllusionMassiveDark) but with no force or damage, might shrink the radius too.
Explosion Property LAM_ExplosionRevert Auto; The Harmony Explosion effect (ExplosionIllusionMassiveLigh01)


Function Transform()
	;Move Kassen to Vigilant
	LAM_Kassen.GetReference().MoveTo(LAM_VigilantKassen.GetReference())
	;Play some kind of explosion
	LAM_VigilantKassen.GetReference().PlaceAtMe(LAM_ExplosionTF);
	;Disable Vigilant in a puff of smoke
	LAM_VigilantKassen.GetReference().Disable();
	;Enable Kassen
	LAM_Kassen.GetReference().Enable();
	;Move Vigilant to the holding cell if we go with that
	LAM_VigilantKassen.GetReference().MoveTo(LAM_HoldingCellMarker.GetReference());
EndFunction;

Function Reverse()
	;Basically the above but with aliases swapped
	;Move Kassen to Vigilant
	LAM_VigilantKassen.GetReference().MoveTo(LAM_Kassen.GetReference())
	;Play some kind of explosion
	LAM_Kassen.GetReference().PlaceAtMe(LAM_ExplosionRevert);
	;Disable Vigilant in a puff of smoke
	LAM_Kassen.GetReference().Disable();
	;Enable Kassen
	LAM_VigilantKassen.GetReference().Enable();
	;Move Vigilant to the holding cell if we go with that
	LAM_Kassen.GetReference().MoveTo(LAM_HoldingCellMarker.GetReference());
EndFunction 