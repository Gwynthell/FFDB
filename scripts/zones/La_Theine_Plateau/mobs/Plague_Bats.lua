-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Plague Bats	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,71,1);
end;	
