ScriptName SQ_ShipDebrisScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property SQ_ShipDebrisKeyword Auto Const mandatory
{ add keyword to orbit location when quest is running to block other quests from starting up here }
LocationAlias Property OrbitLocation Auto Const mandatory
{ add keyword to this location }
Location Property theOrbitLocation Auto Hidden ; Added location property to store location from startup so that keyword can properly be removed on shutdown - Bobbyclue 10/1/23
{ add keyword to this location }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.AddKeywordToLocation(True)
EndEvent

Event OnQuestShutdown()
  Self.AddKeywordToLocation(False)
EndEvent

Function AddKeywordToLocation(Bool addKeyword)
  If addKeyword
    theOrbitLocation = OrbitLocation.GetLocation() ; Moved inside of keyword check and changed to reference property instead of local var - Bobbyclue 10/1/23
    theOrbitLocation.addKeyword(SQ_ShipDebrisKeyword)
  Else
    theOrbitLocation.RemoveKeyword(SQ_ShipDebrisKeyword)
  EndIf
EndFunction
