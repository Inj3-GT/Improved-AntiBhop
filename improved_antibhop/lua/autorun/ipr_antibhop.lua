--- Script By Inj3
--- Script By Inj3
--- Script By Inj3
----- https://steamcommunity.com/id/Inj3/
----- https://github.com/Inj3-GT/

local ipr_delay_bhop = 1.3
local ipr_key = IN_JUMP
local ipr_movetype = MOVETYPE_NOCLIP
local ipr_fix_attack = IN_ATTACK

hook.Add("StartCommand", "Ipr_Anti_BhopRestrict", function(ply, cmd)
    if not cmd:KeyDown(ipr_key) then
        return
    end

    if (cmd:CommandNumber() ~= 0) then
        if not IsValid(ply) or not ply:Alive() or (ply:GetMoveType() == ipr_movetype) then
            return
        end
        local ipr_cur = CurTime()

        if (ply.ipr_push_bhop) then
            if (ipr_cur < ply.ipr_nextc_bhop) then
                local ipr_f = false
                if cmd:KeyDown(ipr_fix_attack) then
                    ipr_f = true
                end
                cmd:ClearButtons()

                if (ipr_f) then
                cmd:SetButtons(ipr_fix_attack)
                end
            else
                ply.ipr_push_bhop = false
            end
        end

        if not ply.ipr_push_bhop then
            ply.ipr_nextc_bhop = ipr_cur + ipr_delay_bhop
            ply.ipr_push_bhop = true
        end
    end
end)
