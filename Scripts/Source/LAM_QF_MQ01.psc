;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname LAM_QF_MQ01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BedToMake01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BedToMake01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BroomActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BroomActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CookingPot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CookingPot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
setObjectiveCompleted(40)

;Set bed as needing to be made
BedScript.NeedsTidying(True);

setObjectiveDisplayed(50)
util.Log("LAM_MQ01: Stage 50")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
util.Log("LAM_MQ01: Stage 70")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
util.Log("LAM_MQ01: Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_Dust1.GetReference().Enable()
Alias_Dust2.GetReference().Enable()
Alias_Dust3.GetReference().Enable()
Alias_Dust4.GetReference().Enable()
Alias_Dust5.GetReference().Enable()
Alias_Dust6.GetReference().Enable()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
util.Log("LAM_MQ01: Stage 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveCompleted(30)
setObjectiveDisplayed(40)
util.Log("LAM_MQ01: Stage 40")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
util.Log("LAM_MQ01: Stage 60")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Game.SetPlayerAIDriven(False);
Game.EnablePlayerControls()
SetObjectiveDisplayed(0)
Util.EquipMaidOutfit();
Util.FadeFromBlack()
;And put player into PlayerAlias on Core quest, blank by default.
Core_PlayerAlias.ForceRefTo(Game.GetPlayer())
util.Log("LAM_MQ01: Stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10)
util.Log("LAM_MQ01: Stage 10")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LAM_Util Property util  Auto  

LAM_MQ01_BedMaking Property BedScript  Auto  

ReferenceAlias Property Core_PlayerAlias  Auto  
