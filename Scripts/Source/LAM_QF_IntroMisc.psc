;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname LAM_QF_IntroMisc Extends Quest Hidden

;BEGIN ALIAS PROPERTY akKassen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_akKassen Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
If GotRumor
     SetObjectiveCompleted(0)
Else
     ;Quest wasn't started no objective to complete
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0,1);Speak to the Vigilant
GotRumor = True; Tracks that the palyer did receive the rumor
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Bool Property GotRumor = False Auto  
{Whether the player received the rumor or not}
