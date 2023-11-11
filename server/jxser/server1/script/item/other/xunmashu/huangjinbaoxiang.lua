
Include("\\script\\event\\other\\xunmashu\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")



local _AddCurExp = function(self, nItemCount, szLogTitle)
	
	local nExp = self.nParam * nItemCount;
	local nRate = 1e6
	
	local nRemainExp = (tbXunMaShu0903.tbTask.nMaxExpFromOther - tbXunMaShu0903.tbTask:GetCurExpFromOther()) * nRate
	
	
	if nRemainExp < nExp then
		nExp = nRemainExp
		Msg2Player(format("§· ®¹t ®Õn kinh nghiÖm cao nhÊt, lÇn nµy chØ thu ®­îc %d kinh nghiÖm.", nExp))
	end
	if nExp > 0 then
		tbAwardTemplet:GiveAwardByList({nExp = nExp}, szLogTitle)
		tbXunMaShu0903.tbTask:AddCurExpFromOther(floor(nExp/1e6))
	end
end


local tbExpAward = 
{
	{pFun = _AddCurExp, nParam = 3e6},
}



function main(nItemIndex)
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "VËt phÈm nµy ®· hÕt h¹n")
		return 0
	end
	
	local bRet, szFailMsg = tbXunMaShu0903:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg.."Kh«ng ®­îc sö dông vËt phÈm nµy.")
		return 1
	end
	
	
	local szItemGroupName = format("%s vµ %s", "Hoµng Kim B¶o r­¬ng", "B¶o r­¬ng B¹ch Kim")
	if tbXunMaShu0903.tbTask:CheckExpFromOther() ~= 1 then
		Talk(1, "", format("Sö dông %s cã thÓ nhËn nhiÒu nhÊt %u kinh nghiÖm", szItemGroupName, tbXunMaShu0903.tbTask.nMaxExpFromOther * 1e6) )
		return 1
	end
	
	tbAwardTemplet:GiveAwardByList(%tbExpAward, "use huang jin bao xiang")

	
	
end