Include("\\script\\tong\\workshop\\workshop_head.lua");

if (MODEL_GAMESERVER == 1) then --Èç¹ûÊÇGameServer
-- ¶ÁÈëËæ»úÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\system\\task_main.lua");
Include([[\script\tong\workshop\tongcolltask.lua]]);
end

aLevelCoef = {}

aLevelRenWuPrice = {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\tianyi_level_data.txt", "tianyiLevelData")
	if b1~=1 then
		print("§äc tÖp config Thiªn ı ph­êng thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("tianyiLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("tianyiLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("tianyiLevelData", y, "OUTPUT_COEF"))
		aLevelRenWuPrice[nLevel] = tonumber(TabFile_GetCell("tianyiLevelData", y, "PRICE"))
	end
	--TabFile_UnLoad("tianyiLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n Thiªn ı ph­êng") ~= 1 then
		return 0
	end
	Say("<#>Tæng Qu¶n Thiªn ı Ph­êng:  TÕ ngé di thiªn ı, MÖnh ®å tù b¶ ¸c, thÕ kı , thÕ kı!", 3, 
		"NhËn nhiÖm vô ngÉu nhiªn/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"LÖnh bµi nhiÖm vô ®Æc biÖt/#use_g_1_ok22".."("..nTongID..","..nWorkshopID..")",
		"Kh«ng cÇn ®©u/cancel");
	return 1;
end

----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£»î¶¯
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --³õÊ¼»¯¿ÉÁìÈ¡ÈÎÎñÊı
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nHongbaoLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nHongbaoLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelRenWuPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	_dbgMsg("Sè lÇn nhËn cßn l¹i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>Tæng Qu¶n Thiªn ı Ph­êng:  NhiÖm vô ngÉu nhiªn h«m n·y ®· kÕt thóc, h«m sau l¹i ®Õn vËy!", 0)
		return 0;
	end
	Say("<#>Ng­¬i ph¶i tèn phİ <color=yellow>"..aLevelRenWuPrice[nLevel].."<color>NhÊn ®iÓm cèng hiÕn nhËn ®­îc nhiÖm vu lÖnh bµi ngÉu nhiªn, ®ång ı kh«ng?", 2,
		"ta muèn ®æi/#use_g_1_ok21".."("..nTongID..","..nWorkshopID..")",
		"Hñy bá /cancel")
end

function use_g_1_ok22(nTongID, nWorkshopID)--ÁìÈ¡ÌØÊâÈÎÎñÁîÅÆ
	nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	if (nLevel < 4) then
		Say("Tæng qu¶n Thiªn ı ph­êng: §¼ng cÊp Thiªn ı ph­êng ®¹t cÊp <color=yellow>4<color> míi cã thÓ chÕ t¹o lÖnh bµi nhiÖm vô ®Æc biÖt. Ng­¬i muèn lµm g×?", 2, "T×m hiÓu lÖnh bµi nhiÖm vô ®Æc biÖt/tong_tylp_aobut", "Rêi khái/cancel");
		return
	end;
	Say("Tæng qu¶n Thiªn ı ph­êng: GÇn ®©y ta cã mét sè nhiÖm vô ®Æc biÖt cÇn gi¶i quyÕt, kh«ng nh÷ng gióp ng­¬i n©ng cao kinh nghiÖm, mµ cßn gi¶m ®­îc PK, ng­¬i muèn thö xem kh«ng?", 7, 
	"T×m hiÓu LÖnh bµi nhiÖm vô ®Æc biÖt/tong_tylp_aobut", 
	"§æi lÖnh bµi nhiÖm vô ®Æc biÖt/#tong_tylp_tobuy("..nLevel..")",
	"Xem tiÕn ®é nhiÖm vô lÖnh bµi/tong_tylp_knowabout",
	"Ta muèn ®æi nhiÖm vô/tong_tylp_turn",
	"Ta nhËn ®­îc ®ñ Th­ tiÕn cö råi/tong_tylp_award",
	"Hñy bá nhiÖm vô/tong_tylp_giveup",
	"Ta muèn rêi khái!/cancel");
end;

function tong_tylp_turn()
	local nLPLvl = get_lp_lvl();
	if (0 == nLPLvl) then
		Say("Ng­¬i ch­a nhËn nhiÖm vô lÖnh bµi.", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nContri, nConLimit, nMax;
	nContri = GetContribution();
	nConLimit = tab_buyLingPai_gxd[nLPLvl] / 10;
	if (nContri < nConLimit) then
		Say("§æi 1 LÖnh bµi nhiÖm vô <color=yellow>cÊp "..nLPLvl.."<color> cÇn <color=yellow> "..nConLimit.." ®iÓm <color>cèng hiÕn (gi¸ lÖnh bµi chØ b»ng 10% gi¸ ban ®Çu), ®iÓm cèng hiÕn cña ng­¬i kh«ng ®ñ.", 0);
		return
	end;
	rwlp_cleartask()	--Çå³ıÈÎÎñ±äÁ¿£»
	for i = 1, 10 do
		nLevel = 1;
		nWorkshopIdx = random(1, 7); -- Ëæ»úÒ»¸ö×÷·»
		
		if (nLPLvl == 1) then
			nLevel = random(1, 3);
		elseif (nLPLvl == 2) then
			nLevel = random(4, 6);
		elseif (nLPLvl == 3) then
			nLevel = random(7, 8);
		end;
		
		nCount = random(1, 9);
		nMax = get_workshop_count(nWorkshopIdx, nLevel);
		if (nCount > nMax) then
			nCount = nMax;
		end;
		if (nCount > 0) then
			break
		end;
	end;
	AddContribution(-1 * nConLimit);
	Msg2Player("Sö dông <color=yellow>"..nConLimit.." ®iÓm <color> cèng hiÕn ®æi lÊy 1 lÖnh bµi nhiÖm vô cÊp <color=yellow>"..nLPLvl..".");
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	nt_SetTask(TASK_LP_COUNT, nCount);
	Say("Sö dông <color=yellow>"..nConLimit.." ®iÓm <color> cèng hiÕn ®æi lÊy 1 lÖnh bµi nhiÖm vô cÊp <color=yellow>"..nLPLvl.."cÊp-<color>NhiÖm vô lÖnh bµi. <color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color> d¹o nµy tinh thÇn kh«ng ®­îc tèt, muèn lªn kinh øng thİ nh­ng cÇn ph¶i thu thËp ®ñ Th­ tiÕn cö cña c¸c danh sü n¬i ®©y. PhiÒn ng­¬i ®i t×m gióp <color=yellow>"..nCount.." vŞ Ph­êng tæng qu¶n cÊp "..nLevel.."<color>CÊp trë lªn kh«ng cïng bang héi <color=yellow>"..tab_Workshop[nWorkshopIdx].."<color>,®Ó nhËn th­ tiÕn cö cña hä.", 1, "§­îc, ta sÏ cè g¾ng./cancel")
end;

function get_lp_lvl()
	if (GetTask(TASK_LP_COUNT) == 0) then	--Èç¹ûÃ»ÓĞ°ï»áÌØÊâÁîÅÆÈÎÎñ
		return 0;
	end;
	local nLPLvl = ceil(GetTask(TASK_LP_ZONGGUANLEVEL) / 3);
	if (nLPLvl > 3) then
		nLPLvl = 3;
	elseif (nLPLvl < 1) then
		nLPLvl = 1;
	end;
	return nLPLvl;
end;

function tong_tylp_giveup()	--È¡ÏûÈÎÎñ
	if (GetTask(TASK_LP_COUNT) == 0) then
		Say("Tæng qu¶n Thiªn ı ph­êng: Ng­¬i kh«ng cã nhiÖm vô g× th× sao mµ hñy bá ®­îc chø?", 0)
		return
	end;
	nt_SetTask(TASK_LP_COUNT, 0);
	rwlp_cleartask()	--Çå³ıÈÎÎñ±äÁ¿£»
	Msg2Player("Tæng qu¶n Thiªn ı ph­êng: Ng­¬i ®· hñy bá nhiÖm vô <color=yellow>LÖnh bµi nhiÖm vô<color>.")
end;

function tong_tylp_tobuy(nLevel)--¹ºÂòÈÎÎñÁîÅÆ
	if (1 == TONG_GetPauseState(nTongID, nWorkshopID)) then
		Say("Tæng qu¶n Thiªn ı ph­êng: ThËt ®¸ng tiÕc, T¸c ph­êng ®ang t¹m ng­ng ho¹t ®éng. Bang héi cÇn ph¶i n¹p tiÒn vµo ng©n s¸ch chiÕn bŞ cho ®ñ sè b¶o tr× hµng tuÇn, vµ sau 12h ®ªm th× T¸c ph­êng míi cã thÓ ho¹t ®éng trë l¹i.", 0);
		Msg2Player("T¸c ph­êng ®· t¹m ngõng ho¹t ®éng, kh«ng thÓ nhËn bang vËt.");
		return
	end;
	
	local tab_selete = {};
	tinsert(tab_selete, "§æi lÖnh bµi cÊp 1/#tong_tylp_buy( 1 )");
	if (nLevel >= 7) then
		tinsert(tab_selete, "§æi lÖnh bµi cÊp 2/#tong_tylp_buy( 2 )")
	end
	if (nLevel >= 9) then
		tinsert(tab_selete, "§æi lÖnh bµi cÊp 3/#tong_tylp_buy( 3 )")
	end
	
	tinsert(tab_selete, "Ta muèn rêi khái!/cancel");
	Say("Tæng qu¶n Thiªn ı ph­êng: LÖnh bµi chia thµnh c¸c møc ®é tõ 1 ®Õn 3, lÖnh bµi cÊp 1 cÇn 100 ®iÓm cèng hiÕn, sau khi hoµn thµnh sÏ nhËn ®­îc 30 v¹n ®iÓm kinh nghiÖm vµ gi¶m ®i 2 PK; LÖnh bµi cÊp 2 cÇn 150 ®iÓm cèng hiÕn, sau khi hoµn thµnh sÏ nhËn ®­îc 40 v¹n ®iÓm kinh nghiÖm vµ gi¶m ®i 5 PK; LÖnh bµi cÊp 3 cÇn 200 ®iÓm cèng hiÕn, sau khi hoµn thµnh sÏ nhËn ®­îc 60 v¹n ®iÓm kinh nghiÖm vµ gi¶m ®i 10 PK. Ng­¬i ®ång ı ®æi kh«ng?", getn(tab_selete), tab_selete);
end;

function tong_tylp_knowabout()
	if (GetTask(TASK_LP_COUNT) == 0) then	--Èç¹ûÃ»ÓĞ°ï»áÌØÊâÁîÅÆÈÎÎñ
		Say("Ng­¬i ch­a nhËn nhiÖm vô lÖnh bµi.", 0);
		return
	end;
	local nNeedCount = GetTask(TASK_LP_COUNT);
	local nGetCount = rwlp_getjuanshucount();
	if (nGetCount >= nNeedCount and nGetCount > 0) then
		Say("Th­ tiÕn cö ®· nhËn ®ñ råi, h·y mau ®i t×m Tæng qu¶n Thiªn ı ph­êng ®i.", 0);
	end;
	Say("H·y ®Õn gÆp c¸c Ph­êng tæng qu¶n kh¸c nhau <color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."<color> ®Ó thu thËp ®ñ <color=yellow>"..nNeedCount.." bøc <color>Th­ tiÕn cö, ng­¬i chØ cã<color=yellow> "..nGetCount.." bøc<color> mµ th«i, h·y nç lùc h¬n!", 0);
end;

tab_buyLingPai_gxd = {100, 150, 200};
function tong_tylp_buy(nLPLvl1)--¹ºÂòÁîÅÆÊµÌå
	local nLPLvl = tonumber(nLPLvl1);
	local nAttr = GetContribution();
	if (nAttr < tab_buyLingPai_gxd[nLPLvl]) then
		Say("Tæng qu¶n Thiªn ı ph­êng: ThËt ®¸ng tiÕc, ®iÓm cèng hiÕn kh«ng ®ñ <color=yellow>"..tab_buyLingPai_gxd[nLPLvl].."<color>,Kh«ng thÓ mua vËt phÈm nµy, xin h·y næ lùc lÊy ®iÓm cèng hiÕn.", 0);
		Msg2Player("§iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ, kh«ng thÓ ®æi lÊy bang vËt.");
		return
	end;
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "Hµnh trang ph¶i cã hai « trèng.");
		return 
	end
	
	AddContribution(-tab_buyLingPai_gxd[nLPLvl]);
	
	_, nTongID = GetTongName();
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, 5);
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(tab_buyLingPai_gxd[nLPLvl]));
	
	nGoodIdx = 1101 + nLPLvl;
	--AddItem();
	local nRandomItemIndex = AddItem(6, 1, nGoodIdx, 0, 1, 0, 0);	--ÎïÆ·µÄid´ı¶¨
	SetSpecItemParam(nRandomItemIndex, 1, nLPLvl);	--½«ÁîÅÆµÈ¼¶¼ÇÂ¼
	SyncItem(nRandomItemIndex); -- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
	
	Msg2Player("B¹n tiªu tèn "..tostring(tab_buyLingPai_gxd[nLPLvl]).." ®iÓm cèng hiÕn!");
	Msg2Player("<color=green>B¹n nhËn ®­îc 1 h¹t"..nLPLvl.."!<color>");
end;

tab_LPAward = {[1] = {300000, 2}, [2] = {400000, 5}, [3] = {600000, 10}}
function tong_tylp_award()
	if (GetTask(TASK_LP_COUNT) == 0) then	--Èç¹ûÃ»ÓĞ°ï»áÌØÊâÁîÅÆÈÎÎñ
		Say("Ng­¬i ch­a nhËn nhiÖm vô lÖnh bµi.", 0);
		return
	end;
	
	local nGetCount = rwlp_getjuanshucount();
	local nGoalCount = GetTask(TASK_LP_COUNT);
	local nLPLvl = get_lp_lvl();
	local nPK = GetPK();
	local nDate = GetLocalDate("%m%d");
	local nday, nmon = mod(nDate, 100), floor(nDate / 100);
	local nTsk_Times = GetTask(TASK_LP_TIMESLIMIT);
	local ncurday, ncurmon, ncuttimes = GetByte(nTsk_Times, 2), GetByte(nTsk_Times, 3), GetByte(nTsk_Times, 1);
	
	if (nPK == 0) then
		Say("HiÖn t¹i b¹n kh«ng cã PK, kh«ng thÓ hoµn thµnh nhiÖm vô nµy ®­îc.", 0);
		return 0;
	end
	
	if (nday ~= ncurday or nmon ~= ncurmon) then
		ncurday = nday;
		ncurmon = nmon;
		ncuttimes = 0;
		nTsk_Times = SetByte(nTsk_Times, 2, ncurday);
		nTsk_Times = SetByte(nTsk_Times, 3, ncurmon);
		nTsk_Times = SetByte(nTsk_Times, 1, ncuttimes);
		SetTask(TASK_LP_TIMESLIMIT, nTsk_Times);
	end
	
	if (ncuttimes >= DAILY_MAX_TIMES) then
		Say(format("H«m nay b¹n thùc hiÖn nhiÖm vô nµy %d lÇn råi, ngµy mai h·y quay l¹i nhĞ.", DAILY_MAX_TIMES), 0);
		return 0;
	end
	
	if (nGetCount >= nGoalCount and nGetCount > 0) then
		ncuttimes = ncuttimes + 1;
		nTsk_Times = SetByte(nTsk_Times, 1, ncuttimes);
		SetTask(TASK_LP_TIMESLIMIT, nTsk_Times);
		
		Say("Tæng qu¶n Thiªn ı ph­êng: Ng­¬i h·y cßn trÎ, ®Ó ta xem t×nh tr¹ng PK cña ng­¬i thÕ nµo, ha ha…", 0);
		--Çå¿ÕÈÎÎñ±äÁ¿
		AddOwnExp(tab_LPAward[nLPLvl][1]);
		Msg2Player("B¹n nhËn ®­îc<color=yellow>"..tab_LPAward[nLPLvl][1].."<color>PhÇn th­ëng ®iÓm kinh nghiÖm.");
--		local nDecCount = tab_LPAward[nLPLvl][2];
		local nDecCount = PER_ASSIGNMENT_PK  
		if (nDecCount > nPK) then
			nDecCount = nPK;
		end;
		if (nDecCount > 0) then
			SetPK(nPK - nDecCount);
			Msg2Player("PK ®·m gi¶m <color=yellow>"..nDecCount.."<color>®iÓm.");
		else
			Msg2Player("PK ®· gi¶m xuèng cßn <color=yellow>0<color>.");
		end;
		rwlp_cleartask()	--Çå³ıÈÎÎñ±äÁ¿£»
	else
		Say("Tæng qu¶n Thiªn ı ph­êng: Ng­¬i ph¶i t×m ®­îc <color=yellow>"..nGoalCount.."<color>Bøc th­ tiÕn cö míi ®­îc, hiÖn t¹i ®· t×m ®­îc <color=yellow>"..nGetCount.."<color>c¸i", 0);
	end;
end;

function tong_tylp_aobut()--¹ØÓÚÌØÊâÁîÅÆ
	Say("Tæng qu¶n Thiªn ı ph­êng: NhiÖm vô lÖnh bµi yªu cÇu ph¶i t×m ®­îc mét sè bang héi mµ T¸c Ph­êng tháa m·n ®iÒu kiÖn, nãi chuyÖn víi Ph­êng tæng qu¶n cña hä, hä sÏ giao Th­ tiÕn cö cho ng­¬i. ChØ cÇn thu thËp ®ñ sè l­îng th­ yªu cÇu ®em vÒ cho ta th× cã thÓ hoµn thµnh nhiÖm vô.", 0);
end;

function use_g_1_ok21(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelRenWuPrice[nLevel]) then
		Say("<#>Tæng Qu¶n Thiªn ı Ph­êng:  xin l­îng thø, ®iÓm cèng hiÕn cña ng­¬i ch­a ®ñ!", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>Tæng Qu¶n Thiªn ı Ph­êng: thø mµ ng­¬i cÇn vÉn ch­a cã, xin h·y ®éi mét l¸t nhĞ!", 0)
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "Hµnh trang ph¶i cã hai « trèng.");
		return 
	end
	
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	if (GetContribution() < aLevelRenWuPrice[nLevel]) then
		return
	end
	
	local nRandomTaskID = createRandomTask();
	local nRandomItemIndex = 0;
	
	if nRandomTaskID~=nil and nRandomTaskID~=0 then
		
		AddContribution(-aLevelRenWuPrice[nLevel]);
		
		Msg2Player("B¹n tiªu tèn "..tostring(aLevelRenWuPrice[nLevel]).." ®iÓm cèng hiÕn!");
		
		nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
		SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
		
		-- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
		SyncItem(nRandomItemIndex);		
				
		Msg2Player("<color=green>Ng­¬i ®· nhËn ®­îc 1 lÖnh bµi nhiÖm vô ngÉu nhiªn! <color>");
	end;
end

function cancel()
end

else
-----------------Èç¹ûÊÇ¿Í»§¶Ë---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh«ng cã bang héi"	
	end
	local bOpen	--ÊÇ·ñ¿ªÆô
	local bPause --ÊÇ·ñÔİÍ£
	local nCurLevel --µ±Ç°µÈ¼¶
	local nUseLevel --µ±Ç°Ê¹ÓÃµÈ¼¶
	local nOpenFund --µ±Ç°¿ªÆôÏûºÄ
	local nMaintainFund --µ±Ç°Î¬»¤ÏûºÄ
	local nPrice  --µ±Ç°»»È¡ÈÎÎñÁîÅÆµÄ¹±Ï×¶È
	local dTokenCount	--µ±Ç°Ã¿ÈÕÈÎÎñÁîÅÆ²ú³ö×ÜÁ¿Ìá¸ß
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelRenWuPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
		else
			nPrice = "--"
			dTokenCount = "--"	
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ĞÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ĞÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextTokenCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éı¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"
	end	
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		nNextPrice = aLevelRenWuPrice[nUseLevel + 1] --ÏÂ¼¶»»È¡ÈÎÎñÁîÅÆµÄ¹±Ï×¶È
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --ÏÂ¼¶Ã¿ÈÕÈÎÎñÁîÅÆ²ú³ö×ÜÁ¿Ìá¸ß
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
	end
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>Dõng" elseif bOpen == 1 then state="<color=green>më " else state="<color=red>§ãng" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>CÊp\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>CÊp\n"..
			"Sè l­îng lÖnh bµi nhiÖm vô hµng ngµy t¨ng lªn: <color=gold>"..dTokenCount.."<color>LÇn\n"..		
			"§iÓm cèng hiÕn cÇn ®Ó ®æi lÖnh bµi nhiÖm vô: <color=gold>"..nPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>Sö dông ®¼ng cÊp tiÕp theo <color>\n"..
			"<color=water>N©ng cao lÖnh bµi nhiÖm vô h»ng ngµy sè l­îng sinh ra ®¹t giíi h¹n: <color=Violet>"..dNextTokenCount.."<color>LÇn\n"..	
			"§iÓm cèng hiÕn cÇn ®Ó ®æi lÖnh bµi nhiÖm vô: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Ch­a thµnh lËp<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp tiÕp theo<color>\n"..
			"<color=water>N©ng cao lÖnh bµi nhiÖm vô h»ng ngµy sè l­îng sinh ra ®¹t giíi h¹n: <color=Violet>"..dNextTokenCount.."<color>LÇn\n"..	
			"§iÓm cèng hiÕn cÇn ®Ó ®æi lÖnh bµi nhiÖm vô: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end

end