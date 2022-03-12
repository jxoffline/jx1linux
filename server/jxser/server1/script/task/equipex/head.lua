
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ô½ÄÏ°æÍêÃÀ°²°î½Å±¾Í·ÎÄ¼ş
-- Edited by bel
-- 2008/05/07 AM 11:02

-- ======================================================

IncludeLib("ITEM");						-- ÎïÆ·¿âÖ§³Ö
IncludeLib("TASKSYS");					-- ÈÎÎñÏµÍ³¿âÖ§³Ö
Include("\\script\\lib\\equipex.lua");	-- ¶ÁÈëÉú³ÉÏàËÆ×°±¸Ö§³ÖµÄÍ·ÎÄ¼ş
Include("\\script\\task\\system\\task_debug.lua");		-- ¶ÁÈë DEBUG Êä³ö´¦ÀíÎÄ¼ş
Include("\\script\\task\\system\\task_head.lua");		-- ¶ÁÈëWriteTaskLogĞÅÏ¢

ID_EQUIPEX_TASK		= 2536;             -- ¼ÇÂ¼°²°îÈÎÎñµÄÁ÷³Ì
ID_EQUIPEX_FINISH	= 2540;             -- ¼ÇÂ¼°²°îÈÎÎñµÄÍê³É×´Ì¬
ID_EQUIPEX_TOTAL  	= 2541;             -- ¼ÇÂ¼°²°îÈÎÎñÊÇ·ñÈ«²¿Íê³É
ID_EQUIPEX_TASK_RANDOMSEED	= 2539;  	-- ¼ÇÂ¼»Æ½ğµÄËæ»úÖÖ×Ó

GLB_EQUIPEX_CLOSE 	= 1244  			-- ½ô¼±¹Ø±ÕÓÃµÄÁÙÊ±±äÁ¿
TASK_CHECKITEM_NUM 	= 202;				-- ÓÃÓÚÁÙÊ±¼ÇÂ¼µÄÎïÆ· ID ×ÜÊı
TAKS_CHECKITEM_MAX 	= 20;				-- ÓÃÓÚÁÙÊ±¼ÇÂ¼µÄÎïÆ· ID ×î´óÊı
TASK_CHECKITEM_START 		= 203;		-- ÓÃÓÚÁÙÊ±¼ÇÂ¼µÄÎïÆ· ID ÆğÊ¼±äÁ¿ºÅ
NUM_PAY_TOPITEMTOPERFECT	= 1000;		-- ¼«Æ·µÄ°²°î´òÔì³ÉÍêÃÀµÄÊÕ·Ñ£¬µ¥Î»£¨Íò£©
NUM_PAY_PERFECTITEM_REVERT 	= 500;


-- ÆÕÍ¨µÄ°²°îË÷Òı
aryItem = {
	--   ÍêÃÀµÄĞòºÅ  ÆÕÍ¨µÄĞòºÅ  ÍêÃÀµÄÎÄ×ÖÃèÊö   ÆÕÍ¨µÄÎÄ×ÖÃèÊö   ĞèÒª¹Ì¶¨µÄÊôĞÔ
	[1]	= {211, 165, "An bang Hoµn mü - Cóc hoa th¹ch chØ hoµn", "An Bang Cóc Hoa Th¹ch ChØ hoµn", 105},
	[2] = {213, 167, "An bang Hoµn mü - Kª huyÕt th¹ch giíi chØ", "An Bang Kª HuyÕt Th¹ch Giíi ChØ ", 102},
	[3] = {210, 164, "An bang Hoµn mü - B¨ng tinh th¹ch h¹ng liªn", "An Bang B¨ng Tinh Th¹ch H¹ng Liªn", 114},
	[4] = {212, 166, "An bang Hoµn mü - §iÒn hoµng th¹ch ngäc béi", "An Bang §iÒn Hoµng Th¹ch Ngäc Béi", 101},
}

-- ¼«Æ·µÄ°²°îË÷Òı
aryTopItem = {
	--   ÍêÃÀµÄĞòºÅ  ÆÕÍ¨µÄĞòºÅ  ÍêÃÀµÄÎÄ×ÖÃèÊö   ÆÕÍ¨µÄÎÄ×ÖÃèÊö
	[1]	= {425, 409, "[Hoµn Mü] Cùc PhÈm An Bang Cóc Hoa Th¹ch ChØ Hoµn", "[Cùc phÈm] An Bang Cóc Hoa Th¹ch ChØ Hoµn"},
	[2] = {427, 411, "[Hoµn Mü] Cùc PhÈm An Bang Kª HuyÕt Th¹ch Giíi ChØ", "[Cùc phÈm] An Bang Kª HuyÕt Th¹ch Giíi ChØ"},
	[3] = {424, 408, "[Hoµn Mü] Cùc PhÈm An Bang B¨ng Tinh Th¹ch H¹ng Liªn", "[Cùc phÈm] An Bang B¨ng Tinh Th¹ch H¹ng Liªn"},
	[4] = {426, 410, "[Hoµn Mü] Cùc PhÈm An Bang §iÒn Hoµng Th¹ch Ngäc Béi", "[Cùc phÈm] An Bang §iÒn Hoµng Th¹ch Ngäc Béi"},	
}

aryNeedItem = {
	--      ÎïÆ·Ãû³Æ          ×ÜÀà  ·ÖÀà  Ï¸Àà  µÈ¼¶  ÎåĞĞ  »Æ½ğ  ÊıÁ¿  Ëæ»úÖÖ×Ó¼ÇÂ¼
	[1] = {{"2 Cóc Hoa Th¹ch",        4,   963,    1,   -1,   -1,    0,   2,    0},
		   {"1 B¨ng Th¹ch KÕt Tinh",      4,   967,    1,   -1,   -1,    0,   1,    0},
		   {"10 Lam Thñy Tinh",       4,   238,    1,   -1,   -1,    0,   10,   0},
		   {"An Bang Cóc Hoa Th¹ch ChØ hoµn", 0,   0,      0,   -1,   -1,  165,   1,    1}},
		   	
	[2] = {{"2 B¨ng ThiÒm T¬",        4,   965,    1,   -1,   -1,    0,   2,    0},
		   {"3 Kª HuyÕt Th¹ch",        4,   966,    1,   -1,   -1,    0,   3,    0},
		   {"10 Lôc Thñy Tinh",       4,   240,    1,   -1,   -1,    0,   10,   0},
		   {"An Bang Kª HuyÕt Th¹ch Giíi ChØ ", 0,   0,      0,   -1,   -1,  167,   1,    1}},
		   	
	[3] = {{"2 M· N·o",          4,   964,    1,   -1,   -1,    0,   2,    0},
		   {"1 M¶nh thiªn th¹ch",      4,   968,    1,   -1,   -1,    0,   1,    0},
		   {"5 Tö Thñy Tinh",        4,   239,    1,   -1,   -1,    0,   5,    0},
		   {"1 ThÇn Bİ Kho¸ng Th¹ch",      6,   1,    398,   -1,   -1,    0,   1,    0},
		   {"An Bang B¨ng Tinh Th¹ch H¹ng Liªn", 0,   0,      0,   -1,   -1,  164,   1,    1}},
		   	
	[4] = {{"10 §iÒn Hoµng Th¹ch",       4,   969,    1,   -1,   -1,    0,   10,   0},
		   {"1 Tİn sø Kim bµi",     6,   1,    888,   -1,   -1,    0,   1,    0},
		   {"1 HuyÒn tinh cÊp 8",       6,   1,    147,    8,   -1,    0,   1,    0},
		   {"An Bang §iÒn Hoµng Th¹ch Ngäc Béi", 0,   0,      0,   -1,   -1,  166,   1,    1}},
}


function main_talk()
	
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	
	local aryTalk = {};
	
	if GetGlbValue(GLB_EQUIPEX_CLOSE)==1 then
		Say("Thî rÌn thÇn bİ: H«m nay ta mÖt råi, ®îi lÇn sau ta sÏ gióp ng­¬i!", 0);
		return
	end;
	
	tinsert(aryTalk, "<dec><npc>L·o phu cã thÓ gióp g× vÒ trang bŞ An bang Hoµn mü?");
	
	if nTask>=4 and nFinish==1 then
		tinsert(aryTalk, "Ta muèn «ng gióp ta tiÕp tôc chÕ t¹o bé An bang./ib_nexttask_talk");
	else
		tinsert(aryTalk, "Ta muèn tiÕn hµnh chÕ t¹o bé An bang Hoµn mü/main_task_talk");
	end;
	
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(aryTalk, "Ta muèn phôc håi l¹i bé An bang Hoµn mü/ib_nexttask_revert");
	end;
	
--	tinsert(aryTalk, "ÎÒÓµÓĞ[¼«Æ·µÄ]°²°îÊ×ÊÎ£¬Äã°ïÎÒÇ¿»¯°É/top_equipex_dialog");
--	tinsert(aryTalk, "ÎÒÓµÓĞ[¼«Æ·µÄ]ÍêÃÀ°²°îÊ×ÊÎ£¬Äã°ïÎÒ»¹Ô­°É/top_revert_dialog");
	tinsert(aryTalk, "Rêi khái/OnExit");
	
	CreateTaskSay(aryTalk);
end;


function main_task_talk()
	local nTask = equipexTaskState();
	local nFinish = GetTask(ID_EQUIPEX_FINISH);
	if nTask==0 then
		CreateTaskSay({"<dec><npc>Xem nh­ lµ cã duyªn, ta sÏ gióp ng­¬i hoµn thµnh.",
					   "B¾t ®Çu nhiÖm vô An bang Hoµn mü/main_task_001",
					   "Rêi khái/OnExit"});
	end;
	
	if nTask>0 and nTask<=4 and nFinish==0 then
		main_task_give();
	end;
	
	if nTask>0 and nTask<4 and nFinish==1 then
		if nTask==1 then main_task_002(); end;
		if nTask==2 then main_task_003(); end;
		if nTask==3 then main_task_004(); end;
	end;
	
end;



function main_task_001()
	SetTask(ID_EQUIPEX_TASK, 1);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>§Çu tiªn lµ chÕ t¹o {{An bang cóc hoa th¹ch chØ hoµn}}. H·y gióp ta ®i t×m {{2 Cóc Hoa Th¹ch}} vµ {{1 B¨ng Th¹ch KÕt Tinh}}, vµ {{10 Lam Thñy Tinh}}, nghe ®ån r»ng nh÷ng thø nµy cã b¸n t¹i Kú Tr©n C¸c, ng­¬i h·y ®i xem, dÜ nhiªn kh«ng thÓ thiÕu {{An bang cóc hoa th¹ch chØ hoµn}} cña ng­¬i n÷a.",
				   "HiÓu råi/OnExit"});	
end;

function main_task_002()
	SetTask(ID_EQUIPEX_TASK, 2);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>TiÕp theo lµ chÕ t¹o {{An bang kª huyÕt th¹ch giíi chØ }}, h·y gióp ta ®i t×m {{2 B¨ng ThiÒm T¬}}, {{3 Kª HuyÕt Th¹ch}}, vµ {{10 Lôc Thñy Tinh}}. Nghe ®ån r»ng nh÷ng thø nµy cã b¸n t¹i Kú Tr©n C¸c, ng­¬i h·y ®i xem, dÜ nhiªn kh«ng thÓ thiÕu {{An bang kª huyÕt th¹ch giíi chØ }}.",
				   "HiÓu råi/OnExit"});	
end;

function main_task_003()
	SetTask(ID_EQUIPEX_TASK, 3);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>TiÕp theo lµ chÕ t¹o {{An bang b¨ng tinh th¹ch h¹ng liªn}}, h·y gióp ta ®i t×m {{2 M· N·o}} vµ {{1 M¶nh thiªn th¹ch}}, vµ {{5 Tö Thñy Tinh}} vµ {{1 ThÇn bİ kho¸ng th¹ch}}, Nghe ®ån r»ng nh÷ng thø nµy cã b¸n t¹i Kú Tr©n C¸c, ng­¬i h·y ®i xem, dÜ nhiªn kh«ng thÓ thiÕu {{An bang b¨ng tinh th¹ch h¹ng liªn}}.",
				   "HiÓu råi/OnExit"});	
end;

function main_task_004()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 0);
	CreateTaskSay({"<dec><npc>Cuèi cïng lµ chÕ t¹o {{An bang ®iÒn hoµng th¹ch ngäc béi}}. H·y gióp ta ®i t×m {{10 §iÒn Hoµng Th¹ch}}, {{1 Tİn sø kim bµi}} vµ {{1 HuyÒn tinh cÊp 8}}, vµ dÜ nhiªn kh«ng thÓ thiÕu {{An bang ®iÒn hoµng th¹ch ngäc béi}}.",
				   "HiÓu råi/OnExit"});	
end;

function main_task_give()
	local nTask = equipexTaskState();
	
	local aryTaskNeed = {}; 
	
	if nTask>0 and nTask<=4 then
		aryTaskNeed = aryNeedItem[nTask];
	end;
	
	local szTask = "";
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		szTask = szTask.."<color=yellow>"..aryTaskNeed[i][1].."<color><enter>";
	end;
	
	local szTalk = {};
	tinsert(szTalk, "<dec><npc>Ng­¬i ®· thu thËp ®Çy ®ñ ch­a?<enter><enter>"..szTask);
	tinsert(szTalk, "Giao nguyªn liÖu chÕ t¹o An bang Hoµn mü/giveTaskNeedDialog");
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		tinsert(szTalk, "Ta kh«ng muèn tiÕp tôc chÕ t¹o n÷a./ib_nexttask_cancel");
	end;
	tinsert(szTalk, "Rêi khái/OnExit");
	
	CreateTaskSay(szTalk);
end;


-- Ã¿Ò»²½ÈÎÎñÍê³ÉÊ±µÄ´¦Àí
function main_task_finish()
	
	local nTask = equipexTaskState();
	local nRandomSeed = 0;
	local nGold = 0;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- ÊÇ·ñÉ¾³ıÎïÆ·ÕıÈ·
	local i=0;

	-- É¾³ıÈÎÎñËùĞèÒªµÄÎïÆ·
	for i=1, nItem do
		nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
		
		-- Òì³£´¦Àí£¬Èç¹ûÓĞÉ¾³ı²»³É¹¦£¬ÔòÖ±½Ó½«ÈÎÎñ±ä³É»¹Ã»Íê³É
		if nResult~=1 then
			Say("NhiÖm vô ph¸t sinh lçi, kh«ng thÓ hoµn thµnh!", 0);
			return
		end;
		
	end;
			
	if nTask>0 and nTask<=4 then
		
		nGold = aryItem[nTask][1];
		
		nRandomSeed = GetTask(ID_EQUIPEX_TASK_RANDOMSEED);
		
		-- AddItemEx Ö¸ÁîĞèÒª½«»Æ½ğĞòºÅ -1
		AddItemEx(4, nRandomSeed, 1, 0, nGold - 1, 0, 0, 0, 0, 0);
		
		CDebug:MessageOut("ChÕ t¹o thµnh c«ng 1 mãn An bang hoµn mü, m· sè:"..nGold.." NhiÖm vô ngÉu nhiªn:"..nRandomSeed);
		WriteTaskLog("ChÕ t¹o thµnh c«ng 1 mãn An bang hoµn mü, m· sè:"..nGold.." NhiÖm vô ngÉu nhiªn:"..nRandomSeed);
		
	end;
	
	SetTask(ID_EQUIPEX_FINISH, 1);
	
	Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc: <color=yellow>"..aryItem[nTask][3].."<color>!");
	
	-- Èç¹ûËùÓĞÈÎÎñ¾ùÍê³É£¬ÔòÎŞÂÛÈçºÎ¶¼½«ÈÎÎñÖÃÎª×îºóÒ»²½ÒÑ¾­Íê³É×´Ì¬
	if GetTask(ID_EQUIPEX_TOTAL)==1 then
		SetTask(ID_EQUIPEX_TASK, 4);
	end;
	
	if nTask==4 then
		SetTask(ID_EQUIPEX_TOTAL, 1);
	end;
	
end;


function equipexTaskState()
	return GetTask(ID_EQUIPEX_TASK);
end;


function giveTaskNeedDialog()
	GiveItemUI("Giao vËt phÈm cho thî rÌn", "H·y ®Æt c¸c nguyªn liÖu cÇn thiÕt vµo!", "checkTaskNeed", "OnExit");
end;


function checkTaskNeed(nCount)
	local aryTaskNeed = aryNeedItem[equipexTaskState()];

	-- ÈÎÎñËùĞèÒªÎïÆ·µÄ MAP
	local aryNeed = {};
	
	-- ËùĞèÒªÉ¾³ıÎïÆ·µÄÊı×é
	local aryDelItem = {};		
	
	-- ÈÎÎñËùĞèÒªµÄÎïÆ·×ÜÊı
	local nNeed = getTaskCollectNum();

	-- ÈÎÎñËùÒªµÄÎïÆ·±àºÅ
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	print(-100, w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality);
	-- Íæ¼Ò´«½øÀ´µÄÎïÆ·±àºÅ
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	print(1000, nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex);
	-- Èç¹ûÎïÆ·ĞèÒª¼ÇÂ¼Ëæ»úÖÖ×Ó£¬Ôò¼ÇÂ¼ĞòºÅ
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- ÕæÊµµÄÎïÆ·ÊıÁ¿
	local nRealCount, nCheckCount = 0, 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- Èç¹ûÎïÆ·ÊıÁ¿ÓëÒªÕÒµÄÊıÁ¿²»·û£¬Ö±½Ó·µ»Ø
	if nRealCount ~= nNeed then
		Say("Sè l­îng vËt phÈm b¹n ®Ó vµo kh«ng chİnh x¸c!", 0);
		return 0;
	end;
	
	-- ¹¹ÔìÈÎÎñËùĞèÒªÎïÆ·µÄ MAP
	for i=1, getn(aryTaskNeed) do
		
		w_Genre      = aryTaskNeed[i][2];
		w_Detail     = aryTaskNeed[i][3];
		w_Particular = aryTaskNeed[i][4];
		w_Level      = aryTaskNeed[i][5];
		w_GoodsFive  = aryTaskNeed[i][6];
		w_GoodsNum   = aryTaskNeed[i][8];
		
		w_Quality    = aryTaskNeed[i][7];
		
		nRandomSeedRecord = aryTaskNeed[i][9];
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;

		tmpNeedKey = tostring(w_Quality)..","..
					 tostring(w_Genre)..","..
					 tostring(w_Detail)..","..
					 tostring(w_Particular);
		
		-- Èç¹ûÃ»ÓĞÕâ¸ö MAP KEY Ôò³õÊ¼»¯
		if aryNeed[tmpNeedKey] then
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		else
			aryNeed[tmpNeedKey]={};
			tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
		end;
		CDebug:MessageOut("Sè vËt phÈm t¹o thµnh: ["..tmpNeedKey.."]:"..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		CDebug:MessageOut("KiÓm tra vËt phÈm:"..tmpGetKey);
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
				
				CDebug:MessageOut("KiÓm tra vËt phÈm:"..tmpGetKey);
			
				-- Èç¹ûÈÎÎñÎïÆ·²»ĞèÒªÅĞ¶ÏÎåĞĞ»òÕßµÈ¼¶µÄ
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				CDebug:MessageOut("Tham sè vËt phÈm:"..tmpGetKey.."level:"..tmpLevel.."  five:"..tmpFive);
				CDebug:MessageOut("Tham sè nhiÖm vô:"..tmpGetKey.."level:"..aryNeed[tmpGetKey][j][1].."  five:"..aryNeed[tmpGetKey][j][2]);
				
				-- Èç¹ûÏà¶ÔÓ¦µÄ KEY µÄÎåĞĞºÍµÈ¼¶¶¼·ûºÏµÄ»°
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- Èç¹û·ûºÏÌõ¼şµÄÎïÆ·ĞèÒª¼ÇÂ¼Ëæ»úÖÖ×Ó£¬Ôò¼ÇÂ¼
					-- ¼ÇÂ¼µÄ¸ñÊ½Îª£º[ÈÎÎñÃû][Ëæ»úÖÖ×ÓĞòºÅ][Ëæ×ÓÖÖ×ÓÊı]
					if aryNeed[tmpGetKey][j][5]==1 then
						
						-- ¼ì²éÕâ¼ş»Æ½ğÊÇ·ñÓĞ±£ÖÊÆÚ
						local nExpiredTime = ITEM_GetExpiredTime(nIndex);
						if nExpiredTime > 0 then
							CreateTaskSay({"<dec><npc>Kh¸ch quan ®Æt vµo kh«ng ®óng trang bŞ ta cÇn!",
										   "Ta ®· giao nhÇm råi!/OnExit"});
							return
						end;
						
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTask(ID_EQUIPEX_TASK_RANDOMSEED, nRandomSeed);
					end;
										
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					CDebug:MessageOut("KiÓm tra vËt phÈm:"..tmpGetKey.." Th«ng qua!");
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- Çå¿Õ·ûºÏÌõ¼şµÄÊı×é
			aryDelItem = {};
			
			Say("VËt phÈm b¹n ®Ó vµo kh«ng chİnh x¸c!", 0);
			return 0;
		end;
		
	end;
	
	-- ¼ì²éÊÇ²»ÊÇËùÓĞµÄÎïÆ·¶¼ÕıÈ·
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("VËt phÈm b¹n ®Ó vµo kh«ng chİnh x¸c!", 0);
				return 0;
			end;
		end;
	end;
	
	-- ¼ÇÂ¼Ò»¹²ÓĞ¶àÉÙ¸öÎïÆ·ĞèÒªÉ¾³ı
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("LiÖt kª nh÷ng vËt phÈm cÇn lo¹i bá:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("CÇn ph¶i lo¹i bá:"..aryDelItem[i]);
	end;
	
	-- ÈÎÎñÍê³ÉÊ±µÄ´¦Àí
	main_task_finish();
	
	return 1;

end;

-- ¼ÆËãÒ»¸öÈÎÎñËùĞèÒªµÄÎïÆ·ÊıÁ¿
function getTaskCollectNum()
	local aryTaskNeed = aryNeedItem[equipexTaskState()];
	local nNum = 0;
	local i=0;
	
	for i=1, getn(aryTaskNeed) do
		nNum = nNum + aryTaskNeed[i][8];
	end;
	
	return nNum;
end;


-- ½«Ò»¸ö´«½øÀ´µÄÎïÆ·Ë÷Òı×ª»»³ÉÒ»¸ö STRING µÄ KEY£¬ÒÔ¼°·µ»ØµÈ¼¶ºÍÎåĞĞ
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
CDebug:MessageOut("KiÓm tra vËt phÈm aaa:"..nGenre..","..nDetail..","..nParticular);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- Íæ¼ÒÍê³ÉÒ»Ì×ÈÎÎñºó¿ÉËæÒâ½øĞĞ°²°îµÄÍêÃÀ
function ib_nexttask_talk()
	CreateTaskSay({"<dec><npc>Ng­¬i ®· nhËn ®­îc mét bé An bang Hoµn mü nhê vµo nh÷ng nç lùc ®¸ng khİch lÖ. NÕu cßn muèn tiÕp tôc chÕ t¹o, cã thÓ ®Õn t×m l·o phu.",
				   "Ta muèn tiÕp tôc chÕ t¹o An bang hoµn mü - Cóc hoa th¹ch chØ hoµn/#ib_nexttask_main(1)",
				   "Ta muèn tiÕp tôc chÕ t¹o An bang Hoµn mü - Kª huyÕt th¹ch giíi chØ/#ib_nexttask_main(2)",
				   "Ta muèn tiÕp tôc chÕ t¹o An bang Hoµn mü - B¨ng tinh th¹ch h¹ng liªn/#ib_nexttask_main(3)",
				   "Ta muèn tiÕp tôc chÕ t¹o An bang Hoµn mü - §iÒn hoµng th¹ch ngäc béi/#ib_nexttask_main(4)",
				   "§Ó ta suy nghÜ l¹i./OnExit"});	
end;


-- ÖØĞÂ¸øÍæ¼Ò¿ªÊ¼Ò»¸öÈÎÎñ
function ib_nexttask_main(nSelect)
	if nSelect==1 then main_task_001(); end;
	if nSelect==2 then main_task_002(); end;
	if nSelect==3 then main_task_003(); end;
	if nSelect==4 then main_task_004(); end;
end;


-- È¡ÏûÈÎÎñ
function ib_nexttask_cancel()
	SetTask(ID_EQUIPEX_TASK, 4);
	SetTask(ID_EQUIPEX_FINISH, 1);
	Msg2Player("<color=yellow>B¹n ®· hñy bá lÇn chÕ t¹o nµy<color>!");
end;


-- Íæ¼ÒÒª»¹Ô­×°±¸µÄ¶Ô»°
function ib_nexttask_revert()
	CreateTaskSay({"<dec><npc>VÉn kh«ng c¶m thÊy hµi lßng sao? Th«i ®­îc, ta cã thÓ gióp {{Kh«i phôc nguyªn tr¹ng}} thµnh {{Trang bŞ An bang phæ th«ng}}, {{Thuéc tİnh cã thÓ sÏ kh¸c chót so víi tr­íc ®©y}}. Kh¸ch quan nªn suy nghÜ kü!",
				   "Ta muèn kh«i phôc l¹i An Bang Cóc Hoa Th¹ch ChØ Hoµn/#ib_nexttask_revert_talk(1)",
				   "Ta muèn kh«i phôc l¹i Kª HuyÕt Th¹ch Giíi ChØ/#ib_nexttask_revert_talk(2)",
				   "Ta muèn kh«i phôc l¹i B¨ng Tinh Th¹ch H¹ng Liªn/#ib_nexttask_revert_talk(3)",
				   "Ta muèn kh«i phôc l¹i B¨ng §iÒn Hoµng Th¹ch Ngäc Béi/#ib_nexttask_revert_talk(4)",
				   "§Ó ta suy nghÜ l¹i./OnExit"});
end;

-- »¹Ô­µÄÈ·ÈÏ¹ı³Ì
function ib_nexttask_revert_talk(nId)
	CreateTaskSay({"<dec><npc>Kh¸ch quan thËt sù muèn kh«i phôc nguyªn tr¹ng trang bŞ An bang nµy sao? Chi phİ lµ {{300  v¹n l­îng}}, cã ®ång ı kh«ng?",
				   "§­îc, ta ®ång ı!/#ib_nexttask_revert_dialog("..nId..")",
				   "§Ó ta suy nghÜ l¹i./OnExit"});
end;


-- µ¯³ö¸øÓè½çÃæ
function ib_nexttask_revert_dialog(nId)
	if GetCash()<3000000 then
		CreateTaskSay({"<dec><npc><sex> x¸c nhËn mang theo ®ñ {{300  v¹n l­îng}} chø?", "KÕt thóc ®èi tho¹i/OnExit"});
	else
		GiveItemUI("Giao trang bŞ An bang", "H·y ®Æt"..aryItem[nId][3].." vµo.", "ib_nexttask_revert_main", "OnExit");
	end;	
end;


-- »¹Ô­µÄÖ÷¹ı³Ì
function ib_nexttask_revert_main(nCount)
	
	local nIndex = 0;
	local nQuality = 0;
	local nSelect = 0;
	local nResult = 0;
	local nCreateResult = 0;
	local aryCreateIndex = {};
	local i = 0;
	
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta chØ cÇn {{1 mãn}} {{Trang bŞ An bang}} Hoµn mü lµ ®ñ råi, h·y kiÓm tra l¹i!",
					   "KÕt thóc ®èi tho¹i/OnExit"});
		return
	end;
	
	nIndex = GetGiveItemUnit(nCount);
	nQuality = GetGlodEqIndex(nIndex);
	
	for i=1, 4 do
		if nQuality==aryItem[i][1] then
			nSelect = i;
			break;
		end;
	end;
	
	if nSelect==0 then
		CreateTaskSay({"<dec><npc>Ta chØ cÇn {{1 mãn}} {{Trang bŞ An bang}} Hoµn mü lµ ®ñ råi, h·y kiÓm tra l¹i!",
					   "KÕt thóc ®èi tho¹i/OnExit"});
		return
	end;
	
	-- ¿ªÊ¼²úÉúÁÙÊ±×°±¸£¬¿´¿´ÊÇ·ñ·ûºÏ
	nCreateResult, aryCreateIndex = createLikeEquip(nIndex, aryItem[nSelect][2], aryItem[nSelect][5], 10);
	
	if nCreateResult>0 then

		-- ÏÈÉ¾³ıÔ­À´µÄ»Æ½ğ×°±¸
		nResult = RemoveItemByIndex(nIndex);
		
		-- Òì³£´¦Àí£¬É¾³ıÎïÆ·²»³É¹¦Ê±
		if nResult~=1 then
			CreateTaskSay({"<dec><npc>ThËt ®¸ng tiÕc, lÇn nµy ta thÊt b¹i råi, lÇn sau ghĞ l¹i thö xem sao.",
						   "KÕt thóc ®èi tho¹i/OnExit"});	
			WriteTaskLog("[Lçi nghiªm träng]Kh«i phôc 1 trang bŞ An bang thÊt b¹i:"..aryItem[nSelect][4]);
			return
		end;
		
		CDebug:MessageOut("NhËn ®­îc trŞ sè chİnh x¸c:"..nCreateResult);
		
		AddItemByIndex(nCreateResult);
		
		WriteTaskLog("Kh«i phôc nguyªn tr¹ng Trang bŞ An bang thµnh c«ng:"..aryItem[nSelect][4]);
		
		-- É¾³ıÉú³ÉµÄÁÙÊ±×°±¸£¬³ıÁËÕıÈ·µÄÄÇ¸ö
		for i=1, getn(aryCreateIndex) do
			if aryCreateIndex[i]~=nCreateResult then
				RemoveItemByIndex(aryCreateIndex[i]);
			end;
		end;

		CreateTaskSay({"<dec><npc>Cuèi cïng còng kh«i phôc mãn {{"..aryItem[nSelect][3].."}} trë vÒ nguyªn tr¹ng, kh¸ch quan cã thÓ mang ®i ®­îc råi!",
				       "KÕt thóc ®èi tho¹i/OnExit"});	
		-- ¿ÛÇ®
		Pay(3000000);
		Msg2Player("B¹n ®· giao cho Thî rÌn <color=yellow>300 v¹n tiÒn c«ng<color>!");
		       		
	else
		CreateTaskSay({"<dec><npc>Kh«i phôc nguyªn tr¹ng {{thÊt b¹i råi}}, thËt ng¹i qu¸, ta {{chØ nhËn mét n÷a tiÒn c«ng}} th«i!",
					   "KÕt thóc ®èi tho¹i/OnExit"});	
					   
		-- É¾³ıÉú³ÉµÄÁÙÊ±×°±¸
		for i=1, getn(aryCreateIndex) do
			RemoveItemByIndex(aryCreateIndex[i]);
		end;
		
		-- ¿ÛÇ®
		Pay(1500000);
		Msg2Player("B¹n ®· tr¶ cho Thî rÌn <color=yellow>150 v¹n tiÒn c«ng<color>!");

		WriteTaskLog("Kh«i phôc nguyªn tr¹ng Trang bŞ An bang thÊt b¹i:"..aryItem[nSelect][4]);		
	end;
	
	return
	
end;


-- ¼«Æ·°²°îÍêÃÀ
function top_equipex_dialog()
	CreateTaskSay({"<dec><npc>Giao trang bŞ An bang Cùc phÈm cho ta, ta sÏ gióp chÕ tao thµnh {{Trang bŞ An bang hoµn mü cùc phÈm}}, dÜ nhiªn lµ rÊt khã kh¨n, {{tiÒn c«ng mçi lÇn"..NUM_PAY_TOPITEMTOPERFECT.."  v¹n l­îng}}, cã ®ång ı kh«ng?",
				   "Tèt qu¸, h·y gióp ta chÕ t¹o thµnh trang bŞ Hoµn mü/top_equipex_give",
	               "§Ó ta suy nghÜ kü l¹i xem/OnExit"});
end;

function top_equipex_give()
	if GetCash()<NUM_PAY_TOPITEMTOPERFECT*10000 then
		CreateTaskSay({"<dec><npc><sex> cã mang theo ®ñ  {{"..NUM_PAY_TOPITEMTOPERFECT.."  v¹n l­îng}} trªn ng­êi chø?", "KÕt thóc ®èi tho¹i/OnExit"});
	else
		GiveItemUI("Giao trang bŞ An bang Cùc phÈm", "Xin h·y ®Æt vµo Trang bŞ An bang Cùc phÈm", "top_equipex_main", "OnExit", 1);
	end;		
end;

function top_equipex_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta chØ cÇn {{1 mãn trang bŞ An bang Cùc phÈm}} lµ ®ñ råi, h·y kiÓm tra l¹i!",
					   "KÕt thóc ®èi tho¹i/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	-- ¼ì²éÕâ¼ş»Æ½ğÊÇ·ñÓĞ±£ÖÊÆÚ
	local nExpiredTime = ITEM_GetExpiredTime(nIndex);
	if nExpiredTime > 0 then
		CreateTaskSay({"<dec><npc>Kh¸ch quan ®Æt vµo kh«ng ®óng trang bŞ ta cÇn!",
					   "Ta ®· giao nhÇm råi!/OnExit"});
		return
	end;
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][2]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>VŞ <sex> nµy, vËt phÈm ®Æt vµo kh«ng ph¶i lµ {{Trang bŞ An bang Cùc phÈm}}, h·y kiÓm tra l¹i!",
					   "KÕt thóc ®èi tho¹i/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_TOPITEMTOPERFECT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- »ñÈ¡°ó¶¨×´Ì¬
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;

	-- AddItemEx Ö¸ÁîĞèÒª½«»Æ½ğĞòºÅ -1
	-- AddGoldItem(0, aryTopItem[nAryIndex][1]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][1] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
	
	Msg2Player("B¹n ®· giao cho Thî rÌn <color=yellow>"..NUM_PAY_TOPITEMTOPERFECT.." v¹n tiÒn c«ng<color>!");
	Msg2Player("ChÕ t¹o thµnh c«ng: <color=yellow>"..aryTopItem[nAryIndex][3].."<color>!");
	
	WriteTaskLog("ChÕ t¹o thµnh c«ng:"..aryTopItem[nAryIndex][3]);
end;


-- ¼«Æ·ÍêÃÀ°²°î»¹Ô­
function top_revert_dialog()
	CreateTaskSay({"<dec><npc>VÉn kh«ng c¶m thÊy hµi lßng víi {{Trang bŞ An bang hoµn mü [Cùc phÈm]}} sao? Th«i ®­îc, ta cã thÓ gióp {{Kh«i phôc nguyªn tr¹ng}} thµnh {{Trang bŞ An bang Cùc phÈm}}, {{Thuéc tİnh hoµn toµn gièng tr­íc ®©y}}. {{Chi phİ lµ"..NUM_PAY_PERFECTITEM_REVERT.."  v¹n l­îng}}, cã ®ång ı kh«ng?",
				   "Tèt qu¸, h·y gióp ta chÕ t¹o thµnh trang bŞ Hoµn mü/top_revert_give",
	               "§Ó ta suy nghÜ kü l¹i xem/OnExit"});	
end;


function top_revert_give()
	if GetCash()<NUM_PAY_PERFECTITEM_REVERT*10000 then
		CreateTaskSay({"<dec><npc><sex> cã mang theo ®ñ  {{"..NUM_PAY_PERFECTITEM_REVERT.."  v¹n l­îng}} trªn ng­êi chø?", "KÕt thóc ®èi tho¹i/OnExit"});
	else
		GiveItemUI("Giao Trang bŞ An bang Hoµn mü [Cùc phÈm]", "Xn h·y ®Æt vµo Trang bŞ An bang Hoµn mü [Cùc phÈm]", "top_revert_main", "OnExit", 1);
	end;		
	
end;


function top_revert_main(nCount)
	if nCount~=1 then
		CreateTaskSay({"<dec><npc>Ta chØ cÇn {{1 mãn Trang bŞ An bang Hoµn mü [Cùc phÈm]}} lµ ®ñ råi, h·y kiÓm tra l¹i!",
					   "KÕt thóc ®èi tho¹i/OnExit"});
		return
	end;
	
	local nIndex = GetGiveItemUnit(nCount);
	local nQuality = GetGlodEqIndex(nIndex);
	local nAryIndex = 0;
	local nCheck = 0;
	
	CDebug:MessageOut("M· Trang bŞ An bang hoµn mü cùc phÈm lµ:"..nQuality);
	
	for i=1, getn(aryTopItem) do
		if aryTopItem[i][1]==nQuality then
			nAryIndex = i;
			nCheck = 1;
			break;
		end;
	end;
	
	if nCheck==0 then
		CreateTaskSay({"<dec><npc>VŞ <sex> nµy, vËt phÈm ®Æt vµo kh«ng ph¶i lµ {{Trang bŞ An bang Hoµn mü [Cùc phÈm]}}, h·y kiÓm tra l¹i!",
					   "KÕt thóc ®èi tho¹i/OnExit"});		
		return
	end;
	
	Pay(NUM_PAY_PERFECTITEM_REVERT * 10000);
	
	local nItemBindState = GetItemBindState(nIndex)	-- »ñÈ¡°ó¶¨×´Ì¬
	local nResult = RemoveItemByIndex(nIndex);
	
	if nResult~=1 then return end;
	
	-- AddGoldItem(0, aryTopItem[nAryIndex][2]);
	local nServerItemIndex = NewItemEx(4, 0, 1, 0, aryTopItem[nAryIndex][2] - 1, 0, 0, 0, 0, 0);	
	
	if nItemBindState~=0 then
		SetItemBindState(nServerItemIndex, nItemBindState)
	end;
	
	AddItemByIndex(nServerItemIndex);
		
	Msg2Player("B¹n ®· giao cho Thî rÌn <color=yellow>"..NUM_PAY_PERFECTITEM_REVERT.." v¹n tiÒn c«ng<color>!");
	Msg2Player("Kh«ng phôc nguyªn tr¹ng thµnh c«ng: <color=yellow>"..aryTopItem[nAryIndex][4].."<color>!");
	
	WriteTaskLog("Kh«ng phôc nguyªn tr¹ng thµnh c«ng:"..aryTopItem[nAryIndex][4]);		
end;


function OnExit()
	
end;