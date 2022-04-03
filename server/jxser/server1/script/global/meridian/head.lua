Include("\\script\\global\\meridian\\common.lua")

tbReqHuMaiDan = tbReqHuMaiDan or {}
tbReqHuMaiDan.HuMaiDan = {6, 1, 3203}
tbReqHuMaiDan.DaHuMaiDan = {6, 1, 4418}
tbReqHuMaiDan.nDaHuMaiDa2HuMaiDan = 1000

function tbReqHuMaiDan:Check(nReqCount)
	local nOwnHMD = CalcItemCount(3, self.HuMaiDan[1], self.HuMaiDan[2], self.HuMaiDan[3], -1)
	if nOwnHMD < nReqCount then
		local nRate = self.nDaHuMaiDa2HuMaiDan
		local nRemainHMD = nOwnHMD - mod(nReqCount, nRate)
		if nRemainHMD < 0 then
			Msg2Player(format("Muèn xung kai huyÖt vÞ nµy cÇn %d Hé M¹ch §¬n, Hé M¹ch §¬n cña c¸c h¹ kh«ng ®ñ!", nReqCount))
			return 0
		end
		local nDHMD = CalcItemCount(3, self.DaHuMaiDan[1], self.DaHuMaiDan[2], self.DaHuMaiDan[3], -1)
		if (nDHMD * nRate + nOwnHMD < nReqCount) then
			Msg2Player(format("Muèn xung kai huyÖt vÞ nµy cÇn %d Hé M¹ch §¬n, Hé M¹ch §¬n cña c¸c h¹ kh«ng ®ñ!", nReqCount))
			return 0
		end
	end
	return 1
end

function tbReqHuMaiDan:CalacHuMaiDan(nTotalHuMaiDan)
	local nBindHMD = 0
	local nExpiredTimeHMD = 0
	local nNormalHMD = 0
	local nDaHuMaiDan = CalcEquiproomItemCount(self.DaHuMaiDan[1], self.DaHuMaiDan[2], self.DaHuMaiDan[3], -1)
	
	if nDaHuMaiDan * self.nDaHuMaiDa2HuMaiDan >= nTotalHuMaiDan then
		nDaHuMaiDan = floor(nTotalHuMaiDan / self.nDaHuMaiDa2HuMaiDan)
		if nDaHuMaiDan * self.nDaHuMaiDa2HuMaiDan == nTotalHuMaiDan then
			return nDaHuMaiDan, nExpiredTimeHMD, nBindHMD, nNormalHMD
		end
	end
	
	local nNeedHMD = nTotalHuMaiDan - nDaHuMaiDan * self.nDaHuMaiDa2HuMaiDan
	if nNeedHMD <= 0 then
		return nDaHuMaiDan, nExpiredTimeHMD, nBindHMD, nNormalHMD
	end
	
	nExpiredTimeHMD = CalcEquiproomItemCountEx(self.HuMaiDan[1], self.HuMaiDan[2], self.HuMaiDan[3], -1, -1, 1)
	if nExpiredTimeHMD >= nNeedHMD then
		nExpiredTimeHMD = nNeedHMD
		return nDaHuMaiDan, nExpiredTimeHMD, nBindHMD, nNormalHMD
	end
	
	nNeedHMD = nNeedHMD - nExpiredTimeHMD
	nBindHMD = CalcEquiproomItemCountEx(self.HuMaiDan[1], self.HuMaiDan[2], self.HuMaiDan[3], -1, 1, 0)
	if nBindHMD >= nNeedHMD then
		nBindHMD = nNeedHMD
		return nDaHuMaiDan, nExpiredTimeHMD, nBindHMD, nNormalHMD
	end
	
	nNeedHMD = nNeedHMD - nBindHMD
	nNormalHMD = CalcEquiproomItemCountEx(self.HuMaiDan[1], self.HuMaiDan[2], self.HuMaiDan[3], -1, 0, 0)
	if nNormalHMD >= nNeedHMD then
		nNormalHMD = nNeedHMD
		return nDaHuMaiDan, nExpiredTimeHMD, nBindHMD, nNormalHMD
	end
	
	return
end

function tbReqHuMaiDan:ConsumeHMD(nDaHuMaiDan, nTimeHMD, nBindHMD, nNormalHMD)
	if nDaHuMaiDan > 0 and ConsumeEquiproomItem(nDaHuMaiDan, self.DaHuMaiDan[1], self.DaHuMaiDan[2], self.DaHuMaiDan[3], -1) ~= 1 then
		return 0
	end
	if nTimeHMD > 0 and (ConsumeEquiproomItemEx(nTimeHMD, self.HuMaiDan[1], self.HuMaiDan[2], self.HuMaiDan[3], -1, -1, 1) ~= 1) then
		return 0
	end
	if nBindHMD > 0 and (ConsumeEquiproomItemEx(nBindHMD, self.HuMaiDan[1], self.HuMaiDan[2], self.HuMaiDan[3], -1, 1, 0) ~= 1) then
		return 0
	end
	if nNormalHMD > 0 and (ConsumeEquiproomItemEx(nNormalHMD, self.HuMaiDan[1], self.HuMaiDan[2], self.HuMaiDan[3], -1, 0, 0) ~= 1) then
		return 0
	end
	return 1
end

function tbReqHuMaiDan:Consume(nNeedHMD)
	local nDaHuMaiDan, nTimeHMD, nBindHMD, nNormalHMD = self:CalacHuMaiDan(nNeedHMD)
	if not nDaHuMaiDan then
		return 0
	end
	if self:ConsumeHMD(nDaHuMaiDan, nTimeHMD, nBindHMD, nNormalHMD) ~= 1 then
		return 0
	end
	return 1
end
