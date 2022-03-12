-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - ¶à´Î×ªÉúÍ·ÎÄ¼þ
-- ÎÄ¼þÃû¡¡£ºtask_func.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-02-04 16:21:20

-- ======================================================

IncludeLib("LEAGUE");
IncludeLib("SETTING");
IncludeLib("FILESYS");
IncludeLib("ITEM");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

-- ¼ÇÂ¼ÔÚµÚ n_transcount ´Î×ªÉúÊ± µÄµÈ¼¶ ºÍËùÑ¡¿¹ÐÔ
function zhuansheng_set_gre(n_transcount, n_level, n_resist)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte, n_level);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte+1, n_resist);
	SetTask(n_taskid, n_taskvalue);
	--WriteLog(format("zhuansheng_set_gre:%d,%d,%d,byte:%d,id:%d", n_transcount, n_level, n_resist,n_taskbyte, n_taskid))
	return 1;
end

-- ·µ»ØµÚn_transcount´Î×ªÉú µÈ¼¶ºÍËùÑ¡¿¹ÐÔ
function zhuansheng_get_gre(n_transcount)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	
	return GetByte(n_taskvalue, n_taskbyte),GetByte(n_taskvalue, n_taskbyte+1)
end

-- ×ªÉúÏ´µôËùÓÐ¼¼ÄÜµã£¬²¢Ôö¼Ó×ªÉú»ñµÃµÄ¶îÍâ npoint ¼¼ÄÜµã
function zhuansheng_clear_skill(nlevel, npoint)
	local nskill1 = HaveMagic(210);	--±£ÁôÇá¹¦
	local nskill2 = HaveMagic(400);	--±£Áô¡°½Ù¸»¼ÃÆ¶¡±
	local nallskill = RollbackSkill();	-- Çå³ýÍ¶µã¼¼ÄÜ£¬²»·µ»Ø¼¼ÄÜµã
	if (nskill1 ~= -1) then			--·µ»ØÇá¹¦
		nallskill = nallskill - nskill1;
		AddMagic(210, nskill1);
	end
	
	if (nskill2 ~= -1) then			--·µ»Ø¡°½Ù¸»¼ÃÆ¶¡±
		nallskill = nallskill - nskill2;
		AddMagic(400, nskill2);
	end
	--nallskill = nallskill - (nlevel -1)	--×ªÉúÖ»¿ÛµôÉý¼¶Ê±¸øÓëµÄ¼¼ÄÜµã
	AddMagicPoint(npoint + nallskill);
end

-- ×ªÉúÏ´µôËùÓÐÇ±ÄÜµã£¬²¢Ôö¼Ó×ªÉú»ñµÃµÄ¶îÍâ npoint Ç±ÄÜµã
function zhuansheng_clear_prop(nlevel, npoint, nseries)
	if (not nseries) then
		nseries = GetSeries();
	end
	
	nseries = nseries + 1;
	local Utask88 = GetTask(88)-- ½«ÒÑ·ÖÅäÇ±ÄÜÖØÖÃ£¨task(88)ÊÇÈÎÎñÖÐÖ±½Ó½±ÀøµÄÁ¦Á¿¡¢Éí·¨µÈ£©
	AddProp(100)			-- Îª±ÜÃâÃ»ÓÐÎ´·ÖÅäÇ±ÄÜµã¿É¹©ÐÞ¸´µÄ¼«¶ËÇé¿ö£¬ÔÝÊ±¡°½è¡±¸øËû100µã

	AddStrg(TB_BASE_STRG[nseries] - GetStrg(1) + GetByte(Utask88,1));
	AddDex(TB_BASE_DEX[nseries] - GetDex(1) + GetByte(Utask88,2));
	AddVit(TB_BASE_VIT[nseries] - GetVit(1) + GetByte(Utask88,3));
	AddEng(TB_BASE_ENG[nseries] - GetEng(1) + GetByte(Utask88,4));
	local nallprop = GetProp();
	--nallprop = nallprop - (nlevel - 1) * 5;	--×ªÉúÖ»¿ÛµôÉý¼¶Ê±¸øÓëµÄÇ±ÄÜµã
	AddProp(npoint-100);
end


-- ¼ì²éÊÇ·ñ»¹ÓÐÕ½¶Ó¹ØÏµ
function check_zhuansheng_league(ntype)
	local nlg_idx = LG_GetLeagueObjByRole(ntype,GetName());
	if (nlg_idx ~= nil and nlg_idx ~= 0) then
		return 1;			--ÓÐÕ½¶Ó¹ØÏµ
	else
		return 0;			--ÎÞÕ½¶Ó¹ØÏµ
	end
end

-- ¼ì²éµ±Ç°×ªÉú´ÎºÍµÈ¼¶ÊÇ·ñÄÜ¹»ÔÙ×ªÉú
function check_zhuansheng_level()
	local nlevel = GetLevel();
	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount >= NTRANSLIFE_MAX) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[7], "§­îc råi./OnCancel"});
		return 0;
	end
	
	
	if (not TB_LEVEL_REMAIN_PROP[nlevel] or not TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[5], "§­îc råi./OnCancel"});
		return
	end
	
	if (nlevel < TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({"<dec><npc>"..format("T¹i lÇn chuyÓn sinh thø (%d), ®¼ng cÊp chÝ Ýt còng ph¶i %d!", (ntranscount + 1), TB_LEVEL_LIMIT[ntranscount + 1]), " KÕt thóc ®èi tho¹i!/OnCancel"});
		return 0;
	end
	
	return 1;
end

function OnCancel()
end

function zhuansheng_check_common()

	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount ~= 0) then
		local bResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\head.lua", "tbZhengtuCompensate:CheckGetTransLife")
		if bResult == 1 and ntranscount == 4 then
		
		else
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], TB_TRANSTIME_LIMIT[ntranscount]), "§­îc råi./OnCancel"});
				return 0;
			end
		end
	end

	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ng­¬i ®· nhËn nhiÖm vô kü n¨ng 150, xin h·y hoµn thµnh nhiÖm vô råi h·y ®Õn gÆp ta")
		return  0
	end

	--type=2 ºÃÏñÊÇÉíÉÏ
	--type=3 Ó¦¸ÃÊÇ±³°ü
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "§­îc råi./OnCancel"});
		return 0
	end

--	if ntranscount < 3 and (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then	--Õ½¶Ó¹ØÏµ
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "§­îc råi./OnCancel"});
--		return 0
--	end
	if (GetTask(TSK_KILLER_ID) ~= 0) then	--É±ÊÖÈÎÎñÍê³É
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[8], "§­îc råi./OnCancel"});
		return 0
	end
	if (GetTask(TSK_MESSENGER_FENG) ~= 0 or GetTask(TSK_MESSENGER_SHAN) ~= 0 or GetTask(TSK_MESSENGER_QIAN) ~= 0 ) then	--ÐÅÊ¹ÈÎÎñÍê³É
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[9], "§­îc råi./OnCancel"});
		return 0
	end
--close check quest Da Tau
--	if (GetTask(TSK_TASKLINK_STATE) ~= 3 and GetTask(TSK_TASKLINK_STATE) ~= 0) then	--Ò°ÛÅÈÎÎñÍê³É
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[10], "§­îc råi./OnCancel"});
--		return 0
--	end
--	
--	if GetTask(TSK_TASKLINK_CancelTaskLevel) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp1) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp2) ~= 0 then
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[11], "§­îc råi./OnCancel"});
--		return 0
--	end
	
	if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then							--»ù´¡ÆªµÄÑ§Ï°
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "§­îc råi./OnCancel"});
		return 0;
	end
	
	return 1
end

--ÌØÊâ´¦ÀíÍæ¼ÒµÄÈÎÎñ±äÁ¿£¬ÓÃÓÚÐÞÕýÍæ¼Ò×ªÉúËùÊ¹ÓÃµÄÈÎÎñ±äÁ¿
--TSK_ZHUANSHENG_GRE = {2577, 2578, 2579, 2579}	-- Ã¿´Î×ªÉúËùÑ¡µÈ¼¶ºÍ¿¹ÐÔ
--TSK_ZHUANSHENG_GRE = {2577, 2578, 2579, 4107}	--ÐÞ¸Äºó£¬Ã¿´Î×ªÉúËùÑ¡µÈ¼¶ºÍ¿¹ÐÔ
tbTransLifeSpeProcess = {}
--tbTransLifeSpeProcess.SetGreInfo = zhuansheng_set_gre
--tbTransLifeSpeProcess.GetGreInfo = zhuansheng_get_gre

function tbTransLifeSpeProcess:PlayerLogin()
	local n_transcount = ST_GetTransLifeCount()
	local nlevelL6, nresistidL6 = self:GetGreInfo(6);
	local nlevelL7, nresistidL7 = self:GetGreInfo(7);
	print("PlayerLoginProcessSome:",nlevelL7, nresistidL7)
	if n_transcount == 7 and nlevelL7 == 0 and nresistidL7 == 0 then
		self:SetGreInfo(7, nlevelL6, nresistidL6)
	end   
end

function tbTransLifeSpeProcess:SetGreInfo(nTranLife, nParam1, nParam2)
	zhuansheng_set_gre(nTranLife, nParam1, nParam2)
end

function tbTransLifeSpeProcess:GetGreInfo(nTranLife)
	return zhuansheng_get_gre(nTranLife)
end

if login_add then login_add(PlayerLoginProcessSome, 0) end

EventSys:GetType("OnLogin"):Reg(1, tbTransLifeSpeProcess.PlayerLogin, tbTransLifeSpeProcess)