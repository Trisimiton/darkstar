---------------------------------------------
--  Stunbolt
--
--  Description: Stun
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_STUN;
    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_THUNDER);
        if(resist > 0.2) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,1,0,10*resist);--power=20;tic=0;duration=120;
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;