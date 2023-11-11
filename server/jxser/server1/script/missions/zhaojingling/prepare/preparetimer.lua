Include("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua")

PrepareGame.nPassTime = 0 --Ã¿³¡±¨Ãû¿ªÊ¼µ½ÏÖÔÚ×ß¹ıµÄÊ±¼ä


function PrepareGame:InitTimer()
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return
	end
	
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	
	self.nPassTime = 0
	local nTime = 1 * 60
	self.nTimeIndex = AddTimer(nTime * 18, "PrepareGame:OnTime", 0)
	Msg2Map(PREPARE_MAP, "TrËn huÊn luyÖn Méc Nh©n míi ®· b¾t ®Çu")
	AddGlobalNews("B¸o danh Hoµng Thµnh HuÊn LuyÖn Cung b¾t ®Çu, xin c¸c ch­ vŞ hiÖp kh¸ch nhanh chãng ®Õn L©m An tham gia b¸o danh t¹i Quan nh¾c nhë")
end

function PrepareGame:OnTime(nTimerId, nParam)
	if SubWorldID2Idx(PREPARE_MAP) <= 0 then
		return 0, 0
	end
	
	self.nPassTime = self.nPassTime + 60
	local nRestTime = PREPARETIME * 60 - self.nPassTime
	if nRestTime > 0 then
		Msg2Map(PREPARE_MAP, format("Cßn %d phót trËn ®Êu t×m Méc Nh©n sÏ b¾t ®Çu", floor(nRestTime / 60)))
		return 60 * 18, 0
	end
	
	------¿ªÆô±ÈÈü,½«Íæ¼Ò´«ËÍ½ø±ÈÈü³¡---
	self:GoToGame()
	DynamicExecute("\\script\\missions\\zhaojingling\\game\\gametimer.lua", "Game:InitTimer")
	return 0, 0
end

