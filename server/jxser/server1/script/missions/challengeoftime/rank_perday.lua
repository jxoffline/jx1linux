Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\awardtemplet.lua")

tsk_rank_lastdate	= 2636	-- Íæ¼Ò×î½üÒ»´Î²Î¼Ó¸ß¼¶´³¹ØµÄÊ±¼ä
tsk_rank_lastscore 	= 2637	-- Íæ¼Ò×î½üÒ»´Î²Î¼Ó¸ß¼¶´³¹ØµÄ³É¼¨
tsk_rank_2thdate 	= 2638	-- Íæ¼Ò×î½üµÚ¶ş´Î²Î¼Ó¸ß¼¶´³¹ØµÄÊ±¼ä
tsk_rank_2thscore 	= 2639	-- Íæ¼Ò×î½üµÚ¶ş´Î²Î¼Ó¸ß¼¶´³¹ØµÄ³É¼¨

DailyRankLadderId	= 10235

nTIMERANK = "challengeoftime_ranklist";	-- Ê±¼äÌôÕ½Ã¿ÌìµÄÅÅÃû

tbQiannianlingyao = {szName = "Thiªn Niªn Linh D­îc", tbProp = {6, 1, 2116, 1, 1, 0}, nExpiredTime = 24 * 60};

function rank_award()
	ntime = tonumber(GetLocalDate("%H%M"))
	if (ntime < 4 or ntime > 2300) then
		Say("NhiÕp Thİ TrÇn: §Õn nhËn vµo thêi gian chØ ®Şnh", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("NhiÕp Thİ TrÇn: V× sù an toµn cho ®¹i hiÖp, xin h·y chõa hµnh trang trªn 1 « trèng", 0);
		return
	end
	
	update_gbtask(9999999);
	update_playertask();
end

function update_gbtask(nTime)
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (gb_GetTask(nTIMERANK, 1) ~= ndate) then
		if (gb_GetTask(nTIMERANK, 1) ~= nlastday) then
			gb_SetTask(nTIMERANK, 3, nlastday);
			gb_SetTask(nTIMERANK, 4, 0);
			
		else
			gb_SetTask(nTIMERANK, 3, gb_GetTask(nTIMERANK, 1));
			gb_SetTask(nTIMERANK, 4, gb_GetTask(nTIMERANK, 2));
		end
		gb_SetTask(nTIMERANK, 1, ndate);
		gb_SetTask(nTIMERANK, 2, nTime)
	else
		if (gb_GetTask(nTIMERANK, 2) > nTime) then
			gb_SetTask(nTIMERANK, 2, nTime);
		end
	end	
end

function update_playertask()
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	Msg2Player("Admin nlastday : "..nlastday)
	Msg2Player("GetTask(tsk_rank_lastdate): "..GetTask(tsk_rank_lastdate))
	Msg2Player("GetTask(tsk_rank_2thdate): "..GetTask(tsk_rank_2thdate))
	if (GetTask(tsk_rank_lastdate) ~= nlastday and GetTask(tsk_rank_2thdate) ~= nlastday) then
		Say("NhiÕp Thİ TrÇn: §¹i hiÖp vÉn ch­a ®ñ ®iÒu kiÖn nhËn th­ëng", 0);
		return
	end
	
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (GetTask(tsk_rank_lastdate) == nlastday) then
		if (GetTask(tsk_rank_lastscore) == 0) then
			Say("NhiÕp Thİ TrÇn: H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.", 0);
		else
			SetTask(tsk_rank_lastscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "Thiªn Niªn Linh D­îc");
		end
	else
		if (GetTask(tsk_rank_2thscore) == 0) then
			Say("NhiÕp Thİ TrÇn: H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.", 0);
		else
			SetTask(tsk_rank_2thscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "Thiªn Niªn Linh D­îc");
		end
	end
end

function get_top5team()
	tbRoleName = {};
	for i = 1, 5 do
		RoleName, value = Ladder_GetLadderInfo(DailyRankLadderId, i);
		value = value * (-1);
		if (RoleName == "" and i == 1) then
			Say("B¶ng xÕp h¹ng t¹m thêi ch­a cã th«ng tin!", 0);
			return
		end
--		if (RoleName == "") then
--			break
--		end
		local szTime	= format("%s phót %s gi©y", floor(value/60), floor(mod(value, 60)));
		tinsert(tbRoleName, getn(tbRoleName)+1, format("H¹ng %d: %s\tThµnh tİch: %s\n", i, RoleName, szTime));
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "Ta chØ ®Õn xem!/OnCancel");
	Say("B¶ng xÕp h¹ng:", getn(tbRoleName), unpack(tbRoleName));
end
