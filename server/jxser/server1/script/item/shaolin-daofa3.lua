--Created by fangjieying 2003-5-17 
--《少林刀法·卷三》
--学会无相斩技能
--少林，80级以上可用
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(321)
	if(party ~= "shaolin") then							-- 不是少林
		Msg2Player("B筺 nghi猲 c鴘 Thi誹 L﹎ o ph竝 - Quy觧 3 頲 n鯽 ng祔, nh璶g v蒼 ch璦 l躰h ng� 頲 g�. ")
		return 1
	elseif(GetLever < 80) then							-- 是少林但未到80级
		Msg2Player("B筺 nghi猲 c鴘 Thi誹 L﹎ o ph竝 - Quy觧 3 頲 n鯽 ng祔, l躰h ng� 頲 r蕋 輙. ")
		return 1
	elseif(skill ~= -1) then							-- 已学过该技能
		Msg2Player("B筺  nghi猲 c鴘 k� Thi誹 L﹎ o ph竝 - Quy觧 3, nh璶g v蒼 ch璦 h鋍 頲 g�. ")
		return 1
	else
		AddMagic(321,1)										-- 学会技能
		Msg2Player("H鋍 頲 k� n╪g V� Tng Tr秏. ")
		return 0
	end
end