;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname LAM_QF_ChoreLaundry Extends Quest Hidden

;BEGIN ALIAS PROPERTY LaundryActivatorPatron01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryActivatorPatron01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LAM_LaundryStaticPatron01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LAM_LaundryStaticPatron01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryStaticPatron02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryStaticPatron02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryActivatorPatron02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryActivatorPatron02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryStaticPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryStaticPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryActivatorPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryActivatorPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryActivatorOrgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryActivatorOrgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryActivatorDelphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryActivatorDelphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryStaticDelphine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryStaticDelphine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LaundryStaticOrgnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LaundryStaticOrgnar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Clothesline
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Clothesline Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScrubbyTub
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScrubbyTub Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Stage 50
;Laundry was rained on, orgnar motivated
LAM_ChoreLaundry_Rain_Msg.Show()
SetObjectiveFailed(30);
SetObjectiveDisplayed(35);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Stage 70
;Put clothes back, orgnar motivated
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Stage 75
;Talk to Orgnar, self motivated. Good Girl
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Stage 35
;Wait for drying, self motivated
SetObjectiveCompleted(20);
SetObjectiveDisplayed(30);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Stage 55
;Collect clothes, self motivated
If IsObjectiveDisplayed(30)
SetObjectiveCompleted(30);
SetObjectiveDisplayed(40);
ElseIf IsObjectiveDisplayed(35)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40);
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Stage 40
;Wait for drying, orgnar motivated
SetObjectiveCompleted(20);
SetObjectiveDisplayed(30);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Stage 30
;Hang to dry, orgnar motivated
SetObjectiveCompleted(10);
SetObjectiveDisplayed(20);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE LAM_ChoreLaundryScript
Quest __temp = self as Quest
LAM_ChoreLaundryScript kmyQuest = __temp as LAM_ChoreLaundryScript
;END AUTOCAST
;BEGIN CODE
;Stage 0
util.Log("Laundry Chore started, enabling all laundry activators, hidden within journal")
kmyQuest.LaundryCount = 0;

;Orgnar
Alias_LaundryActivatorOrgnar.GetReference().Enable();
Alias_LaundryStaticOrgnar.GetReference().Enable();
kmyQuest.LaundryCount += 1;

;Player
Alias_LaundryActivatorPlayer.GetReference().Enable();
Alias_LaundryStaticPlayer.GetReference().Enable();
kmyQuest.LaundryCount += 1;

;Delphine
If kmyQuest.DelphineNeedsLaundry
     util.Log("Delphine needs laundry too")
Alias_LaundryActivatorDelphine.GetReference().Enable();
Alias_LaundryStaticDelphine.GetReference().Enable();
kmyQuest.LaundryCount += 1;
Else
util.Log("Delphine does not need laundry");
EndIf

;Patron01
If manager.Patron01_b
util.Log("Patron 1 needs laundry")
Alias_LaundryActivatorPatron01.GetReference().Enable();
Alias_LAM_LaundryStaticPatron01.GetReference().Enable();
kmyQuest.LaundryCount += 1;
Else
util.Log("Patron 1 does not need laundry")
EndIf

;Patron02
If manager.Patron02_b
util.Log("Patron 2 needs laundry")
Alias_LaundryActivatorPatron02.GetReference().Enable();
kmyQuest.LaundryCount += 1;
Alias_LaundryStaticPatron02.GetReference().Enable();
Else
util.Log("Patron 2 does not need laundry")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Stage 5
;Player is a good girl and started doing the laundry without being told
SetObjectiveDisplayed(0);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Stage 60
;Collect Clothes Self motivated
If IsObjectiveDisplayed(30)
SetObjectiveCompleted(30);
SetObjectiveDisplayed(40);
ElseIf IsObjectiveDisplayed(35)
SetObjectiveCompleted(35)
SetObjectiveDisplayed(40);
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE LAM_ChoreLaundryScript
Quest __temp = self as Quest
LAM_ChoreLaundryScript kmyQuest = __temp as LAM_ChoreLaundryScript
;END AUTOCAST
;BEGIN CODE
;Stage 200
;Shutdown stage, disable all laundry bags, reset Orgnar Talky flag
;Orgnar
Alias_LaundryActivatorOrgnar.GetReference().Disable();
Alias_LaundryStaticOrgnar.GetReference().Disable();

;Player
Alias_LaundryActivatorPlayer.GetReference().Disable();
Alias_LaundryStaticPlayer.GetReference().Disable();

;Delphine
Alias_LaundryActivatorDelphine.GetReference().Disable();
Alias_LaundryStaticDelphine.GetReference().Disable();

;Patron01
Alias_LaundryActivatorPatron01.GetReference().Disable();
Alias_LAM_LaundryStaticPatron01.GetReference().Disable();

;Patron02
Alias_LaundryActivatorPatron02.GetReference().Disable();
Alias_LaundryStaticPatron02.GetReference().Disable();

;
ChoreTimer.StartTimer();
kmyQuest.OrgnarSpokeToPlayer = False;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Stage 10
;Player has been asked to do laundry
SetObjectiveDisplayed(0);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Stage 20
;Wash laundry Orgnar motivated
SetObjectiveCompleted(0);
SetObjectiveDisplayed(10);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Stage 45
;Was waiting, now rained on, self motivated
LAM_ChoreLaundry_Rain_Msg.Show()
SetObjectiveFailed(30);
SetObjectiveDisplayed(35);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Stage 25
;Hang to dry, self motivated
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Stage 65
;Put clothes back, self motivated
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Stage 15
;Wash laundry, self motivated
SetObjectiveCompleted(0);
SetObjectiveDisplayed(10);
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Stage 80
;Report back to orgnar
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LAM_Util Property util  Auto  
{Allows for trace logging}

LAM_ChoreLaundryTimer Property ChoreTimer  Auto  
{The script that governs time between this task repeating, and stores some useful information}

LAM_InnManager Property manager  Auto  
{Tracks patron 01 and 02 if they exist}

Message Property LAM_ChoreLaundry_Rain_Msg  Auto  
{Popup to inform the player that it has rained on their laundry}
