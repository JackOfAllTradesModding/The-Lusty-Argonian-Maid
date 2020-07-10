ScriptName LAM_ChoreLaundryScript Extends Quest Conditional
{Stores some specfic data to be referenced by conditions in this quest and dialogue}

;Scripts to import properties from
LAM_InnManager Property Manager Auto;
LAM_ChoreLaundryTimer Property Timer Auto;

;This might seem counterintuitive based on how this script is set up, but you can only have one conditional script on an object at a time, 
;And I didn't  want to make the conditionals on the Core and Chore master the inn manager and laundry timer respectively


Bool Property OrgnarSpokeToPlayer Auto Conditional
{Determines if player did laundry by self or Orgnar thanked them for doing it}

Int Property LaundryCount Auto Conditional
{Keeps track of how many pieces of laundry actually need to be cleaned}

;Imported Booleans about Laundry:
Bool Property DelphineNeedsLaundry Auto Conditional
;TODO
;Properties for if laundry got wet
;Properties for if something else went wrong