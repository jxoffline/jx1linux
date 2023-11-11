--======================================================================
--Author:   Tan Qingyu
--Date:     2012-3-31 11:01:04
--Describe: ãê¾©µØ¹¬ Èë¿ÚNPC¶Ô»°½Å±¾
--======================================================================

Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\bianjingdigong\\bianjingdigong_head.lua")

function main()
	--Èô¿çÌìÁË£¬ÔòÇå¿ÕµØ¹¬Ê±¼ä»ýÀÛÈÎÎñ±äÁ¿
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	
	local tbOpenDate = BJDG_HEAD.tbOpenDate
	local nIsOpen = BJDG_HEAD.nIsOpen
	
	if (nIsOpen == 0) or (nCurDate < tbOpenDate.nBegin) or (nCurDate >= tbOpenDate.nEnd and tbOpenDate.nEnd ~= 0) then
		Talk(1, "", "Giang hå ®ån r»ng trong thµnh BiÖn Kinh cã mét §Þa Cung thÇn bÝ, nghe nãi trong ®ã tiÒm Èn v« sè b¶o tµng quý gi¸, b»ng mäi gi¸ ta ph¶i vµo ®Þa cung cho b»ng ®­îc. Ta tin r»ng sÏ cã 1 ngµy, nhÊt ®Þnh sÏ lµm cho §Þa Cung hiÓn diÖn tr­íc bµn d©n thiªn h¹!")
		return
	end
	
	local nLastResetDate = GetTask(BJDG_HEAD.nLastResetDateTaskId)
	if nCurDate ~= nLastResetDate then
		SetTask(BJDG_HEAD.nInDungeonTimeTaskId, 0)
		SetTask(BJDG_HEAD.nLastResetDateTaskId, nCurDate)
	end

	local nNpcIndex = GetLastDlgNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = "<npc>Huynh muéi chóng t«i ®Õn ®©y ®Ó ®iÒu tra bÝ mËt cña §Þa Cung BiÖn Kinh, vµ ®· lËp nªn 4 trËn ph¸p trong §Þa Cung nµy. Trong trËn ph¸p cã thÓ b¶o hé cho ng­¬i. Ng­¬i cã thÓ tõ chç cña ta lùa chän truyÒn tèng ®Õn bÊt kú trËn ph¸p nµo ng­¬i muèn, còng cã thÓ ®èi tho¹i víi gia huynh Kú Lôc Nh©n ë trong §Þa Cung ®Ó truyÒn tèng. Trong §Þa Cung v« cïng nguy hiÓm, mçi ngµy ng­¬i chØ cã thÓ l­u l¹i n¬i ®ã 2 tiÕng ®ång hå mµ th«i, cßn nÕu nh­ ng­¬i cã ®­îc lîi léc g× khi vµo ®ã hay kh«ng, th× cßn ph¶i xem b¶n lÜnh cña nhµ ng­¬i nh­ thÕ nµo ®·."
	G_ACTIVITY:OnMessage("ClickNpc", tbDialog, nNpcIndex)
	tinsert(tbDialog, {"§i vµo §Þa Cung", SendMeToDlg})
	tinsert(tbDialog, {"KiÓm tra thêi gian cßn l¹i", QueryLeftTime})
	tinsert(tbDialog, {"KÕt thóc ®èi tho¹i"})
	CreateNewSayEx(tbDialog.szTitleMsg, tbDialog)
end

function SendMeToDlg()
	local nNpcIndex = GetLastDlgNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	
	if PlayerFunLib:CheckTotalLevel(135, "default", ">=") ~= 1 then
		return
	end
	
	if GetCamp() == 0 then
		Talk(1, "", "Chµo ®¹i hiÖp: §Þa Cung mu«n trïng hiÓm nguy, ng­êi míi gia nhËp giang hå nh­ c¸c h¹ kh«ng thÓ vµo ®ã")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if BJDG_HEAD.tbOpenTime[nHour] ~= 1 then
		Talk(1, "", "Mçi ngµy vµo lóc 10:00-24:00, 0:00-2:00 lµ thêi gian më b¶n ®å mª cung.")
		return
	end
	
	local nInDungeonTime = GetTask(BJDG_HEAD.nInDungeonTimeTaskId)
	if nInDungeonTime >= BJDG_HEAD.nDailyLimitTime then
		Talk(1, "", "§Þa Cung lµ n¬i v« cïng nguy hiÓm, mçi ngµy ng­¬i chØ cã thÓ vµo ®ã ®­îc 2 tiÕng ®ång hå mµ th«i.")
		return
	else
		tbDialog.szTitleMsg = "<npc>Xin h·y lùa chän ®iÓm truyÒn tèng"
		G_ACTIVITY:OnMessage("ClickNpc", tbDialog, nNpcIndex)
		tinsert(tbDialog, {"Thanh Long TrËn", SendMeTo, {"Thanh Long TrËn"}})
		tinsert(tbDialog, {"B¹ch Hæ TrËn", SendMeTo, {"B¹ch Hæ TrËn"}})
		tinsert(tbDialog, {"Chu T­íc TrËn", SendMeTo, {"Chu T­íc TrËn"}})
		tinsert(tbDialog, {"HuyÒn Vò TrËn", SendMeTo, {"HuyÒn Vò TrËn"}})
		tinsert(tbDialog, {"KÕt thóc ®èi tho¹i"})
	end
	CreateNewSayEx(tbDialog.szTitleMsg, tbDialog)
end

function SendMeTo(szPos)
	NewWorld(unpack(BJDG_HEAD.tbPos[szPos]))
end

function QueryLeftTime()
	local nLeftTime = BJDG_HEAD.nDailyLimitTime - GetTask(BJDG_HEAD.nInDungeonTimeTaskId)
	if nLeftTime <= 0 then
		nLeftTime = 0
	end
	local nLeftHours = floor(nLeftTime / 3600);
	local nLeftMinutes = floor(mod(nLeftTime, 3600) / 60);
	local nLeftSeconds = mod(nLeftTime, 60);
	
	Talk(1, "", format("H«m nay c¸c h¹ cßn cã thÓ l­u l¹i trong §Þa Cung [%02d:%02d:%02d]", nLeftHours, nLeftMinutes, nLeftSeconds))
end
