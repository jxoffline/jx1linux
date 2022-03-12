function GetDesc(nItem)
	return ""
end

--µ÷ÊÔ·ûÖ½¶Ô¶àÉÙ·¶Î§ÄÚµÄ¹ÖÆð×÷ÓÃ
function testAround(nDist)
    local tbList,nCount = GetAroundNpcList(nDist, 8)
    	for i = 1,nCount do
    		local nNpcIndex = tbList[i]
    		local nNpcId = GetNpcSettingIdx(nNpcIndex)
    		if nNpcId == 849 then
    			local szNpcName = GetNpcName(nNpcIndex)
    			Msg2Player(format("%s trong ph¹m vi %d", szNpcName, nDist))
    		end
    end
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
			Msg2Player(szNpcName.."Kh¸ng háa cña ®· gi¶m xuèng")
			AddNpcSkillState(nNpcIndex, 1041, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("Ng­¬i sö dông 1 TriÖt Háa Phï")
	WriteLog(format("Account:%s[Name:%s] sö dông TriÖt Háa Phï.",
				GetAccount(),
				GetName())
			);
	return
end
