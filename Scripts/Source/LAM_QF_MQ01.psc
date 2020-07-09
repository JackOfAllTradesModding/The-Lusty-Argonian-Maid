;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 36
Scriptname LAM_QF_MQ01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LaundryTub
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryTub Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CookingPot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CookingPot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IngredientBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IngredientBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryClothesline
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryClothesline Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BroomActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BroomActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryStatic
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryStatic Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dust3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dust3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BedToMake01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BedToMake01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
setObjectiveCompleted(30)
setObjectiveDisplayed(40)
util.Log("LAM_MQ01: Stage 40")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
LAM_MQ01_Msg10.Show()
SetObjectiveCompleted(120);
SetObjectiveDisplayed(130)
util.Log("LAM_MQ01: Stage 130");
Alias_LaundryActivator.GetReference().Disable();
Alias_LaundryStatic.GetReference().Disable();
util.EoC("0.7");
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
LAM_MQ01_Msg7.Show()
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
util.Log("LAM_MQ01: Stage 80")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
LAM_MQ01_Msg8.Show()
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
util.Log("LAM_MQ01: Stage 90")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
util.Log("LAM_MQ01: Stage 120")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
SetObjectiveCompleted(60)
Alias_LaundryStatic.GetReference().Enable();
Alias_LaundryActivator.GetReference().Enable();
SetObjectiveDisplayed(70)
util.Log("LAM_MQ01: Stage 70")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
util.Log("LAM_MQ01: Stage 10")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Game.SetPlayerAIDriven(False);
Game.EnablePlayerControls();
Util.EquipMaidOutfit();
PlayerTF.WrapUp();
;And put player into PlayerAlias on Core quest, blank by default.
SetObjectiveDisplayed(0)
Core_PlayerAlias.ForceRefTo(Game.GetPlayer())
util.Log("LAM_MQ01: Stage 0")
LAM_Chore_Master.Start();
util.Log("Chore Master started");
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
util.Log("LAM_MQ01: Stage 60")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
util.Log("LAM_MQ01: Stage 110")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
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

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
LAM_MQ01_Msg9.Show()
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
util.Log("LAM_MQ01: Stage 100")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
setObjectiveCompleted(40)

;Set bed as needing to be made
BedScript.NeedsTidying(True);

setObjectiveDisplayed(50)
util.Log("LAM_MQ01: Stage 50")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
LAM_MQ01_Msg5.Show();
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
util.Log("LAM_MQ01: Stage 30")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LAM_Util Property util  Auto  

LAM_MQ01_BedMaking Property BedScript  Auto  

ReferenceAlias Property Core_PlayerAlias  Auto  

Message Property LAM_MQ01_Msg5  Auto  

Message Property LAM_MQ01_Msg7  Auto  

Message Property LAM_MQ01_Msg8  Auto 
 
Message Property LAM_MQ01_Msg9  Auto 
 
Message Property LAM_MQ01_Msg10  Auto  

LAM_PlayerTF Property PlayerTF  Auto  

Quest Property LAM_Chore_Master  Auto  
