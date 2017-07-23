;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_LAM_Intro_02002C17 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CultistLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CultistLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KassenSceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KassenSceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vigilant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vigilant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kassen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kassen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wabbajack
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wabbajack Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KassenSpawnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KassenSpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VigilantKassen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VigilantKassen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingCellMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingCellMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cultist01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cultist01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerSceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerSceneMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
