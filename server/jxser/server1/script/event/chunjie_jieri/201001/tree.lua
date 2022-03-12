Include("\\script\\event\\chunjie_jieri\\201001\\plant.lua")

function main()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Dialog()
		end
	end
end
