Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

if not tbVNG_LY2011Mission then
	tbVNG_LY2011Mission = {}
end

function tbVNG_LY2011Mission:SongJinAward(nRank)
	if(tbVNG_LY2011:isActive() ~= 1) then
		return 0
	end
	
	local szNote = ""
	local nItemCount = 0
	if (nRank == 3000) then
		szNote =  "[VNG][LunarYear2011][Tèng Kim  3000]";
		nItemCount = 8
	else if (nRank == 1000)then
			szNote =  "[VNG][LunarYear2011][Tèng Kim  1000]";
			nItemCount = 4
		end
	end
	
	local tbBanhChung = {szName="B¸nh Ch­ng",tbProp={6,1,30086,1,0,0},nExpiredTime=tbVNG_LY2011.nEndDay}
	PlayerFunLib:GetItem(tbBanhChung, nItemCount,  szNote)
end

function tbVNG_LY2011Mission:COT_Award(nBatch)
	if(tbVNG_LY2011:isActive() ~= 1) then
		return 0
	end
	
	if (nBatch == 17) then
		local szNote = "[VNG][LunarYear2011][V­ît ¶i 17]"	
		local tbBanhChung = {szName="B¸nh Ch­ng",tbProp={6,1,30086,1,0,0},nExpiredTime=tbVNG_LY2011.nEndDay}
		PlayerFunLib:GetItem(tbBanhChung, 6,  szNote)
	end
	
end