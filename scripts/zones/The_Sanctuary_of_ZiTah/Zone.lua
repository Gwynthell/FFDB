-----------------------------------
--
-- Zone: The_Sanctuary_of_ZiTah (121)
--
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
require( "scripts/globals/icanheararainbow");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize( zone)		
	
	local Noble_Mold = 17273278;
	GetMobByID(Noble_Mold):setExtraVar(os.time() + math.random((43200), (57600)));
	
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)

	cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( 539.901, 3.379, -580.218, 126);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0002;
	end
	
	return cs;		
end;			

-----------------------------------			
-- onRegionEnter			
-----------------------------------			

function onRegionEnter( player, region)			
end;			

-----------------------------------			
-- onEventUpdate			
-----------------------------------			

function onEventUpdate( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if( csid == 0x0002) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow	
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if( csid == 0x0002) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;
