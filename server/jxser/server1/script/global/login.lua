Include("\\script\\global\\login_head.lua")
-- µÇÂ¼½Å±¾
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) Ìí¼Ó×Ô¶¯¸üÐÂ¼¼ÄÜ¹¦ÄÜ
-- Update: FanZai ¸ÄÓÃÐÂµÄ»úÖÆ£¬Ö»ÐèÈ¥µôInclude¾Í¿ÉÒÔÊµÏÖ¹¦ÄÜ¿ª¹Ø


--Ò»°ãÖ»ÐèÐÞ¸Ä£¨Ìí¼Ó/É¾³ý£©ÕâÀïµÄIncludeÎÄ¼þ£º
--£¨ÔÚÎÄ¼þÖÐÖ´ÐÐÒ»ÏÂlogin_add(fun, n_time)¼´¿É£¬Àý×Ó²Î¼û"\\script\\missions\\leaguematch\\wlls_login.lua"£©
--================================================================
Include("\\script\\global\\login_old.lua")	--¾ÉµÄLogin½Å±¾£¨°üº¬¶à¸ö»î¶¯£©
Include("\\script\\missions\\leaguematch\\wlls_login.lua")	--WLLSÎäÁÖÁªÈü
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")	--if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
Include ("\\script\\global\\login_hint.lua")	--µÇÂ½»î¶¯ÌáÊ¾
--================================================================
Include("\\script\\worldrank\\vngglobalvar.lua")
Include("\\script\\worldrank\\vngtop10.lua")
Include("\\script\\worldrank\\xephang.lua")
--================================================================
Include("\\script\\activitysys\\g_activity.lua")	

if (GetProductRegion() ~= "vn") then
	Include("\\script\\global\\chuangong_login.lua")
	Include("\\script\\task\\lv120skill\\head.lua")	-- 120¼¶¼¼ÄÜÈÎÎñ

	-- LLG_ALLINONE_TODO_20070802 ´ýÈ·ÈÏ
	-- Include("\\script\\battles\\battle_login.lua")	--ËÎ½ðÈÙÓþ½±ÀøµÄÌáÊ¾
end

if (GetProductRegion() == "cn_ib") then
	-- Include("\\script\\misc\\spreader\\emigration.lua")
	-- Include("\\script\\misc\\lost_item\\takelostitem.lua")
	-- Include([[\script\item\ib\tishenzhiren.lua]])	-- ÌæÉíÖ½ÈË
	Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua");	-- ÌìÖ®Óñçô
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")

--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
function main(bExchangeIn)
--================================================================
XepHang()
tbTop10:LuuDSNhanVat()
--================================================================
	--tinhpn 20110223:Reset pass ruong
	ResetBox:AnnounceResetBoxDate()

--DisabledStall(1); -- cÊm ngåi b¸n
 
if HaveCommonItem(6,1,1266)<1 then
tbAwardTemplet:GiveAwardByList({{szName="Phï",tbProp={6,1,1266,1,0},nCount=1,},}, "npctest", 1);
elseif HaveCommonItem(6,1,438)<1 then
tbAwardTemplet:GiveAwardByList({{szName="Phï",tbProp={6,1,438,1,0},nCount=1,},}, "npctest", 1);
elseif HaveCommonItem(6,1,5121)<1 then
tbAwardTemplet:GiveAwardByList({{szName="LÖnh Bµi Test Server",tbProp={6,1,5121,1,0},nCount=1,},}, "npctest", 1);
end

	if (GetLevel() >= 60) then--xãa skill hæ trî t©n thñ
		if (GetSkillState(1594) > 0) then
			RemoveSkillState(1594)
		end
	end
	if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
		Msg2Player("§ang trong thêi gian ho¹t ®éng Online NhËn Th­ëng")
		OnlineAward_ResetDaily()
		OnlineAward_SummaryOnlineTime()
		OnlineAward_StartTime()
	end
	
	PlayerList:AddPlayer(PlayerIndex)
	--ÔØÈëÈ«²¿login½Å±¾
	if (TB_LOGIN_FUN[0]) then
		for i = 1, getn(TB_LOGIN_FUN[0]) do
			local func = TB_LOGIN_FUN[0][i]
			if (func) then
				func(bExchangeIn)
			end
		end
	end
	--DonSachRuong()
	
	G_ACTIVITY:OnMessage("OnLogin", PlayerIndex)
	
	
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local reg = TB_LOGIN_FILEFUN[i]
		DynamicExecute(reg[1], reg[2], PlayerIndex, bExchangeIn)
	end
	EventSys:GetType("OnLogin"):OnPlayerEvent(0, PlayerIndex, bExchangeIn)
	TaskManager:ResetUseGroup()
	LoginDelaySync(1)  -- 1 ±íÊ¾ÐèÒªÑÓÊ±Í¬²½Êý¾Ý, 0 ±íÊ¾²»ÐèÒª
	-- ÇëÎðÔÚ´Ëº¯ÊýÖÐÖ±½ÓÌí¼ÓÂß¼­´¦Àí£¬Çë·â×°³Éº¯Êý²¢Í¨¹ýlogin_add·ÅÖÃµ½TB_LOGIN_FUN[0]Êý×éÀï
end




function DonSachRuong()
Say(" dän!")
	local tbItems = {}
			tbItems = GetRoomItems(0);
			if (getn(tbItems) > 0) then
				for i = 1, getn(tbItems) do
					RemoveItemByIndex(tbItems[i],-1);
				end
			end
end
-------------------------------------------
--  ¹¦ÄÜ£ºµÇÂ¼Ê±£¬ÑÓÊ±Í¬²½Ò»Ð©²»Ó°ÏìÏµÍ³ÔËÐÐµÄÊý¾Ýµ½¿Í»§¶Ë£¬¼õÉÙµÇÂ¼ºÄ·ÑµÄÊ±¼ä
--  Ä¿Ç°ÑÓÊ±Ê±¼äÎª2Ãë(¼´£ºÖ´ÐÐmain_delaysyncµÄ¼ä¸ô£ºÁ½Ãë)
--- ²ÎÊý£ºnStep ±íÊ¾µ±Ç°ÊÇµÚ¼¸´ÎÍ¬²½
-- ·µ»Ø£º0 - ±íÊ¾Í¬²½Î´½áÊø£¬ÏµÍ³ÔÚ±¾´Îµ÷ÓÃÍê³Éºó£¬ÈÔ»áÔÙ´Îµ÷ÓÃ main_delaysync
--		 1 - ±íÊ¾ËùÓÐÍ¬²½½áÊø
function main_delaysync(nStep)
	local nDelayCount = EventSys:GetType("OnLogin"):GetDelayCount()
	
	if nStep >= 1 and nStep <= nDelayCount then
		EventSys:GetType("OnLogin"):OnPlayerEvent(nStep, PlayerIndex, bExchangeIn)
	end
	
	if (nStep >= 1 and nStep <= getn(TB_LOGIN_FUN)) then
		if (TB_LOGIN_FUN[nStep]) then
			for i = 1, getn(TB_LOGIN_FUN[nStep]) do
				if (TB_LOGIN_FUN[nStep][i]) then TB_LOGIN_FUN[nStep][i]() end
			end
		end
	end
	
	--ÔËÐÐµÚnStep´ÎÑÓÊ±Í¬²½µÄËùÓÐº¯Êý
	

	if (nStep < getn(TB_LOGIN_FUN) or nStep < nDelayCount) then
		return 0
	else
		return 1
	end
end
function no()
	if chuangong_login ~= nil then
		chuangong_login()
	end
end
