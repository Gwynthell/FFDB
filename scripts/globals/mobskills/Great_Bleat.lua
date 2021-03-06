---------------------------------------------
--  Great Bleat
--
--  Description: Lowers maximum HP of targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_MAX_HP_DOWN;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 30, 0, 60));

	return typeEffect;
end;
