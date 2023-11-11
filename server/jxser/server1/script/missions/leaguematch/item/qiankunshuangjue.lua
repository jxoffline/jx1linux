Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	PlayerFunLib:AddSkillState(980,2,3,46656000,1)--18*60*60*24*30=46656000 30Ìì
	PlayerFunLib:AddSkillState(966,2,3,46656000,1)--18*60*60*24*30=46656000 30Ìì
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Sö dông Cµn Kh«n Song TuyÖt Béi".."\t".. GetAccount().."\t"..GetName())
end

