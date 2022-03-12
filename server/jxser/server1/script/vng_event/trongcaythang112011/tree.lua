Include("\\script\\vng_event\\trongcaythang112011\\plant.lua")

function main()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Dialog()
		end
	end
end
