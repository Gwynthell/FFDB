-----------------------------------
--
-- Zone: Full_Moon_Fountain (170)
--
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Full_Moon_Fountain/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-260.136,2.09,-325.702,188);
	end	
	if(player:getCurrentMission(WINDURST) == FULL_MOON_FOUNTAIN and player:getVar("MissionStatus") == 3) then
		cs = 0x0032
	end
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
end;	

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
	
	if(csid == 0x0032) then
		finishMissionTimeline(player,3,csid,option);
	end
end;	
