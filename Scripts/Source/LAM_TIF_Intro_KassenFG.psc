;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname LAM_TIF_Intro_KassenFG Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
util.Log("Kassen FG in progress...")
getOwningQuest().setStage(2);

If LAM_IntroMisc.GetStage() > 0
     LAM_IntroMisc.SetStage(20);
Else
     LAM_IntroMisc.Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LAM_Util Property util  Auto  

Quest Property LAM_IntroMisc  Auto  
{Rumor Quest}
