---------------------------------------------------------------------------------------------------
-- func: setplayermerits
-- auth: Link
-- desc: Sets the target players merit count.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, amount)
    if (target == nil) then
        target = player:getName();
    end
    
    if (amount == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        end
    end
    
    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setMerits( amount );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end

end