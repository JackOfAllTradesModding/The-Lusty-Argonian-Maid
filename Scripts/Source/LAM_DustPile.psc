ScriptName LAM_DustPile Extends ObjectReference
{Makes the player sweep those awful awful dust piles}

Actor Property PlayerREF Auto;

Quest Property LAM_SweepingQuest Auto;

;Idle Property idleLooseSweepingStart Auto;

ReferenceAlias Property PlayerSweeperAlias Auto;

LAM_Util Property util Auto;

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == (PlayerREF as ObjectReference) ;Might need to switch that
		;Force the player into the reference alias, all it has is a wait clause for like 5 seconds and it makes the player play the sweep idle. Clear the alias with a fragment at the end
		util.Log("Player activating dust pile...")
		PlayerSweeperAlias.ForceRefTo(PlayerREF);
		;Increment the counter in the sweeping quest
	Else
		;Not the player who gives a fuck
	EndIf

EndEvent
