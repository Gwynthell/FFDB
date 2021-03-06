---------------------------------------------------
--
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnAbilityCheck(player, target, ability)
    return 0,0;
end;

function OnPetAbility(target, pet, skill, summoner)
    local duration = 60 + 2 * summoner:getMod(MOD_SUMMONING);

    local magicskill = getSkillLvl(1, target:getMainLvl());

    local potency = 3 + ((6*magicskill)/100);
    if(magicskill>200) then
        potency = 5 + ((5*magicskill)/100);
    end

    local typeEffect = EFFECT_ENTHUNDER;

    skill:setMsg(MobBuffMove(target, typeEffect, potency, 0, duration));

    return typeEffect;
end