ScriptName LAM_MQ01_LaundryBag Extends Activator
{Orgnar's dirty laundry, activating it gives you an item which you must then take to get cleaned}

;This specific LaundryBag Script only exists on Mq01, to advance the quest.

Event OnActivate(ObjectReference akActionRef)
	;Disable Activator the same way the broom one works,
	;Add "Orgnar's dirty laundry" to your inventory
	;Update LAM_MQ01 to the next stage (Wash the clothes)
EndEvent

