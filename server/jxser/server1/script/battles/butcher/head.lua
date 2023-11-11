Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan ÖÜÄ¿±ê
Include("\\script\\battles\\battles_award_head.lua")		--By Ð¡ÀË¶à¶à
Include("\\script\\event\\change_destiny\\mission.lua");	-- ÄæÌì¸ÄÃü
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

MISSIONID = 20
sf_aryItems = {
	{ "Gia Bµo hoµn", {6,0,2,1,0,0}, 5 },
	{ "Cao Trung hoµn", {6,0,5,1,0,0}, 5 },
	{ "Cao ThiÓm hoµn", {6,0,4,1,0,0}, 5 },
	{ "Tr­êng MÖnh hoµn", {6,0,1,1,0,0}, 5 },
	{ "Phi Tèc hoµn", {6,0,6,1,0,0}, 5 },
	{ "§éc Phßng hoµn", {6,0,10,1,0,0}, 5 },
	{ "B¨ng Phßng hoµn", {6,0,7,1,0,0}, 5 },
	{ "Háa Phßng hoµn", {6,0,9,1,0,0}, 5 },
	{ "L«i Phßng hoµn", {6,0,8,1,0,0}, 5 },
	{ "§¹i Lùc hoµn", {6,0,3,1,0,0}, 30 },
	{ "Ph¸o Hoa", {6,0,11,1,0,0}, 1 },
	{ "Mai Kh«i Hoa Vò ", {6,0,20,1,0,0}, 2 },
	{ "T©m T©m T­¬ng ¸nh phï ", {6,1,18,1,0,0}, 5 },
}


MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- Íæ¼ÒËÀÍö»òÍË³öÓÎÏ·ÔÙ½øÈëÊ±£¬±ØÐë3·ÖÖÓÖ®ºó²ÅÄÜÀë¿ªºóÓªµ½´óÓª
TIME_PLAYER_STAY = 120
--ÒÔÏÂÊÇÄ³Ð©Öµ¼ÇÂ¼ÔÚMissionValueÖÐµÄË÷ÒýÎ»ÖÃ£¬Í¨¹ýGetMissionV(MS_XXX)À´»ñµÃÊµ¼ÊµÄÖµ
MS_butcher = 2;--¼ÇÂ¼µ±Ç°²úÉúµÄÊÇËÎ¾üÔªË§£º1£»»¹ÊÇ½ð¾üÔªË§£º2£»»¹ÊÇ¶¼²úÉúÁË£º3£»

MS_CENTER_X1 = 4;   --ÇøÓò1£ºµ±±¨Ãû½×¶ÎÊ±£¬½ûÖ¹Íæ¼ÒÀë¿ª´óÓªÊ±£¬½«Íæ¼ÒÈÓ»Ø´óÓªµÄ×ø±ê
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--ÇøÓò2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --ÇøÓò1£ººóÓªÄÚ×ø±ê
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --ºóÓªÍâ×ø±ê
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--ÇøÓò2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1 = 17; --¼ÇÂ¼Timer1Ö´ÐÐµÄ´ÎÊý

MS_MOSTDEATH = 18	--Èç¹ûÒ»·½´ó½«ËÀÍö£¬ÔòÎª£º1£¨ËÎ£©»ñ2£¨½ð£©£»·ñÔòÎª£º0

MS_TOTALPOINT_S = 19		--±¾´ÎÕ½ÒÛ½áÊøÊ±ÇëÁã£¬¼ÇÂ¼±¾´ÎÕ½ÒÛËÎ·½×Ü»ý·Ö
MS_TOTALPOINT_J = 20		--±¾´ÎÕ½ÒÛ½áÊøÊ±ÇëÁã£¬¼ÇÂ¼±¾´ÎÕ½ÒÛ½ð·½×Ü»ý·Ö


FILE_HOMETRAP1 = "\\script\\battles\\butcher\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\butcher\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\butcher\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\butcher\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\butcher\\homeouttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\butcher\\npcdeath_1.lua",
	"\\script\\battles\\butcher\\npcdeath_2.lua",
	"\\script\\battles\\butcher\\npcdeath_3.lua",
	"\\script\\battles\\butcher\\npcdeath_4.lua",
	"\\script\\battles\\butcher\\npcdeath_5.lua",
	"\\script\\battles\\butcher\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\butcher\\npcdeath.lua"
FILE_TRANSPORT1 = 	"\\script\\battles\\butcher\\transport.lua";
FILE_TRANSPORT2 = 	"\\script\\battles\\butcher\\transport.lua";

--NpcµÄÄ£°åºÅID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

--×îÐ¡ÔÊÐíµÄÄ³Ò»ÕóÓªµÄÍæ¼ÒÊýÁ¿£¬Èç¹ûÔÚÕ½¶·ÖÐÕóÓªµÄÍæ¼ÒÊýÁ¿ÉÙÓÚ¸ÃÊýÄ¿Ôò¸ÃÕóÓªÅÐÊä£¬ÎÞÂÛ»ý·ÖÇé¿öÈçºÎ
MIN_PLAYER_COUNT_LIMIT = 0

MS_STATE = 1; --ÈÎÎñÖÐ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
--¸Ã±äÁ¿Ö¸ÏòµÄ×´Ì¬Öµ0±íÊ¾Õ½ÒÛÎª´ò¿ª£¬1±íÊ¾Õ½ÒÛ±¨ÃûÖÐ£¬2±íÊ¾Õ½ÒÛÕ½¶·½øÐÐÖÐ	£¬3±íÊ¾Õ½ÒÛ¸Õ¸Õ½áÊøÁË

MS_KEY = 7;		--¼ÇÂ¼µ±Ç°µØÍ¼ÏÂÈÎÎñµÄÒ»¸ökey£¬¼´Ò»¸öËæ»úÉú³ÉµÄÊý¶¨

MS_NEWSVALUE = 10; --ÈÎÎñÖÐ´æ·ÅÐÂÎÅ±äÁ¿µÄµØ·½

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------
function but_getminplayerlimit()
	return MIN_PLAYER_COUNT_LIMIT
end

function sf_winbouns(n_camp)
	local wincamp = n_camp;
	local failcamp = 0
	
	if (wincamp == 0) then
		wincamp = 1;
	end
	
	--Èç¹û½áÊø¶Ô·½ÕóÓªÃ»ÓÐÍæ¼Ò£¬ÔòÊ¤·½²»¸ø½±Àø
	if (wincamp == 1) then
		failcamp = 2;
	else
		failcamp = 1;
	end
	
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b¹i kh«ng cã ng­êi ch¬i, phe th¾ng kh«ng ®­îc tÆng th­ëng!")
		return
	end
	
	--by zero 2007-8-1 »ñµÃËùÓÐÓ®·½
	local All_Players_Table = {};
	local Win_Players_Table = {};
	idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, wincamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	
	local Los_Players_Table = {};
	idx = 0;
	for i = 1 , GetMSPlayerCount(MISSIONID, failcamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp)
		if (pidx > 0) then
			Los_Players_Table[getn(Los_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	battle_finish_activity(BT_GetGameData(GAME_LEVEL), All_Players_Table, Win_Players_Table, Los_Players_Table, n_camp)
	tbChangeDestiny:completeMission_Battle(All_Players_Table)
	TB_QIANQIU_YINGLIE0904:add_lucky_award(All_Players_Table)
	
	if (n_camp ~= 0) then
		TB_QIANQIU_YINGLIE0904:add_end_award(Win_Players_Table, 2);
		TB_QIANQIU_YINGLIE0904:add_end_award(Los_Players_Table, 0);
	else
		TB_QIANQIU_YINGLIE0904:add_end_award(All_Players_Table, 1);
	end
	
	--end 
	--by zero 2007-7-30 »ñµÃËÎ½ð¾ü¹¦ÅÆ Ò»Ìì»ñµÃ2´Î
	local OldPlayerIndex = PlayerIndex
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
		local player_total_point=BT_GetData(PL_TOTALPOINT) --»ñµÃ»ý·Ö
		
		--ÁìÈ¡2007ÖÐÇï»¨µÆ
		--2007Äê9ÔÂ21ÈÕ£¨ÀýÐÐÎ¬»¤ºó£©~9ÔÂ28ÈÕ00£º30
		local nTime=0;
		nTime = tonumber(GetLocalDate("%y%m%d%H%M"))
		
		
		--ÁìÈ¡¾ü¹¦ÅÆ
		local jg_ndate=tonumber(GetLocalDate("%y%m%d"))
		jg_ndate=jg_ndate*10+2;
		local JG_T_Value=GetTask(JUNGONGPAI_Task_ID) --¾ü¹¦ÅÆ»ñÈ¡ÈÎÎñ±äÁ¿
		
		
		
		--print(format("%d %d",player_total_point,JG_T_Value))
		if(player_total_point >= 1000 and JG_T_Value < jg_ndate) then
			local ItemIdx = AddItem(6,1,JUNGONGPAI,1,0,0);
			
			local Tdate=FormatTime2Number(GetCurServerTime()+24*60*60)--ÁìÈ¡µÄµÚ¶þÌì
			Tdate=floor(Tdate/10000) --È¡Äê,ÔÂ,ÈÕ
			nEndYear=floor(Tdate/10000)+2000
			nEndMonthDay=floor(mod(Tdate,10000))
			SetSpecItemParam(ItemIdx, 1,nEndYear);--ÉèÖÃÎïÆ·Äê
			SetSpecItemParam(ItemIdx, 2,nEndMonthDay);--ÉèÖÃÎïÆ·ÔÂÈÕ
			SyncItem(ItemIdx)
			SetItemBindState(ItemIdx, -2);-- °ó¶¨
			Msg2Player("B¹n nhËn ®­îc 1 Hu©n c«ng bµi Tèng Kim")
			WriteLog(format("[ChiÕn tr­êng Tèng Kim]\t%s\tName:%s\tAccount:%s\t 1000 ®iÓm tÝch lòy trë lªn sÏ nhËn ®­îc 1 Hu©n c«ng bµi Tèng Kim",
					GetLocalDate("%y%m%d %X"), GetName(), GetAccount()));
			if(JG_T_Value == (jg_ndate-1)) then --ÁìÈ¡ÁË2´Î	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate);
			elseif(JG_T_Value ~= jg_ndate) then --ÁìÈ¡ÁË1´Î	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate-1);
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	--end
	
	local award_over = floor(BATTLES_LOSEGAME_POINT * bt_getgn_awardtimes())
	bt_camp_getbonus(failcamp, award_over, "LÇn nµy phe ta b¹i! Th¾ng b¹i lµ chuyÖn th­êng t×nh cña binh gia, t­íng sÜ ®õng n¶n lßng! LÇn sau sÏ quyÕt 1 trËn th­ hïng. (NhËn ®­îc <color=yellow>", 50);
	
	bonuscff1 = BATTLES_WINGAME_POINT * bt_getgn_awardtimes()
   	repute = 3 * bt_getgn_awardtimes()
	WriteLog("§iÓm tÝch lòy cho phe th¾ng lîi lµ:"..bonuscff1)
	
	sf_itemcount = getn(sf_aryItems)
	
	-- by zero ÐÞ¸Ä»ñÈ¡Ó®·½ÈËÔ±µÄ·½Ê½
	OldPlayerIndex = PlayerIndex	
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
            local game_level = BT_GetGameData(GAME_LEVEL);
           local n_bonuscff1 = 0;
	   		AddRepute(repute);			
	   		Msg2Player("Danh väng cña b¹n t¨ng thªm "..repute.."®iÓm!")
			n_bonuscff1 = bt_addtotalpoint(bonuscff1)
			Msg2Player("B¹n nhËn ®­îc "..n_bonuscff1.." ®iÓm tÝch lòy")
			--Storm Ê¤·½½áÊøÌôÕ½£¬²¢¼ÇÂ¼»ñÊ¤Õß
			Say("Chóc mõng phe b¹n giµnh th¾ng lîi! Danh väng cña b¹n t¨ng thªm <color=yellow>"..repute.."<color>! Vµ nhËn thªm <color=yellow>"..n_bonuscff1.."<color> ®iÓm tÝch lòy", 1, "KÕt thóc ®èi tho¹i/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1

			
			randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#>Chóc mõng B¹n! LÊy ®­îc gi¶i th­ëng "..szItemName);
			end;
	end
	PlayerIndex = OldPlayerIndex
end;

function but_addmissionpoint(totalpoint)
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
	end
end

function GameOver()
	WriteLog("[Battle Log] battle is ending. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local OldPlayerIndex = PlayerIndex
	
	--¸üÐÂËÎ½ðÏà¹ØµÄÊÀ½çÅÅÃû°ñ
	WriteLog("[Battle Log] Sorting World Ladder");

--	--Ä£Ê½×ÜÅÅÐÐ°ñ

		BT_SortWorldLadder(PL_TOTALPOINT, 10147)
		BT_SortWorldLadder(PL_KILLPLAYER, 10148)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10149)
		BT_SortWorldLadder(PL_GETITEM, 10150)

	
	local game_level = BT_GetGameData(GAME_LEVEL);
	
	--Ä£Ê½¼ÓµÈ¼¶ÅÅÐÐ°ñ
		if (game_level == 3) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10151)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10152)
			BT_SortWorldLadder(PL_GETITEM, 10153)
			BT_SortWorldLadder(PL_TOTALPOINT, 10154)
			bt_sortbthonour();			--ËÎ½ðÈÙÓþ»ý·ÖÅÅÐÐ
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10155)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10156)
			BT_SortWorldLadder(PL_GETITEM, 10157)
			BT_SortWorldLadder(PL_TOTALPOINT, 10158)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10159)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10160)
			BT_SortWorldLadder(PL_GETITEM, 10161)
			BT_SortWorldLadder(PL_TOTALPOINT, 10162)
		end

	
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	WriteLog("[Battle Log] Awarding Activity");
	
	if (game_level == 1) then
		resultstr = "Khu vùc S¬ cÊp "
	elseif (game_level == 2) then
		resultstr = "Khu vùc Trung cÊp "
	elseif (game_level == 3) then
		resultstr = "Khu vùc Cao cÊp "
	end
	--edit by zero ¸ù¾ÝÅÅÃû¸ø½±Àø
	
	battle_rank_award0808(game_level)
	battle_rank_activity(game_level)
	
	WriteLog("[Battle Log] Awarding Single Player");
	
	--end
	
	
	--edit by Ð¡ÀË¶à¶à
	--°Ñ3ÖÖÄ£Ê½½±ÀøÖ¸ÏòÒ»¸öÎÄ¼þ±àÐ´
	--ËùÓÐ¶ÓÔ±½±Àø,Ê¤¸ºÆ½½ÔÓÐ
	--sign start
	local Win_Players_Table={}
	local idx = 0;
	local pidx = 0;
	for i=1,500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, 0)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end

	for i = 1,getn(Win_Players_Table) do
		local noldplayerindex = PlayerIndex
		PlayerIndex = Win_Players_Table[i]
		local player_total_point=BT_GetData(PL_TOTALPOINT) --»ñµÃ»ý·Ö
		battles_award_all_singleplayer(PlayerIndex,player_total_point,game_level)
		PlayerIndex = noldplayerindex
	end 
	--sign end
	
	tb_storm_winner = {}	--Storm	Çå¿Õ»ñÊ¤Õß
	
	TB_QIANQIU_YINGLIE0904:sorter_award(game_level)
	

	WriteLog("[Battle Log] Awarding by Result");

	if (GetMissionV(MS_MOSTDEATH) == 0) then
		if (bonus_s > bonus_j ) then
			resultstr = resultstr.."ChiÕn sù ®· kÕt thóc, tû lÖ ®iÓm tÝch lòy lµ "..bonus_s..":"..bonus_j..", phe Tèng giµnh ®­îc th¾ng lîi!";
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr)
			BT_ReportResult(1)
			RecordBTCount_Win(1)		--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎ½ðÕ½³¡Ê¤¸º×´¿ö
			sf_winbouns(1)
		elseif (bonus_s < bonus_j) then
			resultstr = resultstr.."ChiÕn sù ®· kÕt thóc, tû lÖ ®iÓm tÝch lòy lµ "..bonus_s..":"..bonus_j..", phe Kim giµnh ®­îc th¾ng lîi!"
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr)
			BT_ReportResult(2)
			RecordBTCount_Win(2)	--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎ½ðÕ½³¡Ê¤¸º×´¿ö
			sf_winbouns(2)
		else
			resultstr = resultstr.."ChiÕn sù ®· kÕt thóc, tû lÖ ®iÓm tÝch lòy lµ "..bonus_s..":"..bonus_j
			Msg2MSAll(MISSIONID, resultstr)
			local award_over = BATTLES_TIEGAME_POINT * bt_getgn_awardtimes()
			bt_camp_getbonus(1, award_over, "LÇn nµy t¹m hßa! T­íng sÜ h·y t¹m nghØ ng¬i! LÇn sau sÏ quyÕt 1 trËn th­ hïng! (§­îc th­ëng <color=yellow>", 75);
			bt_camp_getbonus(2, award_over, "LÇn nµy t¹m hßa! T­íng sÜ h·y t¹m nghØ ng¬i! LÇn sau sÏ quyÕt 1 trËn th­ hïng! (§­îc th­ëng <color=yellow>", 75);
			sf_winbouns(0)
			WriteLog(resultstr)
		end;

		AddGlobalCountNews(resultstr, 1) 

	elseif (GetMissionV(MS_MOSTDEATH) == 1) then
		resultstr = resultstr.."ChiÕn sù ®· kÕt thóc, phe Tèng giµnh ®­îc th¾ng lîi!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr)
		BT_ReportResult(1)
		sf_winbouns(1)
		RecordBTCount_Win(1)		--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎ½ðÕ½³¡Ê¤¸º×´¿ö
		AddGlobalCountNews(resultstr, 1) 
	elseif (GetMissionV(MS_MOSTDEATH) == 2) then
		resultstr = resultstr.."ChiÕn sù ®· kÕt thóc, phe Kim giµnh ®­îc th¾ng lîi!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr)
		BT_ReportResult(2)
		sf_winbouns(2)
		RecordBTCount_Win(2)		--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎ½ðÕ½³¡Ê¤¸º×´¿ö
		AddGlobalCountNews(resultstr, 1) 
	end
	
	WriteLog("[Battle Log] Ready for kick Out");
	
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	branchTask_JoinSJend1();
	 	l_curcamp = GetCurCamp();

		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬£¨by Dan_Deng£©
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
		-- Big Boss Remove bonus state
		BigBoss:RemoveSongJinBonus();
		
		--Storm ¸ø»ñÊ¤ÕßÒÔÍâµÄ½áÊøÌôÕ½
		if (tb_storm_winner[PlayerIndex] == nil) then
			storm_end(1)
		end

		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[game_level], 1)
			NewWorld(bt_getsignpos(1))
		else	
			SetRevPos(tbGAME_SIGNMAP[game_level], 2)
			NewWorld(bt_getsignpos(2))
		end;
		
		camp = GetCamp();
		SetCurCamp(camp);
		
	end;
	PlayerIndex = OldPlayerIndex
end;
-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Kim qu©n. Tr¸ng sÜ xin ®îi trËn sau nhÐ!")
			return
		elseif (camp==2) then
			Msg2Player("Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Tèng qu©n. Tr¸ng sÜ xin ®îi trËn sau nhÐ!")
			return
		end
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","Ng­êi Kim bän ng­¬i, x©m l­îc giang s¬n, giÕt h¹i ®ång bµo ta! Ta thÒ quyÕt cïng bän ng­¬i mét mÊt mét cßn!")
		else
			Talk(1,"","Kim quèc ai còng ®Òu dòng sÜ thiÖn chiÕn. Tèng triÒu môc n¸t c¸c ng­¬i sao xøng lµ ®èi thñ!")
			return
		end
	end

if (result == 0) then
--		if (CalcItemCount(-1, 6, 1, 30083, -1) >= 1 and ConsumeEquiproomItem(1, 6, 1, 30083, 1) == 1) then		
		if (GetCash() >= SONGJIN_SIGNUP_FEES) then
		Pay(SONGJIN_SIGNUP_FEES)
		BT_LeaveBattle() -- Çå³ýÍæ¼Ò¿Í»§¶Ëµ±Ç°µÄÅÅÃûÊý¾Ý
		BT_ClearPlayerData()
		SetTask(2435, 0);--±¾³¡ËÎ½ðÒÑ¾­ÁìÈ¡µÄ°ï»á¹±Ï×¶ÈÇåÁã--by ÁÎÖ¾É½
		Msg2Player("Nh¾c nhë: cã thÓ Ên phÝm ~ ë gãc tr¸i phÝa trªn bµn phÝm ®Ó xem tin tøc chiÕn sù!");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		tbLog:PlayerActionLog("EventChienThang042011","BaoDanhTongKim")	-- ±¨ÃûÈÕÖ¾
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nlevel)
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhTongKim")
	else
		local szMsg = "Xin lçi, tham gia ®ît Tèng Kim ®¹i chiÕn nµy, cÇn ph¶i nép 3000 l­îng"
		Say(szMsg, 0)
		return 
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
	str = GetName().."Gia nhËp phe Tèng"
	EnterChannel(PlayerIndex, "Phe Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().."Gia nhËp phe Kim"
	EnterChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], 1)
else
	SetRevPos(tbGAME_SIGNMAP[level], 2)
end

NewWorld(sf_mapid, posx, posy);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(0);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf()
BT_BroadBattleDesc();
BT_ViewBattleStart()
SetFightState(0)
--Msg2MSAll(MISSIONID,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\butcher\\playerdeath.lua");
bt_JudgePLAddTitle()
end;
------------------------------------------------------------------

-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

------------------------------------------------------

function RecordBTCount_Win(camp)		--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎ½ðÕ½³¡Ê¤¸º×´¿ö
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: Tèng Kim kÕt thóc! L­u tr÷ th«ng tin cã sai sãt!!!")
		return
	end
	local OldPlayerIndex = PlayerIndex
	idx = 0
	if (camp == 1) then
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if( pidx > 0 ) then
			 	PlayerIndex = pidx
		 		nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if( pidx > 0 ) then
			 	PlayerIndex = pidx
		 		nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
	else
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if( pidx > 0 ) then
			 	PlayerIndex = pidx
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
			if (idx <= 0) then
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if( pidx > 0 ) then
		 	PlayerIndex = pidx
	 		nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then
		 		break
		 	end			 	
		end
		
	end
	PlayerIndex = OldPlayerIndex
end

-- ÉèÖÃÈÎÎñ×´Ì¬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

-- »ñÈ¡ÈÎÎñ×´Ì¬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function but_pop2home( camp )
	oldPlayerIndex = PlayerIndex
	tbPlayer = { }
	tbRMPlayer = {}
	count = 0
	count_remain = 0
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer( MISSIONID,idx, camp );
		if( pidx > 0 ) then
		 	PlayerIndex = pidx
		 	if ( GetFightState( ) == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_PLAYER_STAY ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
		 	elseif ( GetFightState( ) == 0 ) then
		 		count_remain = count_remain + 1
		 		tbRMPlayer[ count_remain ] = pidx
		 	end
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 

	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))

	if ( count > 0 ) then
		if ( camp == 1 ) then
			area = BT_GetGameData(GAME_CAMP1AREA);
		else
			area = BT_GetGameData(GAME_CAMP2AREA);
		end
		npcfile = GetIniFileData(mapfile, "Area_"..area, tbNPCPOS[random(2)]);
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
			x,y = bt_getadata(npcfile)
			SetPos(floor(x/32), floor(y/32))
			SetFightState(1)
			Msg2Player("<color=pink>B¹n kh«ng thÓ ë l¹i hËu doanh ®­îc n÷a")
		end
	end

	if ( count_remain > 0 ) then
		for i = 1, count_remain do
			PlayerIndex = tbRMPlayer[ i ]
			remain_time = TIME_PLAYER_STAY - ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) )
			if( remain_time > 0) then
				Msg2Player("<color=pink>B¹n cßn cã thÓ ¬ l¹i "..remain_time.." gi©y")
			end
		end
	end
	PlayerIndex = oldPlayerIndex
end