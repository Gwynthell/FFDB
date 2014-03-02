-----------------------------------
-- Area: Sealions Den
-- NPC:  Omega
-----------------------------------

require("scripts/globals/titles");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(OMEGA_OSTRACIZER);	
	local OmegaID=mob:getID();
		switch (OmegaID) : caseof {
		[16908294] = function (x) 
         killer:setPos(-779, -103, -80);
		 killer:startEvent(0x000b);
	     SpawnMob(16908295); --ultima1
		end,
		[16908301] = function (x) 
         killer:setPos(-140, -23, -440);
		 killer:startEvent(0x000b);
		 SpawnMob(16908302); --ultima2
		end,
		[16908308] = function (x) 
         killer:setPos(499, 56, -802);
		 killer:startEvent(0x000b);
		 SpawnMob(16908309); --ultima3
		end,
	}

end;