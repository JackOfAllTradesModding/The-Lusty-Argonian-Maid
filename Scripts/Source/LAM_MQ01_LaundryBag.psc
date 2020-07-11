ScriptName LAM_MQ01_LaundryBag Extends ReferenceAlias
{Orgnar's dirty laundry, activating it gives you an item which you must then take to get cleaned}

;This specific LaundryBag Script only exists on Mq01, to advance the quest.

ReferenceAlias Property MQ_OrgnarsLaundry Auto
{DEPRECATED}
ReferenceAlias Property LaundryBox Auto; Box the "laundry" items are hidden in

Actor Property PlayerRef Auto;

Event OnActivate(ObjectReference akActionRef)
	;Disable Activator the same way the broom one works,
	;Add "Orgnar's dirty laundry" to your inventory
	;Update LAM_MQ01 to the next stage (Wash the clothes)
	;If (akActionRef == PlayerRef)
		;Is player
		util.Log("Player activating laundry bag.")
		;Picking Laundry up
		If (LAM_MQ01.GetStage() == 70)
			util.Log("MQ01: Player picking up Orgnar's dirty laundry");
			LaundryBox.GetReference().RemoveItem(LAM_LaundryDirtyOrgnar.GetReference(), 1, False, PlayerRef);
			OrgnarLaundryBag.Disable();
			LAM_MQ01.SetStage(80);
			
		;Putting Laundry back
		ElseIf (LAM_MQ01.GetStage() == 120)
			util.Log("MQ01: Player putting back Orgnar's cleaned laundry");
			PlayerRef.RemoveItem(LAM_LaundryCleanOrgnar.GetReference(), 1, False, LaundryBox.GetReference());
			OrgnarLaundryBag.Enable();
			LAM_MQ01.SetStage(130);
			
		Else
			util.Log("MQ01: Player activating Orgnars Laundry in the wrong stage.");
		
		EndIf
	
	;Else
		util.Log("Someone other than the player is trying to steal Orgnar's Laundry! (MQ01)");
	
	;EndIf
	
EndEvent

Quest Property LAM_MQ01 Auto;

LAM_Util Property util Auto;

ObjectReference Property OrgnarLaundryBag Auto;

ReferenceAlias Property LAM_LaundryDirtyOrgnar Auto;
ReferenceAlias Property LAM_LaundryCleanOrgnar Auto;