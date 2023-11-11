Include("\\script\\missions\\autohang\\head.lua");

g_nPassTimes = 0;
g_bFreeTime = 0; -- Ãâ·ÑÊ±¼ä

function OnTimer()
	do return end
	g_bFreeTime = AEXP_IsFreeTimeDoubleExp();
	
	-- ÉèÖÃÊÇ·ñÃâ·Ñ£¬ÒÔ¼°¾­Ñé±¶Êý(>=1)
	SetAutoHangFreeFlag(g_bFreeTime, AEXP_FREEDATE_EXPFACTOR);
	
	-- ³¢ÊÔ×ß³ÌÐò°æ±¾µÄOnTimer´¦Àíº¯Êý
	nRun = TimerFuncForAutoHang();
	
	-- ·þÎñÆ÷ÉèÖÃOnTimer´¦ÀíÎª³ÌÐò°æ±¾(²»ÔÙÏòÏÂÖ´ÐÐÁË)
	if (nRun > 0) then
		return 1;
	end

	PlayerTab = {};
	pidx = GetFirstPlayerAtSW();
	i = 1;
	while (pidx > 0) do
		PlayerTab[i] = pidx;		
		pidx = GetNextPlayerAtSW();
		i = i + 1;
	end
	
	PCount = getn(PlayerTab);
	
	-- print("µ±Ç°ÌÒ»¨µºÈËÊý: "..PCount);

	OldPlayer = PlayerIndex;
	-- Ëæ»ú²úÉúÐÒÔËÍæ¼Ò£¬²¢»ñµÃËæ»úÎïÆ· - start
	nLockNum = floor(PCount / 100);
	for i = 1, nLockNum do
		nTemp = random(1, PCount);
		PlayerIndex = PlayerTab[nTemp];
		if (g_bFreeTime == 1) then -- Ãâ·ÑÊ±¼ä
			AddItemForAutoHang(); -- ÐÒÔËÎïÆ·
		else
			nPointTime = GetTask(AEXP_TASKID);
			if (nPointTime >= AEXP_TIME_UPDATE) then -- ÈôÕâÈË¹Ò»úµãÊý²»×ã£¬¾Í²»ÄÜµÃµ½ÐÒÔËÎïÆ·ÁË
				AddItemForAutoHang();
			end	
		end
	end
	-- Ëæ»ú²úÉúÐÒÔËÍæ¼Ò£¬²¢»ñµÃËæ»úÎïÆ· - end

	-- Ôö¼Ó¾­ÑéÖµ - start
	nValidCount = 0; -- ÓÐÐ§¹Ò»úÍæ¼ÒÈËÊý
	nRet = 0;
	for i  = 1, PCount do
		PlayerIndex = PlayerTab[i];
		nRet = AEXP_AddHangExp();
		if (nRet > 0) then
			nValidCount = nValidCount + 1;
		end
	end
	-- Ôö¼Ó¾­ÑéÖµ - end	
	PlayerIndex = OldPlayer;
	
	-- Í³¼Æ×Ô¶¯¹Ò»úÈËÊý
	g_nPassTimes = g_nPassTimes + 1;
	if (g_nPassTimes >= AEXP_STAT_FREQ) then
		CalcAutoHangPlayerCount(SubWorldIdx2ID(), PCount, nValidCount);
		g_nPassTimes = 0;
	end
end;

-- Ôö¼ÓÄ³¸ö¹Ò»úÍæ¼ÒµÄ¾­ÑéÖµ
-- ´Ëº¯ÊýÔÚOnTimerÊ±±»AutoAddExpForAllPlayersµ÷ÓÃ
function AEXP_AddHangExp()

	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Msg2Player("<#> C«ng lùc cña ng­¬i cßn kÐm qu¸! §Õn"..AEXP_NEEDLEVEL.."<#> cÊp trë lªn h·y quay l¹i ®©y nhÐ!");
		return -1;
	end
	
	nExp = 0;
	nPointTime = 0;
	-----------------------
	if (g_bFreeTime == 1) then-- Ãâ·Ñ¼Ó±¶¾­ÑéÈÕ×Ó
		-- ²»ÐèÒªÀ°°ËÖà
		-- ¾­Ñé¼Ó±¶
		nExp = GetAutoHangExpValue(nLevel);
		nExp = nExp * AEXP_FREEDATE_EXPFACTOR;
	else -- ÆÕÍ¨ÈÕ×Ó
		nPointTime = GetTask(AEXP_TASKID);
	
		if (nPointTime == 0) then
			Msg2Player("ChØ cã Ch¸o L¹p B¸t míi hÊp thu ®­îc tinh hoa cña ®¶o nµy, mêi b¹n ®Õn chç Èn SÜ §µo Hoa mua mét Ýt ch¸o."); -- Todo
			return -1;	
		elseif (nPointTime < AEXP_TIME_UPDATE) then
			Msg2Player("HiÖu lùc cña Ch¸o L¹p B¸t s¾p hÕt h¹n, b¹n cÇn ph¶i ®Õn chç Èn SÜ §µo Hoa mua thªm míi cã thÓ gia t¨ng c«ng lùc."); -- Todo
			return -1;
		end
		
		nExp = GetAutoHangExpValue(nLevel);
	end;
	-----------------------
	
	-- ·ÖÊ±¶Î - start
	szHour = date("%H");
	nHour = tonumber(szHour);
	
	if (nHour < 9) then -- Áè³¿(0~9)
		nExp = floor(nExp * 1.2);
	elseif (nHour < 18) then  -- °×Ìì(9~18)
		nExp = nExp;
	elseif (nHour < 24) then  -- ÍíÉÏ(18~24)
		nExp = floor(nExp * 0.8);
	end;
	-- ·ÖÊ±¶Î - end
	
	if (nExp > 0) then
		if (g_bFreeTime == 0) then -- ·ÇÃâ·Ñ£¬¿ÛÊ±¼ä
			SetTask(AEXP_TASKID, nPointTime - AEXP_TIME_UPDATE); -- ¿ÛÊ±¼ä
		end
		
		AddOwnExp(nExp); -- ¼Ó¾­Ñé
		Msg2Player("<#> Kinh nghiÖm cña b¹n t¨ng thªm"..nExp.."<#> ®iÓm."); -- Todo
	else
		WriteLog(GetLoop()..date("%m%d-%H:%M").."Auto AddExp Error!")
	end

	return 1;
end;
