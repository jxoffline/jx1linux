Include("\\script\\nationalwar\\login.lua")
Include("\\script\\nationalwar\\nationalwar.lua")

function main(type)
	local pos = NW_GetDuty()
	if (pos ~= NWPOSITION_NONE) then
		-- 重新加载光环和技能
		nationalwar_login()
		nationalwar_mapevent(1)
	end
end
