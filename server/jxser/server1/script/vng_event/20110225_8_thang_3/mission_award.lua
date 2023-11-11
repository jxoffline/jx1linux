Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

if not tbVNGWD2011_Mission then
	tbVNGWD2011_Mission = {}
end

function tbVNGWD2011_Mission:SongJinAward(nRank)
	if tbVNG_WomenDay2011:IsActive() ~= 1 or tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 
	end
	
	local szNote = ""
	local nItemCount = 0
	if (nRank == 3000) then
		szNote =  "[VNG][8thang3][Tèng Kim 3000]";
		nItemCount = 20
	else if (nRank == 1000)then
			szNote =  "[VNG][8thang3][Tèng Kim 1000]";
			nItemCount = 10
		end
	end
	
	local tbAward = {szName="B¸nh M×",tbProp={6,1,30096,1,0,0},nExpiredTime=20110314}
	PlayerFunLib:GetItem(tbAward, nItemCount,  szNote)
end

function tbVNGWD2011_Mission:COT_Award(nBatch)
	if tbVNG_WomenDay2011:IsActive() ~= 1 or tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 
	end
	
	if (nBatch == 17) then
		local szNote = "[VNG][8thang3][V­ît ¶i 17]"	
		local tbAward = {szName="B¸nh M×",tbProp={6,1,30096,1,0,0},nExpiredTime=20110314}
		PlayerFunLib:GetItem(tbAward, 10,  szNote)
	end
	
end