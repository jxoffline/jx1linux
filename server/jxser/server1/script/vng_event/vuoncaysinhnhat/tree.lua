Include("\\script\\vng_event\\VuonCaySinhNhat\\plant.lua")

function main()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Dialog()
		end
	end
end
