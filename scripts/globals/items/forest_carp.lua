-----------------------------------------
-- ID: 4289
-- Item: forest_carp
-- Food Effect: 30Min, Mithra only
-----------------------------------------
-- Dexterity 2
-- Mind -4
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
	if (target:getRace() ~= 7) then
		result = 247;
	end
	if(target:getMod(MOD_EAT_RAW_FISH) == 1) then
		result = 0;
	end
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,4289);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DEX, 2);
	target:addMod(MOD_MND, -4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEX, 2);
	target:delMod(MOD_MND, -4);
end;
