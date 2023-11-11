Include("\\script\\event\\jiefang_jieri\\201004\\plant\\main.lua")

function main()
	local index = GetLastDlgNpc()
	if (index > 0) then
		local tree = FreedomTreeList2010:FindNpc(index)
		if (tree) then
			tree:Dialog()
		end
	end
end
