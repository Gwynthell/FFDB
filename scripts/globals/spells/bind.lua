-----------------------------------------
-- Spell: Bind
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	--Pull base stats.
	local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	local bonus = AffinityBonus(caster, spell:getElement());

	--Duration, including resistance.  May need more research.
	local duration = 60;

	--Resist
	local resist = applyResistance(caster,spell,target,dINT,35,bonus);

	if(100 * math.random() >= target:getMod(MOD_BINDRES)) then
		if(resist >= 0.5) then --Do it!
			--Try to erase a weaker bind.
			if(target:addStatusEffect(EFFECT_BIND,target:speed(),0,duration*resist)) then
				spell:setMsg(236);
			else
				spell:setMsg(75);
			end
		else
			spell:setMsg(85);
		end
	else
        spell:setMsg(284);
	end


	return EFFECT_BIND;

end;