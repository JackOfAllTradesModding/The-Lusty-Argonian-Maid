;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname LAM_QF_Intro Extends Quest Hidden

;BEGIN ALIAS PROPERTY KassenSpawnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KassenSpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CultistLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CultistLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingCellMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingCellMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerSceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerSceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaveDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist02PositionMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist02PositionMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KassenSceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KassenSceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kassen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kassen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SleepingGiantMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SleepingGiantMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VigilantKassen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VigilantKassen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SigilStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SigilStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vigilant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vigilant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wabbajack
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wabbajack Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CultLeaderPosition
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CultLeaderPosition Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist01PositionMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist01PositionMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveDisplayed(15)
util.Log("LAM_Intro: Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
util.Log("LAM_Intro: Stage 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Alias_CultistLeader.GetActorReference().SetAlpha(0)
Alias_Cultist01.GetActorReference().SetAlpha(0)
Alias_Cultist02.GetActorReference().SetAlpha(0)
util.Log("LAM_Intro: Stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If IsObjectiveDisplayed(5)
SetObjectiveCompleted(5)
EndIf
SetObjectiveDisplayed(0)
util.Log("LAM_Intro: Stage 10")
Alias_CaveDoor.GetReference().SetLockLevel(1);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Open the last door, start the scene
SetObjectiveDisplayed(20)
;DoorRef.SetOpen(True);
;Game.SetPlayerAIDriven(True);
util.Log("LAM_Intro: Stage 40")
Alias_Cultist01.GetReference().MoveTo(Alias_Cultist01PositionMarker.GetReference());
Alias_Cultist02.GetReference().MoveTo(Alias_Cultist02PositionMarker.GetReference());
Alias_CultistLeader.GetReference().MoveTo(Alias_CultLeaderPosition.GetReference());
LAM_Intro_TF_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveFailed(20)
util.Log("LAM_Intro: Stage 50")
;Cleanup: Move vigilant/Kassen to the holding cell.
Alias_Kassen.GetReference().MoveTo(Alias_HoldingCellMarker.GetReference())
Alias_Vigilant.GetReference().MoveTo(Alias_HoldingCellMarker.GetReference())
Alias_Vigilant.GetReference().Disable()
Alias_VigilantKassen.GetReference().MoveTo(Alias_HoldingCellMarker.GetReference())
Alias_VigilantKassen.GetReference().Disable()
;Move Player to sleeping giant marker
Alias_PlayerRef.GetReference().MoveTo(Alias_SleepingGiantMarker.GetReference())
;Start MQ01
LAM_MQ01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(5)
util.Log("LAM_Intro: Stage 5")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property LAM_MQ01  Auto  

Activator Property TheDoor  Auto  

ObjectReference Property DoorRef  Auto  

Scene Property LAM_Intro_TF_Scene  Auto  

LAM_Util Property util  Auto  
{Utility script to facilitate tracelogs}
