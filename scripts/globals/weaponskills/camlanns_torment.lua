-----------------------------------	
-- Camlann's Torment
-- Polearm weapon skill	
-- Skill Level: EMPYREAN	
-- Delivers a triple damage attack. DEF ignored varies with TP.	
-- Will stack with Sneak Attack.	
-- Element: None	
-- Modifiers: VIT:60%
-- 100%TP    200%TP    300%TP	
-- 3.00      3	       3	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 3; params.ftp200 = 3; params.ftp300 = 3;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.6; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	return tpHits, extraHits, criticalHit, damage;
end	
