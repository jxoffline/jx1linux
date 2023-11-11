Include("\\script\\event\\other\\caipiao\\head_gs.lua")
	
function main()
	
	if tbCaiPiao:UseGengYinLimit() ~= 1 then
		return 1
	end	
	tbCaiPiao:OpenInputUI()
	return 1
end

