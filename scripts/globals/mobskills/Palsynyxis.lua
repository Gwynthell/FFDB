---------------------------------------------
--  Palsynyxis
--
--  Description: Single target damage. Additional effect: Paralysis
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadows
--  Range: Unknown radial
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 1;
    local dmgmod = math.random(1,2);
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);

    local typeEffect = EFFECT_PARALYSIS;

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 25, 0, 120);

    target:delHP(dmg);
    return dmg;
end;