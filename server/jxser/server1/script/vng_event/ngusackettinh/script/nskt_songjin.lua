Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tb_NSKT_SongJin = {}

function tb_NSKT_SongJin:giveAward(nRank)
	if(tbNSKT_head:isActive() ~= 1) then
		return 0
	end
	
	local szNote = ""
	local nKTCount = 0
	if (nRank == 3000) then
		szNote =  "Event Ngò s¾c kÕt tinh_Tong kim cao cap 3000";
		nKTCount = 15
	else if (nRank == 1000)then
			szNote =  "Event Ngò s¾c kÕt tinh_Tong kim cao cap 1000";
			nKTCount = 10
		end
	end
	
	local tbNSKTList = tbNSKT_head:getRandomKT(nKTCount)
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

