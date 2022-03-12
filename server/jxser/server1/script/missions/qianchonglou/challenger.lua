Include("\\script\\missions\\qianchonglou\\common.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local DEFAULT_GAME_TIME = 60*60*2   -- ¸±±¾ÓÎÏ·Ê±¼ä
local DEFAULT_BASE_POINT = 200      -- ³õÊ¼µÄ»ù´¡·Ö
local DEFAULT_AWARD_POINT_MAX = 800 -- ³õÊ¼µÄ½±Àø·ÖÉÏÏÞ
local DEFAULT_AWARD_POINT_ADD = 200 -- Ê¹ÓÃÒ»¸öåóÅÚÁî·ûÔö¼ÓµÄ½±Àø·ÖÉÏÏÞÖµ

-- µ¥¸öÍæ¼Ò

-- »ñÈ¡åóÅÚÁîÅÆµÄÊ¹ÓÃÊýÁ¿
function tbPlayerHandle:GetDailyLimit()
	return GetTask(%TSK_DAILY_LIMIT)
end

-- ÉèÖÃåóÅÚÁîÅÆµÄÊ¹ÓÃÊýÁ¿
function tbPlayerHandle:SetDailyLimit(nCount)
	SetTask(%TSK_DAILY_LIMIT, nCount)
end

-- Ôö¼ÓåóÅÚÁîÅÆµÄÊ¹ÓÃÊýÁ¿
function tbPlayerHandle:AddDailyLimit(nCount)
	self:SetDailyLimit(self:GetDailyLimit() + nCount)
end

-- »ñÈ¡½±Àø·ÖÉÏÏÞ
function tbPlayerHandle:GetAwardPointMax()
	-- Ã¿Ê¹ÓÃÒ»¸öåóÅÚÁîÅÆ£¬½±Àø·ÖÉÏÏÞÔö¼Ó200
	return tonumber(self:GetDailyLimit()) * %DEFAULT_AWARD_POINT_ADD + %DEFAULT_AWARD_POINT_MAX
end

-- ¼ì²éÓÎÏ·ÈÕÆÚ
function tbPlayerHandle:CheckDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return GetTask(%TSK_DATE) == nCurDate
		
end

-- ¸üÐÂº¯Êý£ºµ½ÁËµÚ¶þÌì£¬ÈÎÎñ±äÁ¿»Ö¸´Ä¬ÈÏÖµ
function tbPlayerHandle:Update()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(%TSK_DATE) ~= nCurDate then
		SetTask(%TSK_DATE, nCurDate)
		self:SetBasePoint(%DEFAULT_BASE_POINT)
		self:SetPlayTime(%DEFAULT_GAME_TIME)
		self:SetDailyLimit(0)
		self:SetAwardPoint(0)
		self:SetAwardPointExchange(0)
	end
end

-- ÉèÖÃ»ù´¡·Ö
function tbPlayerHandle:SetBasePoint(nPoint)
	return SetTask(%TSK_BASE_POINT, nPoint)
end

-- Ôö¼Ó»ù´¡·Ö
function tbPlayerHandle:AddBasePoint(nPoint)
	self:SetBasePoint(self:GetBasePoint() + nPoint)
end

-- ÉèÖÃ½±Àø·Ö
function tbPlayerHandle:SetAwardPoint(nPoint)
	return SetTask(%TSK_AWARD_POINT, nPoint)
end

-- Ôö¼Ó½±Àø·Ö
function tbPlayerHandle:AddAwardPoint(nPoint)
	self:SetAwardPoint(self:GetAwardPoint() + nPoint)
end

-- ÉèÖÃ½±Àø·ÖµÄ¶Ò»»Öµ
function tbPlayerHandle:SetAwardPointExchange(nPoint)
	SetTask(%TSK_AWARD_POINT_EXCHANGE, nPoint)
end

-- Ôö¼Ó½±Àø·ÖµÄ¶Ò»»Öµ
function tbPlayerHandle:AddAwardPointExchange(nPoint)
	self:SetAwardPointExchange(self:GetAwardPointExchange() + nPoint)
end

-- ÉèÖÃ¸±±¾Ê±¼ä
function tbPlayerHandle:SetPlayTime(nTime)
	return SetTask(%TSK_PLAY_TIME, nTime)
end

-- Éä»÷
function tbPlayerHandle:UseGun(nGunRank, nX,  nY)
	if nGunRank > 0 then
		local nLeftBasePoint = self:GetBasePoint() - nGunRank
		
		if nLeftBasePoint < 0 then
			local nLeftAwardPoint = self:GetAwardPoint() + nLeftBasePoint
			if nLeftAwardPoint < 0 then
				return Msg2Player("Sè ®iÓm kh«ng ®ñ")
			else
				self:SetBasePoint(0)
				self:SetAwardPoint(nLeftAwardPoint)
			end
		else
			self:AddBasePoint(-nGunRank)
		end
		
		CastSkill(1202, nGunRank, nX,  nY)
	end
end

-- ´ò¿ª¸±±¾µÄÌáÊ¾Ãæ°å
function tbPlayerHandle:OpenFisherUi(nEndTime)
	if not nEndTime then
		return
	end
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_OPEN_UI)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nEndTime)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- ¹Ø±Õ¸±±¾µÄÌáÊ¾Ãæ°å
function tbPlayerHandle:CloseFisherUi()
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_CLOSE_UI)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 0)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- ÉèÖÃ¶îÍâµÄ´óÅÚ
function tbPlayerHandle:SetExtraGun()
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_EXTRA_GUN)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 1)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- ¸±±¾ÖÐµÄÏûÏ¢ÏìÓ¦£ºÍË³ö¡¢Éè¼Æ
function tbPlayerHandle:ProcessProtocol(nOption, tbParam)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		self:CloseFisherUi()
		return 
	end
	if self.OPERATION_QUIT == nOption then
		pDungeon:close()
	elseif self.OPERATION_USE_GUN == nOption then
		local nGunRank, nX,  nY = unpack(tbParam)
		pDungeon:UseGun(nGunRank, nX,  nY)
	end
end

-- ÌôÕ½Õß£º´æ´¢¸±±¾ÖÐËùÓÐµÄÍæ¼Ò
tbChallenger = {}
-- Ôö¼ÓÐÂµÄÌôÕ½Õß
function tbChallenger:new()
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb.szName = GetName()
	local nMapId, nX, nY = GetWorldPos()
	tb.tbLastPos = {nMapId, nX, nY}
	tb.nExtraPower = 0
	
	return tb
end

-- ¸üÐÂµ±Ç°Íæ¼Ò
function tbChallenger:Update()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.Update, %tbPlayerHandle)
	end
end

-- Ìí¼Ó½±Àø·Ö
function tbChallenger:AddAwardPoint(nPoint)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.AddAwardPoint, %tbPlayerHandle, nPoint)
	end
end

-- ½øÈëµØÍ¼£¬ÉèÖÃÍæ¼Ò×´Ì¬
function tbChallenger:OnEnterMap()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, SetFightState, 1)
		CallPlayerFunction(nPlayerIndex, SetMoveSpeed, 0)
		CallPlayerFunction(nPlayerIndex, ForbitSkill, 1)
		
		CallPlayerFunction(nPlayerIndex, DisabledStall, 1)
		CallPlayerFunction(nPlayerIndex, LeaveTeam)
		CallPlayerFunction(nPlayerIndex, DisabledUseTownP, 1)
		CallPlayerFunction(nPlayerIndex, ForbitAura, 1)
		
		CallPlayerFunction(nPlayerIndex, ChangeOwnFeature, 0,0, 1906)
	end
end

-- Àë¿ªµØÍ¼£¬ÉèÖÃÍæ¼Ò×´Ì¬
function tbChallenger:OnLeaveMap()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, SetMoveSpeed, -1)
		CallPlayerFunction(nPlayerIndex, SetFightState, 0)
		CallPlayerFunction(nPlayerIndex, ForbitSkill, 0)
		
		CallPlayerFunction(nPlayerIndex, DisabledStall, 0)
		CallPlayerFunction(nPlayerIndex, LeaveTeam)
		CallPlayerFunction(nPlayerIndex, DisabledUseTownP, 0)
		CallPlayerFunction(nPlayerIndex, ForbitAura, 0)	
		CallPlayerFunction(nPlayerIndex, RestoreOwnFeature)	
	end
end

-- »ñÈ¡Íæ¼ÒÊ±¼ä
function tbChallenger:GetPlayTime()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		return CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.GetPlayTime, %tbPlayerHandle)
	end
end

-- ÉèÖÃÍæ¼ÒÊ±¼ä
function tbChallenger:SetPlayTime(nTime)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		return CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.SetPlayTime, %tbPlayerHandle, nTime)
	end
end

-- ÍË³ö¸±±¾Ê±£¬»Øµ½Ô­À´Î»ÖÃ
function tbChallenger:GoToLastPos()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, NewWorld, self.tbLastPos[1], self.tbLastPos[2], self.tbLastPos[3])
	end
end

-- ÉèÖÃÌØÊâ´óÅÚ
function tbChallenger:SetExtraGun()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.SetExtraGun, %tbPlayerHandle)
	end
end

-- Ê¹ÓÃÆÕÍ¨µÄÅÚÉä»÷
function tbChallenger:UseGun(nGunRank, nX,  nY)
	
	
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.UseGun, %tbPlayerHandle, nGunRank, nX,  nY)
	end
end

-- Ê¹ÓÃÌØÊâµÄ´óÅÚÉä»÷
function tbChallenger:UseExtraGun(nX,  nY)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, CastSkill, 1203, 1, nX,  nY)
	end
end
