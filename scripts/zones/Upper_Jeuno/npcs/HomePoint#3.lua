-----------------------------------
-- Area: Upper Jeuno
-- NPC:  HomePoint#3
-- @pos -52 1 16 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (HOMEPOINT_HEAL == 1) then
	player:addHP(player:getMaxHP());
	player:addMP(player:getMaxMP());
end
player:startEvent(0x21fe);
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
	if(csid == 0x21fe) then
		if (option == 1) then	
			player:setHomePoint();
			player:messageSpecial(HOMEPOINT_SET);
		end
	end
end;	



