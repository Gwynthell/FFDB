-----------------------------------
-- Ability: Spirit Link
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getPet() == nil) then
		return MSGBASIC_REQUIRES_A_PET,0;
	else
		if (player:getPet():getHP() == player:getPet():getMaxHP() and player:getMerit(MERIT_EMPATHY) == 0) then
			return MSGBASIC_UNABLE_TO_USE_JA,0;
		else
			return 0,0;
		end
	end
end;

function OnUseAbility(player, target, ability)

	local playerHP = player:getHP();
	local drainamount = (math.random(25,35) / 100) * playerHP;
	
	if (player:hasStatusEffect(EFFECT_STONESKIN)) then
		local skin = player:getMod(MOD_STONESKIN);
		
		if(skin >= drainamount) then
			if(skin == drainamount) then 
				player:delStatusEffect(EFFECT_STONESKIN);
			else
				local effect = player:getStatusEffect(EFFECT_STONESKIN);
				effect:setPower(effect:getPower() - drainamount); -- fixes the status effeect so when it ends it uses the new power instead of old
				player:delMod(MOD_STONESKIN,drainamount); --removes the amount from the mod
				
			end
		else
			player:delStatusEffect(EFFECT_STONESKIN);
			player:delHP((drainamount-skin));
		end

	else
		player:delHP(drainamount);
	end
	
	local pet = player:getPet();	
	local healPet = drainamount * 2;
	local petTP = pet:getTP();
	
	if(player:getEquipID(SLOT_HEAD)==15238) then
		healPet = healPet + 15;
	end
	
	pet:addHP(healPet); --add the hp to pet	
	player:addTP(petTP/2); --add half pet tp to you
	pet:delTP(petTP/2); -- remove half tp from pet

    pet:delStatusEffect(EFFECT_POISON);
    removeSleepEffects(pet);
	pet:delStatusEffect(EFFECT_PARALYSIS);
	
	if(math.random(1,2) == 1) then
		pet:delStatusEffect(EFFECT_DOOM);
	end
	
end;
