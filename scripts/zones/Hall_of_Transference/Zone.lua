-----------------------------------
-- 
-- Zone: Hall_of_Transference
-- 
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Hall_of_Transference/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
	zone:registerRegion(1,-281,-5,277,-276,0,284); 		-- Holla
	zone:registerRegion(2,276,-84,-82,283,-80,-75); 	-- Mea
	zone:registerRegion(3,-283,-45,-283,-276,-40,-276); -- Dem
	zone:registerRegion(4,0,0,0,0,0,0);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	local cs = -1;
	
	if((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(274,-82,-62 ,180);
     end
	 
	return cs;
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)

	switch (region:GetRegionID()): caseof
	{
		[1] = function (x) -- Holla
			player:setVar("option",1);
			player:startEvent(103);
		end,
		[2] = function (x) -- Mea
			player:setVar("option",1);
			player:startEvent(104);
		end,
		[3] = function (x) -- Dem
			player:setVar("option",1);
			player:startEvent(105);
		end,
		[4] = function (x)
			player:setVar("option",2);
			player:startEvent(103);
		end,
	}
	

end;
-----------------------------------	
-- onRegionLeave	
-----------------------------------	

function onRegionLeave(player,region)
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

	if(csid==103)then
		player:setPos(340.082, 19.103, -59.979, 127, 102); 	-- To La Theine Plateau {R}
	elseif(csid==104)then
		player:setPos(179.92, 35.15, 260.137, 64, 117);	    -- To Tahrongi Canyon {R}
	elseif(csid==105)then
		player:setPos(139.974, 19.103, 219.989, 128, 108); 	-- To Konschtat Highlands {R}
	end
end;