Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tb_NSKT_ChallengeOfTime = {}

function tb_NSKT_ChallengeOfTime:giveAward()
	if(tbNSKT_head:isActive() ~= 1) then
		return 0
	end
	
	local szNote = "Event Ngò s¾c kÕt tinh_V­ît qua ¶i 17"	
	
	local tbNSKTList = tbNSKT_head:getRandomKT(10)
	if(getn(tbNSKTList) ~= 3) then				
		return 0
	end
	
	for i = 1, getn(tbNSKTList) do
		if(tbNSKTList[i].nCount > 0)then
			PlayerFunLib:GetItem({tbProp = {6,1, tbNSKTList[i].nID, 1, 0, 0}, nExpiredTime = tbNSKT_head.nEndDay,}, tbNSKTList[i].nCount,  szNote)
		end
	end	
	return 1
end

