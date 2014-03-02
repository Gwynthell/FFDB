-----------------------------------
-- Area: 
-- NPC:  Ouryu
-----------------------------------
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

function onMobFight(mob,target)
	
    if (mob:hasStatusEffect(EFFECT_INVINCIBLE) == false and mob:actionQueueEmpty() == true) then
        local changeTime, twohourTime = mob:getExtraVar(2);

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14);
            mob:setExtraVar(changeTime, twohourTime);
        end
        
        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(438);
            mob:setExtraVar(changeTime, math.random((mob:getBattleTime()/15)+12, (mob:getBattleTime()/15)+16));
        elseif(mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            --and record the time this phase was started
            mob:setExtraVar(mob:getBattleTime(), twohourTime);
        -- subanimation 1 is flight, so check if he should land
        elseif(mob:AnimationSub() == 1 and 
                mob:getBattleTime() - changeTime > 120) then
            mob:useMobAbility(1046);
            mob:setExtraVar(mob:getBattleTime(), twohourTime);
        -- subanimation 2 is grounded mode, so check if he should take off
        elseif(mob:AnimationSub() == 2 and 
                mob:getBattleTime() - changeTime > 120) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            mob:setExtraVar(mob:getBattleTime(), twohourTime);
        end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(MIST_MELTER);		

end;