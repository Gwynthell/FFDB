-----------------------------------	
-- Area: The Sanctuary of Zi'Tah	
-- MOB:  Noble Mold
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob, killer)	
	
	local Noble_Mold = mob:getID();
	local Noble_Mold_PH = GetServerVariable("Noble_Mold_PH");
		
	GetMobByID(Noble_Mold):setExtraVar(os.time() + math.random((43200), (57600)));
	SetServerVariable("Noble_Mold_PH", 0);
	DeterMob(Noble_Mold, true);
	DeterMob(Noble_Mold_PH, false);
	SpawnMob(Noble_Mold_PH, "", GetMobRespawnTime(Noble_Mold_PH));
	
	checkRegime(killer, mob, 115, 1);
	checkRegime(killer, mob, 116, 2);
	
end;	
