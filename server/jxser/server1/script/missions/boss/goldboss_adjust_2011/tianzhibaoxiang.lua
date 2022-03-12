-- ÎÄ¼þÃû¡¡£ºtianzhibaoxiang.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£ºÌìÖ®±¦Ïä 
-- ´´½¨Ê±¼ä£º2011-10-01 01:12:36

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")

local nProtectTime = 60  -- ÌìÖ®±¦Ïä¾ßÓÐ60Ãë±£»¤Ê±¼ä

function main()
--	print("ÌìÖ®±¦Ïä±»µã»÷")
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if check(nNpcIdx, PlayerIndex) ~= 1 then
		Msg2Player("Ng­¬i kh«ng thÓ lÊy vËt phÈm cña ng­êi kh¸c")
		return
	end
	--¿ªÆô½ø¶ÈÌõ
	tbProgressBar:OpenByConfig(11, getbox, {nNpcIdx, dwNpcId},onbreak)

end

function check(nNpcIdx, nPlayerIndex)
	local tbCreatTime = GetNpcParam(nNpcIdx, 1)
	local nNowTime = GetLocalTime()
	if nNowTime-tbCreatTime > %nProtectTime then
		return 1
	end
	local nTeamSize = GetNpcParam(nNpcIdx, 2)
	local tbTeam = {}
	for i=1, nTeamSize do
		if nPlayerIndex == GetNpcParam(nNpcIdx, i + 2) then
			return 1
		end
	end
	return 0
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function onbreak()
	Msg2Player("Thu thËp ®øt ®o¹n")
end

function getbox(nNpcIndex, dwNpcId)
--	print("nNpcIndex = " .. nNpcIndex)
	local tbAward = { {szName="B¶o R­¬ng Boss",tbProp={6,1,3021,1,0,0},} }
--	print("²É¼¯³É¹¦")
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	DelNpc(nNpcIndex)
--	print("¸ø½±Àø")
	tbAwardTemplet:Give(tbAward, 1, {"goldbossadjust_2011", "click_tianzhibaoxiang"} )
	return 1
end
