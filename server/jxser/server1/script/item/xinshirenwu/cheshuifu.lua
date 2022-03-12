function GetDesc(nItem)
	return ""
end

function main(nItem)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId ~= 395 then
		Msg2Player("VËt phÈm nµy chØ ®­îc sö dông trong b¶n ®å Thiªn B¶o Khè")
		return 1
	end
	
	local tbList,nCount = GetAroundNpcList(20, 8)--¾àÀë20´ó¸ÅÎªÒ»ÆÁ·¶Î§
	for i = 1,nCount do
		local nNpcIndex = tbList[i]
		local nNpcId = GetNpcSettingIdx(nNpcIndex)
		if nNpcId == 849 then
			local szNpcName = GetNpcName(nNpcIndex)
			Msg2Player(szNpcName.."Kh¸ng b¨ng cña ®· gi¶m xuèng")
			AddNpcSkillState(nNpcIndex, 1040, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("Ng­¬i sö dông mét TriÖt Thñy Phï")
	WriteLog(format("Account:%s[Name:%s] sö dông TriÖt B¨ng Phï.",
				GetAccount(),
				GetName())
			);
	return
end
