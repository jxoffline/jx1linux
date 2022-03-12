--====Storm LogOut脚本====--
Include("\\script\\event\\storm\\function.lua")	--Storm

function storm_logout()
	if storm_valid_game(2) then	--杀手试炼之风暴挑战没有结束
		storm_add_pointex(2, 40)
		storm_end(2, 1)
	end
end
