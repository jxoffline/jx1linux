-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ»¡°´øÒÕÍ¶Ê¦¡±Í·ÎÄ¼ş

-- Edited by ×Ó·Çô~
-- 2008/02/28 12:10

-- ======================================================

IncludeLib("LEAGUE");
Include("\\script\\misc\\daiyitoushi\\toushi_head.lua");
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua");
Include("\\script\\lib\\gb_modulefuncs.lua");
Include("\\script\\skill\\lvlup150_limit.lua")
Include("\\script\\global\\meridian\\meridian.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")
Include("\\script\\task\\metempsychosis\\translife_7.lua")

-- ¼ì²é¡°´øÒÕÍ¶Ê¦¡±£¬ÍË³öÃÅÅÉµÄÌõ¼ş£ºµÈ¼¶´ïµ½120¼¶£¬»ò120¼¶ÒÔÉÏ
function toushiCheckApplyState()
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (GetLastFactionNumber() == -1) then
		return TOUSHI_NOFACTERR;
	end
	
	return TOUSHI_SUCCEED;
end


-- ¼ì²é¡°´øÒÕÍ¶Ê¦¡±£¬¼ÓÈëĞÂÃÅÅÉÌõ¼ş
function toushiCheckTransFactState(nFactionNumb, nStage)
	local bFlag			= GetTask(TSK_TOUSHI_FLAG);				-- »ñµÃ×ªÍ¶Ê¦ÃÅµÄ±ê¼Ç
	local nMyFacNumb	= GetLastFactionNumber();				-- »ñµÃÔ­ÃÅÅÉID
	local nSex			= GetSex();								-- ½ÇÉ«ĞÔ±ğ
	local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- ÉÏ´Î×ªÍ¶Ê¦ÃÅ±ê¼Ç
	local nCurTime      = tonumber( GetCurServerTime() );
	
	if (bFlag == 0) then
		return TOUSHI_FLAGERR;
	end
	
	if (bFlag >= 2) then
		return TOUSHI_UNKNOWN;
	end
	
	if (nMyFacNumb == -1) then
		return TOUSHI_NOFACTERR;
	end
	
	--if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
	--    return TOUSHI_TIMEERR;
	--end
	if nFactionNumb == 10 then
		if CalcEquiproomItemCount(6, 1, 4328, 1) < 1 then
			return TOUSHI_NO_HUASHAN_ITEM
		end
		if ST_GetTransLifeCount() < TRANS_COUNT_LIMIT then
			return TOUSHI_TRANSLIFE_COUNT_LIMIT
		end
	end
	
	if ((nSex == 0 and (nFactionNumb == 4 or nFactionNumb == 5)) or (nSex == 1 and nFactionNumb == 0)) then
		return TOUSHI_MALEERR;
	end
	
	if (nMyFacNumb == nFactionNumb) then
		return TOUSHI_EQFACTERR;
	end
	
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (nStage == 2) then
		if (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then
			return TOUSHI_LGERR;
		end
		
		if (CalcItemCount(2,0,-1,-1,-1) > 0) then
			return TOUSHI_EQUIPERR;
		end
	end
	
	if (GetTask(TSK_TOUSHI_COUNT) == 0 and CalcFreeItemCellCount() < 2) then
		return TOUSHI_NOFREEBAG;
	end
	
	return TOUSHI_SUCCEED;
end


function toushiGetHierarchTitle(nFactionNumb)
	if (nFactionNumb == 7 or nFactionNumb == 3) then			-- Îå¶¾½Ì£¬ÌìÈÌ½Ì Îª½ÌÖ÷
		return TB_TOUSHI_HIERARCH[2];
	elseif (nFactionNumb == 1 or TB_TOUSHI_HIERARCH == 6) then	-- ÌìÍõ°ï£¬Ø¤°ï Îª°ïÖ÷
		return TB_TOUSHI_HIERARCH[3];
	else														-- ÆäËû ÎªÕÆÃÅ
		return TB_TOUSHI_HIERARCH[1];
	end
end


function toushiGetSexName(nSex)
	if (nSex == 0) then
		return "Nam";
	else
		return "N÷ ";
	end
end


function OnCancel()
end

function daiyitoushi_main(nFactionNumb)
	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
		Say("Xin lçi, c«ng n¨ng nµy t¹m thêi ®· bŞ ®ãng, thêi gian më l¹i sÏ ®ùoc th«ng b¸o sau ", 0);
		return 1;
	end
	
	local nFlag	= GetTask(TSK_TOUSHI_FLAG);
	local tbDes	= {"<dec><npc>Thiªn h¹ ®¹i lo¹n nh­  ngµy h«m nay, c¸c ®¹i m«n ph¸i trong vâ l©m ai còng chØ biÕt lo cho c¸i lîi cña m×nh, tïy theo chiÕn sù mµ bÕ quan,  trung nh©n vâ l©m th× bŞ tæn thÊt h¬n qu¸ nöa. VŞ kÕ vâ l©m h­¬ng háa, trïng t©n chÊn h­ng vâ l©m. T«n mÖnh vâ l©m minh chñ, kÓ tõ h«m nay c¸c ®¹i m«n ph¸i xãa bá c¸c quy t¾c, më réng m«n quy, cho phĞp c¸c ®Ö tö gia nhËp c¸c m«n ph¸i kh¸c, ®Ó cïng nhau Ên chøng vâ häc, s¸ng lËp ra nh÷ng tuyÖt häc vâ c«ng míi l¹, trung h­ng ng· vâ l©m."};
	
	if (nFlag == 0) then
		tinsert(tbDes, format("§¸i nghÖ ®Çu s­, chuyÓn m«n ph¸i/#toushiApplyEnter(%d)", nFactionNumb));
	elseif (nFlag == 1) then
		tinsert(tbDes, format("§¸i nghÖ ®Çu s­, b¸i nhËp m«n h¹/#toushiTransEnter(%d)", nFactionNumb));
	elseif (nFlag == 2 and GetLastFactionNumber() == nFactionNumb) then
		tbDes	= {"<dec><npc>NÕu nh­ ng­¬i ®· muèn gia nhËp bæn ph¶i, sau nµy ph¶i chuyªn t©m mµ khæ luyÖn, sím cã ngµy ngé ra ®­îc tuyÖt kü vâ häc"};
	else
		tbDes	= {"<dec><npc>Xem ra, vŞ <sex> nµy mang g¸nh nÆng trªn vai trïng t©n chÊn h­ng vâ l©m."};
	end
	
	tinsert(tbDes, " KÕt thóc ®èi tho¹i!/OnCancel");
	
	CreateTaskSay(tbDes);
end
--

-- ´øÒÕÍ¶Ê¦£¬×ªÍ¶ÃÅÅÉ
function toushiApplyEnter(nFactionNumb)
	
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ng­¬i ®· nhËn nhiÖm vô kü n¨ng 150, xin h·y hoµn thµnh nhiÖm vô råi h·y ®Õn gÆp ta")
		return 
	end
	local nSex	= GetSex();
	local szDes = "";
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (GetLastFactionNumber() ~= nFactionNumb) then
		CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_FLAGERR], " KÕt thóc ®èi tho¹i!/OnCancel"});
		return
	end
	
    local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- ÉÏ´Î×ªÍ¶Ê¦ÃÅ±ê¼Ç
	local nCurTime      = tonumber( GetCurServerTime() );
--Close check time wait to change menpai, by ThanhLD 20131024
--	if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
--	    CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TIMEERR], "½áÊø¶Ô»°/OnCancel"});
--	    return
--	end
	
	if (nSex == 1) then
		szDes = "{NÕu nh­ cã ®­îc tİn vËt cña bang chñ thiªn v­¬ng bang D­¬ng Anh th× cã thÓ gia nhËp m«n ph¸i thiªn v­¬ng.}";
	end
	
	szDes	= format("<dec><npc>Vâ häc trong giíi vâ l©m cña chóng ta b¸c ®¹i uyªn th©m, lµm s­ phô ta còng muèn më réng m«n quy ®Ó cïng nhau øng chİnh c¸c m«n ph¸i kh¸c, nay ta ®Ó ng­¬i rêi khái  bæn m«n ta còng cã thÓ thu nhËn %s m«n ph¸i ®Ö tö . %s<enter>, con ®­êng cÇu mong vâ häc qu¶ kh«ng dÔ dµng chót nµo, lµ mét s­ phô ta còng ph¶i thö th¸ch ng­¬i mét phen. NÕu nh­ ng­¬i cã thÓ{{®¹t ®Õn cÊp 120}} h¬n n÷a cßn ph¶i t×m vÒ ®©y cho bæn ph¸i tİn vËt ®· bŞ thÊt l¹c tõ l©u {{ “Tİn VËt M«n Ph¸i”}}, s­ phô  míi cho ng­¬i h¹ s¬n.", 
				toushiGetSexName(nSex),
				szDes);
	
	
	CreateTaskSay({szDes,
					format("%s yªn t©m, ®Ö tö sÏ ®em tİn vËt vÒ ®©y./OnCancel", szHierarchTitle),
					format("%s, Xin mêi xem ®©y cã ph¶i lµ tİn vËt m«n ph¸i?/#toushiApplyMenPaiXinWu(%d)", szHierarchTitle, nFactionNumb),
					" KÕt thóc ®èi tho¹i!/OnCancel"
				});
end

-- ¸øÓë½çÃæÌá½»ÃÅÅÉĞÅÎï
function toushiApplyMenPaiXinWu()
	local bFlag = toushiCheckApplyState();
	if (bFlag == TOUSHI_SUCCEED) then
		GiveItemUI("Tr×nh tİn vËt m«n ph¸i", "Bá tİn vËt m«n ph¸i vµo « trèng bªn d­íi.", "toushiApplyShowXinWu", "OnCancel", 1);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], " KÕt thóc ®èi tho¹i!/OnCancel"});
	end
end

-- ³öÊ¾ĞÅÎïÅĞ¶Ï£¬²¢½øĞĞÍË³öÃÅÅÉ´¦Àí
-- ÕâÀïµÄÍË³öÃÅÅÉ½ö½öÉèÖÃÔÊĞí×ªÍ¶ËûÃÅ±äÁ¿±ê¼Ç
function toushiApplyShowXinWu(nCount)
	if (nCount ~= 1) then
		CreateTaskSay({"<dec><npc>Tİn VËt M«n Ph¸i kh«ng ph¶i lµ mãn ®å ch¬i cña trÎ con. Kh«ng lÏ ng­¬i muèn lµm mê m¾t ta hay sao?", 
						"Tr×nh l¹i m«n ph¸i tİn vËt/toushiApplyMenPaiXinWu",
						"M¹n phĞp cho ta t×m l¹i mét lÇn n÷a/OnCancel"
					});
		return 0;
	end
	
	local nItemIdx = GetGiveItemUnit(nCount);		--ÓÉ¸øÓë½çÃæÖĞÎïÆ·ĞòºÅ»ñµÃÎïÆ·Ë÷Òı
	local nG, nD, nP = GetItemProp(nItemIdx);		--»ñµÃÎïÆ·µÄIDÊôĞÔÖµ
	local szKey = join({nG, nD, nP});
	
	if (szKey ~= join(TB_TOUSHI_MENPAIXINWU)) then
		CreateTaskSay({"<dec><npc>Tİn VËt M«n Ph¸i kh«ng ph¶i lµ mãn ®å ch¬i cña trÎ con. Kh«ng lÏ ng­¬i muèn lµm mê m¾t ta hay sao?", 
						"Tr×nh l¹i m«n ph¸i tİn vËt/toushiApplyMenPaiXinWu",
						"M¹n phĞp cho ta t×m l¹i mét lÇn n÷a/OnCancel"
					});
		return 0;
	end
	
	--
	RemoveItemByIndex(nItemIdx);					-- É¾³ıÃÅÅÉĞÅÎï
	SetTask(TSK_TOUSHI_FLAG, 1);					-- ÉèÖÃ´øÒÕÍ¶Ê¦ÉêÇë³É¹¦±ê¼Ç
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,FactionId:%d%s",
				"§¸i nghÖ ®Çu s­",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), GetLastFactionNumber(),
				"§­a ra m«n ph¸i tİn vËt, yªu cÇu chuyÓn m«n ph¸i thµnh c«ng"));
				
	CreateTaskSay({"<dec><npc>§óng vËt nµy råi, ta phª chuÈn cho ng­¬i h¹ s¬n, ta mong r»ng ng­¬i sím cã ngµy ngé ra ®­îc tuyÖt kü vâ häc ®Ó quang ®¹i ng· vâ l©m.", "§Ö tö nhÊt ®Şnh sÏ nghe lêi d¹y cña s­ phô/OnCancel"});
end

-- ´øÒÕÍ¶Ê¦£¬°İÈëÃÅÇ½
function toushiTransEnter(nFactionNumb)
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ng­¬i ®· nhËn nhiÖm vô kü n¨ng 150, xin h·y hoµn thµnh nhiÖm vô råi h·y ®Õn gÆp ta")
		return 
	end
	local bFlag				= toushiCheckTransFactState(nFactionNumb, 1);
	local nSex				= GetSex();
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		local szDes = "<dec><npc>VŞ <sex> nµy, ng­¬i ®· t×m ®­îc ®­êng ®Õn chç cña ta ®©y, ta buéc ng­¬i ph¶i quªn ®i nh÷ng tuyÖt häc mµ ng­¬i ®· l·nh ngé ®­îc tõ s­ phô cña ng­¬i. {{ ng­¬i ph¶i biÕt r»ng ®· lµ gia nhËp bæn m«n, th× nh÷ng vâ c«ng ®· häc tr­íc ®©y kh«ng thÓ sö dông, ®­¬ng nhiªn ta sÏ truyÒn thô vâ c«ng cña bæn ph¸i cho ng­¬i, ®­a ng­¬i gia nhËp bæn ph¸i, ta tin t­ëng r»ng sÏ kh«ng tæn thÊt thÕ lùc.}} ng­¬i ®· nghÜ kü ch­a ®ã, qu¶ thùc lµ ng­¬i muèn gia nhËp bæn ph¸i hay kh«ng?";
		
		if (nFactionNumb == 1 and nSex == 1) then
			szDes = "<dec><npc>VŞ <sex> nµy, ng­¬i ®· t×m ®­îc ®­êng ®Õn chç cña ta ®©y, ta buéc ng­¬i ph¶i quªn ®i nh÷ng tuyÖt häc mµ ng­¬i ®· l·nh ngé ®­îc tõ s­ phô cña ng­¬i. Cã ®iÒu bæn ph¸i ta vèn dÜ kh«ng thu nhËn n÷ ®Ö tö, lµ v× sî r»ng n÷ ®Ö tö sÏ kh«ng lÜnh ngé ®­îc c«ng ph¸p thuÇn d­¬ng cña bæn ph¸i. M·i cho ®Õn nöa n¨m tr­íc ®©y bæn bang chñ v« t×nh ®¹t ®­îc mét ThiÕp Cæ Ph­¬ng, míi t×m ®­îc c«ng ph¸p chÕ gi¶i. ChØ lµ bİ d­îc ë trong ph­¬ng thuèc nµy còng kh«ng lÊy g× æn ®Şnh cho l¾m, cÇn ph¶i cã bæn bang chñ truyÒn c«ng ®· th«ng kinh m¹ch. NÕu nh­ ng­¬i cã thÓ t×m ®­îc {{ Tİn vËt cña bæn bang chñ }}, míi cã thÓ gia nhËp bæn bang. Ngoµi ra {{ ng­¬i còng ph¶i biÕt r»ng ®· lµ gia nhËp bæn m«n, th× nh÷ng vâ c«ng ®· häc tr­íc ®©y kh«ng thÓ sö dông, ®­¬ng nhiªn ta sÏ truyÒn thô vâ c«ng cña bæn ph¸i cho ng­¬i, ®­a ng­¬i gia nhËp bæn ph¸i, ta tin t­ëng r»ng sÏ kh«ng tæn thÊt thÕ lùc.}} ng­¬i ®· nghÜ kü ch­a ®ã, qu¶ thùc lµ ng­¬i muèn gia nhËp bæn ph¸i hay kh«ng?";
		end
		
		CreateTaskSay({szDes, 
				format("%s, ta ®· nghÜ kü råi, muèn gia nhËp m«n ph¸i cña bæn bang./#toushiTransSureTodo(%d)", szHierarchTitle, nFactionNumb),
				format("%s, ®Ó ta suy nghÜ thªm/OnCancel", szHierarchTitle),
			});
		
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], " KÕt thóc ®èi tho¹i!/OnCancel"});
	end
end

-- ÌáÊ¾×ªÖ°³É¹¦ºó,ĞèÒªÉèÖÃ90¼¶¼¼ÄÜÊìÁ·¶È
function toushiTransSureTodo(nFactionNumb)
	local tbDescrib		= {"<dec><npc>Ng­¬i ph¶i chän hÖ tÊn c«ng chñ ®¹o"};

	for k, v in TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID[90] do
		if (type(v) == "table") then
			tbDescrib[getn(tbDescrib) + 1]	= format("%s/#toushiTransSure(%d, %d)", v[3], nFactionNumb, k);
		end
	end
	
	tbDescrib[getn(tbDescrib) + 1]	= "Ta cÇn ph¶i suy nghÜ thªm/OnCancel";
	
	CreateTaskSay(tbDescrib);
end


-- È·ÈÏ°İÈëÃÅÇ½£¬ÅĞ¶Ï½ÇÉ«×´Ì¬£¬´¦Àí½ÇÉ«ÊôĞÔ
function toushiTransSure(nFactionNumb, nMagicIdx)
	local bFlag	= toushiCheckTransFactState(nFactionNumb, 2);
	local nSex	= GetSex();
	local szLog	= "";
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		if (nFactionNumb == 1 and nSex == 1) then
			--local ndnumzimu		= CalcItemCount(23, unpack(TB_TOUSHI_YANGYINGXINWU), -1);	-- ¼ì²é×ÓÄ¸´ü
			local ndnumbeibao	= CalcItemCount(3, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);	-- ¼ì²é±³°ü
			
			if (ndnumbeibao >= 1) then
				ConsumeItem(3, 1, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);
			--elseif (ndnumzimu >= 1) then
			--	ConsumeItem(23, 1, unpack(TB_TOUSHI_YANGYINGXINWU), -1);
			
			else
				CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TWFEMALEERR], " KÕt thóc ®èi tho¹i!/OnCancel"});
				return TOUSHI_TWFEMALEERR;
			end
			
			szLog = "Giao tİn vËt cña D­¬ng Anh thµnh c«ng";
		elseif nFactionNumb == 10 then
			ConsumeEquiproomItem(1, 6, 1, 4328, 1)
			Msg2Player("Ng­¬i ®· nép 1 cuèn Hoa S¬n Kú Th­.")
		end
		
		local bTrans = toushiDoTransPlayer(GetLastFactionNumber(), nFactionNumb, nMagicIdx, szLog);			-- ´¦Àí½ÇÉ«Ïà¹ØÊôĞÔ
		
		-- ÉèÖÃÀäÈ´Ê±¼ä
		local nCurTime = tonumber( GetCurServerTime() );
		SetTask(TSK_LAST_CHANGE_FACTION, nCurTime);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], " KÕt thóc ®èi tho¹i!/OnCancel"});
	end
end


-- ×ª»»½ÇÉ«¼ÓÈë¶ÔÓ¦ÃÅÅÉ
-- ÉèÖÃ½ÇÉ«ÎåĞĞ£¬ÃÅÅÉ£¬³ÆºÅ£¬ÕóÓª£¬ÃÅÅÉÈÎÎñ±äÁ¿
function toushiDoTransPlayer(nMyFacNumb, nFactionNumb, nMagicIdx, szLog)
	LeaveTeam();															-- ÏÈ×öÀë¶Ó²Ù×÷
	
	local nLevel		= GetLevel();
	local tbOldSkill	= TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].tbSkillID;
	local tbNewSkill	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID;
	local tb90SkillExp		= {};
	local tb120SkillExp	= {};
	local tb150SkillExp	= {};
	
	zhuansheng_clear_skill(0, 0)											-- µ÷ÓÃ×ªÉú Ï´¼¼ÄÜµãº¯Êı
	
	for i = 1, getn(tbOldSkill[90]) do										-- ±£ÁôÔ­¼¼ÄÜÊìÁ·¶È
		if (type(tbOldSkill[90][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[90][i][1]);

--			if (nMagicLvl == 0) then
--				nMagicLvl = 1;
--			end

			if (tb90SkillExp.nShuliandu == nil) then
				tb90SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb90SkillExp.nShuliandu[getn(tb90SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[90][i]) >= 0) then
				tb90SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb90SkillExp.nShuliandu, toushiSortSkillsExp);									-- ¶ÔÊìÁ·¶ÈµÈ¼¶¾­Ñé×öÅÅĞò£¬¸øÖ÷¹¥Â·Ïß¼Ó×î¸ßÊìÁ·¶È
	
	if (HaveMagic(tbOldSkill[120][1][1]) > 0) then							-- ±£Áô120¼¶¼¼ÄÜÊìÁ·¶È
		local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[120][1][1]);
		
--		if (nMagicLvl == 0) then
--			nMagicLvl = 1;
--		end
		tb120SkillExp = {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
	end
	
	for i = 1, getn(tbOldSkill[150]) do
		if (type(tbOldSkill[150][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[150][i][1]);
			
			if (tb150SkillExp.nShuliandu == nil) then
				tb150SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb150SkillExp.nShuliandu[getn(tb150SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[150][i]) >= 0) then
				tb150SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb150SkillExp.nShuliandu, toushiSortSkillsExp);									-- ¶ÔÊìÁ·¶ÈµÈ¼¶¾­Ñé×öÅÅĞò£¬¸øÖ÷¹¥Â·Ïß¼Ó×î¸ßÊìÁ·¶È
--	for i=1,getn(tb150SkillExp.nShuliandu) do
--		print(tb150SkillExp.nShuliandu[i].nMagicLvl, tb150SkillExp.nShuliandu[i].nMagicExpPre)
--	end
	
	
	local tb150SkillInfo = {} --¾ÉÃÅÅÉÒÑ¾­½âËøµÄ150¼¶¼¼ÄÜµÄÊıÁ¿
	for nSkillLvl, tbLvlSkill in tbOldSkill do							-- É¾³ı¾ÉÃÅÅÉ¼¼ÄÜ
		for i = 1, getn(tbLvlSkill) do
			local nDelSkill = 0
			if (type(tbLvlSkill[i]) == "table") then
				nDelSkill = tbLvlSkill[i][1]
			else
				nDelSkill = tbLvlSkill[i]
			end
			if HaveMagic(nDelSkill) > 0 and nSkillLvl == 150 then
				local nSkillId = nDelSkill
				local nSkillLevel = GetCurrentMagicLevel(nSkillId)
				local bIsUnlockNextLevel = tbLvUp150Limit:IsAvailable(nSkillLevel+1, nSkillId)
				tb150SkillInfo[nSkillId] = {nSkillLevel=nSkillLevel, bIsUnlockNextLevel=bIsUnlockNextLevel,bAdded = 0}
				if bIsUnlockNextLevel == 1 then
					tbLvUp150Limit:SetAvoid(nSkillLevel+1, nSkillId)
				end
			end
			DelMagic(nDelSkill)
		end
	end
	--for nSkillLvl, tbLvlSkill in tbNewSkill do							-- Ñ§Ï°ĞÂÃÅÅÉ¼¼ÄÜ
	for nSkillLvl = 10, 150, 10  do							-- Ñ§Ï°ĞÂÃÅÅÉ¼¼ÄÜ
		local tbLvlSkill = tbNewSkill[nSkillLvl];
		if (tbLvlSkill) then
			if (nSkillLvl == 150) then
				toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb150SkillExp, tbLvlSkill, nMagicIdx, tb150SkillInfo);	
			
			elseif (nSkillLvl == 120) then										-- Èç¹ûÊÇ120¼¶¼¼ÄÜ,Ö±½ÓÉèÖÃÎª¾É120¼¶¼¼ÄÜµÈ¼¶ºÍÊìÁ·¶È
				
				toushiAdd120Skill(tb120SkillExp, tbLvlSkill[1][1]);			
				
			elseif (nSkillLvl == 90) then									-- Èç¹ûÊÇ90¼¶¼¼ÄÜ
				
				toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb90SkillExp, tbLvlSkill, nMagicIdx);			-- 
				
			else															-- Èç¹ûÊÇ¼Óµã¼¼ÄÜ
				for i = 1, getn(tbLvlSkill) do 
					AddMagic(tbLvlSkill[i]);
				end
			end
		end
	end
	
	local nOldSeries	= GetSeries();
	local nNewSeries	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nSeries;
	
	toushiAddWuXingSkill(nOldSeries, nNewSeries);		-- Èç¹ûÓĞÎåĞĞ¼¼ÄÜ£¬ÄÇÃ´¸ü»»ÎªĞÂÎåĞĞ
	
	zhuansheng_clear_prop(0, 0, nNewSeries)			-- µ÷ÓÃ×ªÉú Ï´Ç±ÄÜµãº¯Êı,ÒÔĞÂÎåĞĞÏ´µã,¸÷ÎåĞĞ»ù´¡Ç±ÄÜµã²»Ò»Ñù
	
	SetSeries(nNewSeries);							-- ×ª»»½ÇÉ«ÎåĞĞÊôĞÔ
	
	toushiResetMaxLife(nNewSeries, nLevel);			-- ½ÇÉ«¶ÔÓ¦ÎåĞĞµÈ¼¶ µÄ»ù´¡ÑªÁ¿
	toushiResetMaxMana(nNewSeries, nLevel);			-- ½ÇÉ«¶ÔÓ¦ÎåĞĞµÈ¼¶ µÄ»ù´¡ÄÚÁ¦
	SetTask(TSK_TOUSHI_RESETBASE, 1);										-- 
	
	SetLastFactionNumber(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nFacNumb);					-- ½ÇÉ«ÃÅÅÉID
	UpdateMeridianSkill()	--±ğÍüÁË¾­Âö¼¼ÄÜÒ²Òª×ªÓ´
	
	SetTask(TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].nTaskId_Fact, 0);				-- Çå½ÇÉ«Ô­ÃÅÅÉÈÎÎñ±äÁ¿
	
	if (GetFaction() ~= "Míi nhËp giang hå ") then
		SetFaction(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szFacName);			-- ½ÇÉ«ÃÅÅÉÃû³Æ
		
		SetCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);					-- ¶ÔÓ¦ÃÅÅÉÕóÓª
		SetCurCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);				-- ¶ÔÓ¦ÃÅÅÉÕóÓª
		
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_HUISHI);	-- ÃÅÅÉÈÎÎñ±äÁ¿,»ØÊ¦
	else
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_CHUSHI);	-- ÃÅÅÉÈÎÎñ±äÁ¿,³öÊ¦
	end
	
	SetRank(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nRankId);					-- ½ÇÉ«Í·ÏÎ
	
	SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_137, 
					TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nValue_137);			-- ÃÅÅÉÈÎÎñ±äÁ¿,³öÊ¦
	
	SetTask(144, 0);	--Ãâ·ÑÏ´µã
	SetTask(TSK_TOUSHI_FLAG, 0);												-- Çå´øÒÕÍ¶Ê¦³É¹¦±ê¼Ç
	SetTask(TSK_TOUSHI_COUNT, GetTask(TSK_TOUSHI_COUNT) + 1);					-- ÉèÖÃ´øÒÕÍ¶Ê¦³É¹¦´ÎÊı
	
	if (GetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3) ~= 1) then
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGDAN)), -2);			-- ÔùËÍµÄÎïÆ·ÎªÓÀ¾Ã°ó¶¨
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGYAO)), -2);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3, 1))
		szLog = szLog..", thu ®­îc trÊn ph¸i linh ®¬n vµ trÊn ph¸i linh d­îc";
	end
	
	--´¦Àí7×ªµÄ¼¼ÄÜ×ª»»
	local nSrcSeries = TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].nSeries
	local nDestSeries = TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nSeries
	local nCurnTransLifeTime = ST_GetTransLifeCount()
	if nCurnTransLifeTime == 7 then
		ProcessTransLife7Skill(nSrcSeries, nDestSeries)
	end
	
	CreateTaskSay({"<dec><npc>NÕu nh­ ng­¬i ®· muèn gia nhËp bæn ph¶i, sau nµy ph¶i chuyªn t©m mµ khæ luyÖn, sím cã ngµy ngé ra ®­îc tuyÖt kü vâ häc. §©y lµ hai viªn linh d­îc cña bæn ph¸i, cã thÓ gióp ng­¬i n©ng cao c«ng lùc, h·y nhËn lÊy mµ sö dông.",
					" KÕt thóc ®èi tho¹i!/OnCancel"});
	
	Msg2Faction(format(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szMsg, GetName()));
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,OldFactionId:%d,NewFactionId:%d,MainMagic:%d,%s",
				"§¸i nghÖ ®Çu s­",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), nMyFacNumb, nFactionNumb,nMagicIdx,
				"Xö lı chuyÓn m«n ph¸i thµnh c«ng"..szLog));
	KickOutSelf();
end


function toushiSetTask(nTaskId, isHigh, nValue)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nTaskValue			= nTaskValue_H * 2^16 + nTaskValue_L;
	
	SetTask(nTaskId, nTaskValue);
	
	return nTaskValue;
end


function toushiAddTask(nTaskId, isHigh, nAdd)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	local nValue		= 0;
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nValue			= nValue + nAdd;
	
	toushiSetTask(nTaskId, isHigh, nValue)
	
	return nTaskValue;
end


function toushiGetTask(nTaskId, isHigh)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		return nTaskValue_H;
	else
		return nTaskValue_L;
	end
end


function toushiGetMagicProp(nMagicId)
	local nMagicLvl		= HaveMagic(nMagicId)
	local nMaxLevel = GetSkillMaxLevel(nMagicId)
	
	if (nMagicLvl == -1) then
		return 0, 0, 0;
	end
	
	if (nMagicLvl <= 0) then
		nMagicLvl = 1;
	end
	
	if (nMagicLvl > nMaxLevel) then
		nMagicLvl = nMaxLevel
	end
	
	local nMagicExp		= GetSkillExp(nMagicId);
	local nMagicExpPre	= floor((nMagicExp * 10000) / TB_TOUSHI_SKILLEXP[nMagicId][nMagicLvl]);
	
	return nMagicLvl, nMagicExp, nMagicExpPre;
end


-- ½«Ô­Ö°Òµ¸÷¼¼ÄÜÊìÁ·¶ÈÅÅĞò
function toushiSortSkillsExp(tb1, tb2)
	if (tb1.nMagicLvl ~= tb2.nMagicLvl) then
		return tb1.nMagicLvl > tb2.nMagicLvl;
	else
		return tb1.nMagicExpPre > tb2.nMagicExpPre;
	end

end


-- Ìí¼Ó150¼¶¼¼ÄÜ´¦Àí
--  150¼¶¼¼ÄÜÈÎÎñÖ»·ÖÍê³ÉºÍÎ´½øĞĞ£¬soÎ´½øĞĞ²»¸ø£¬Íê³ÉÈ«¸ø
function toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx, tb150SkillInfo)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10] = 9,
	}
	local tbAddSkill	= {};
	if (mod(floor(GetTask(TSK_LV150_SKILL) / 100), 100) >= TOUSHI_150SKILL_TASKSTATE) then
	-- Èç¹û150¼¶¼¼ÄÜÈÎÎñ±äÁ¿ÎªÍê³ÉµÄ´¦Àí
		--¸Ä±ä150ÈÎÎñÍê³ÉµÄÈÎÎñ±äÁ¿£¬ÃÅÅÉÖ§ÏßµÄĞŞ¸Ä
		SetTask(TSK_LV150_SKILL, TOUSHI_150SKILL_TASKSTATE*100+tbFactStepList[nFactionNumb])
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- ÏÈ½«Ö÷¹¥Â·Ïß¼¼ÄÜ¼Ó¼ÇÂ¼
		else
			tbAddSkill[1] = {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- Èç¹ûÊÇÊìÁ·¶È¼¼ÄÜ
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- °´Ë³Ğò¸øÓëÊìÁ·¶È
																								-- Èç¹û¾ÉÃÅÅÉ¼¼ÄÜÊìÁ·¶È²»¹»°²ÅÅ
					if (nCount > nAddCnt) then													-- Ôò¸øÓë¼¼ÄÜÎªÒ»¼¶£¬ÊìÁ·¶ÈÎª0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						print(tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre)
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
						print(tbNewSkill[k][1], 1, 0)
					end
				end
			else																				-- Èç¹ûÊÇ¼Óµã¼¼ÄÜ£¬Ôò¼ÇÂ¼Òª¼Ó
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- ÔÚ¸øÓëµÄÊ±ºòÖ±½Ó¸ø0¼¶
			end
		end
	else
		return
	end
	for k = 1, getn(tbAddSkill) do
		local nSkillId = 0
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2])
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1)
			nSkillId = tbAddSkill[k][1]
		else
			AddMagic(tbAddSkill[k])
			nSkillId = tbAddSkill[k]
		end
	end
	local nAvaliable150SkillCount = calc150SkillLimitAvaliableCount(tb150SkillInfo)
	local nMainChooseSkillId = tbNewSkill[nMagicIdx][1]
	if HaveMagic(nMainChooseSkillId) > 0 then
		if set150SkillLimit(nMainChooseSkillId, tb150SkillInfo) == 1 then
			nAvaliable150SkillCount = nAvaliable150SkillCount - 1
		end
	end
	
	for k = 1, getn(tbNewSkill) do
		local nSkillId 
		if type(tbNewSkill[k]) == "table" then
			nSkillId = tbNewSkill[k][1]
		else
			nSkillId = tbNewSkill[k]
		end
		if nAvaliable150SkillCount > 0 and nSkillId ~= nMainChooseSkillId then
			if set150SkillLimit(nSkillId, tb150SkillInfo) == 1 then
				nAvaliable150SkillCount = nAvaliable150SkillCount - 1
			end
		end
	end
end

function calc150SkillLimitAvaliableCount(tb150SkillInfo)
	local nCount = 0
	for nSkillId, tbSkillInfo in tb150SkillInfo do 
		if tbSkillInfo and tbSkillInfo.bIsUnlockNextLevel == 1 then
			nCount = nCount + 1
		end
	end
	return nCount
end

function set150SkillLimit(nSkillId, tb150SkillInfo)
	local nSkillLevel = GetCurrentMagicLevel(nSkillId, 0)
	for _, tbSkillInfo in tb150SkillInfo do
		if tbSkillInfo then
			if tbSkillInfo.bIsUnlockNextLevel == 1 and tbSkillInfo.nSkillLevel == nSkillLevel then
				if tbSkillInfo.bAdded ~= 1 then
					tbLvUp150Limit:SetAvailable(nSkillLevel+1, nSkillId)
					tbSkillInfo.bAdded = 1
					return 1
				end
			end
		end
	end
end

-- Ìí¼Ó120¼¶¼¼ÄÜ´¦Àí¡£Èç¹ûÔ­À´ÓĞ120¼¶¼¼ÄÜÔò¸øÓëĞÂÃÅÅÉ120¼¶¼¼ÄÜ
function toushiAdd120Skill(tbOldSkill, nNewSkill)
	if (tbOldSkill.nMagicLvl and tbOldSkill.nMagicLvl > 0) then
		SetTask(LV120_SKILL_ID, nNewSkill);
		AddMagic(nNewSkill, tbOldSkill.nMagicLvl);
		AddSkillExp(nNewSkill, tbOldSkill.nMagicExpPre, 1, 1);
	end
end

-- Ìí¼Ó90¼¶¼¼ÄÜ´¦Àí
-- 	Èç¹û90¼¶¼¼ÄÜÈÎÎñÍê³É£¬Ôò¸øÓëËùÓĞĞÂÃÅÅÉ90¼¶¼¼ÄÜ
-- 	Èç¹û90¼¶¼¼ÄÜÈÎÎñÎ´Íê³É£¬Ôò°´¾ÉÃÅÅÉ90¼¶¼¼ÄÜÊıÁ¿¸øÓëĞÂÃÅÅÉ¼¼ÄÜ
function toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	local tbAddSkill	= {};
	
	
	if (GetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill) == TOUSHI_90SKILL_TASK) then
	-- Èç¹û90¼¶¼¼ÄÜÈÎÎñ±äÁ¿ÎªÍê³ÉµÄ´¦Àí
		SetTask(TB_DAIYITOUSHI_FACTS[nNewNumb].nTaskId_90Skill, TOUSHI_90SKILL_TASK);	-- ĞÂÃÅÅÉ¼¼ÄÜÈÎÎñÉèÖÃÎªÍê³É
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- ÏÈ½«Ö÷¹¥Â·Ïß¼¼ÄÜ¼Ó¼ÇÂ¼
		else
			tbAddSkill[1] = {tbNewSkill[90][nMagicIdx], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- Èç¹ûÊÇÊìÁ·¶È¼¼ÄÜ
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- °´Ë³Ğò¸øÓëÊìÁ·¶È
																								-- Èç¹û¾ÉÃÅÅÉ¼¼ÄÜÊìÁ·¶È²»¹»°²ÅÅ
					if (nCount > nAddCnt) then													-- Ôò¸øÓë¼¼ÄÜÎªÒ»¼¶£¬ÊìÁ·¶ÈÎª0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
					end
				end
			else																				-- Èç¹ûÊÇ¼Óµã¼¼ÄÜ£¬Ôò¼ÇÂ¼Òª¼Ó
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- ÔÚ¸øÓëµÄÊ±ºòÖ±½Ó¸ø0¼¶
			end
		end
	else
		local tbOtherMagic	= {tbShuliandu = {}, tbJinengdian = {}};
		local nCount		= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt		= 0;
		local nAddJinengCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt = nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[1].nMagicLvl, tbOldSkillExp.nShuliandu[1].nMagicExpPre};					-- ÏÈ½«Ö÷¹¥Â·Ïß¼¼ÄÜ¼Ó¼ÇÂ¼
		else
			tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then
					if (nCount > nAddCnt) then
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						
					else
						
						tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[k][1], 1, 0};
					end
				end
				
			else
				
				if (tbOldSkillExp.nJinengdian) then
					tbAddSkill[getn(tbAddSkill) + 1]	= tbNewSkill[k];
					nAddJinengCnt						= nAddJinengCnt + 1;
					
				else
					
					tbOtherMagic.tbJinengdian[getn(tbOtherMagic.tbJinengdian) + 1]	= tbNewSkill[k];
				end
			end
		end
		
		if (getn(tbOtherMagic.tbJinengdian) > 0) then
			for j = 1, getn(tbOtherMagic.tbJinengdian) do
				
				if (nCount - nAddCnt <= 0) then
					break
				end

				nAddCnt								= nAddCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbJinengdian[j];
				
			end
		end
		
		if (getn(tbOtherMagic.tbShuliandu) > 0) then
			for j = 1, getn(tbOtherMagic.tbShuliandu) do
				if (not tbOldSkillExp.nJinengdian or tbOldSkillExp.nJinengdian - nAddJinengCnt <= 0) then
					break
				end
				nAddJinengCnt						= nAddJinengCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbShuliandu[j];
				
			end
		end
		
	end
	
	SetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill, 0);	-- È¡ÏûÔ­Ö°Òµ90¼¶¼¼ÄÜÈÎÎñ
	
	for k = 1, getn(tbAddSkill) do
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2]);
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1);
			
		else
			
			AddMagic(tbAddSkill[k]);
		end
	end
end

-- Èç¹û½ÇÉ«ÎåĞĞ¸ü»»£¬ÄÇÃ´ÎåĞĞ¼¼ÄÜÒ²¸ü»»
function toushiAddWuXingSkill(nOldSeries, nNewSeries)
	if (nOldSeries ~= nNewSeries) then
		local nMagicLvl1	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
		local nMagicLvl2	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
		if (nMagicLvl1 ~= -1) then
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId1);
		elseif (nMagicLvl2 >= 1) then
			local nMagicExp2	= GetSkillExp(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicLvl2);
			AddSkillExp(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicExp2, 1);
		end
	end
end


function UpdateMeridianSkill()
	for i = 1, getn(%tbFactionToSkillId) do
		if HaveMagic(tbFactionToSkillId[i]) >= 0 then
			DelMagic(tbFactionToSkillId[i])
		end
	end
	
	%SetUpSkillIDAndLevel()
end

--AddDate:2014-12-17 ´¦Àí7×ªµÄÌØÊâ¼¼ÄÜ
function ProcessTransLife7Skill(nSrcSeries, nDestSeries)
	local _, nSrcActiveSkillID = unpack(TB_TL7_SKILL_ADD_ACTIVE[nSrcSeries])
	local _, nSrcPassiveSkillID = unpack(TB_TL7_SKILL_ADD_PASSIVE[nSrcSeries])
	
	local _, nDestActiveSkillID, nDestActiveLevel = unpack(TB_TL7_SKILL_ADD_ACTIVE[nDestSeries])
	local _, nDestPassiveSkillID, nDestPassiveLevel = unpack(TB_TL7_SKILL_ADD_PASSIVE[nDestSeries])
	
	if nSrcActiveSkillID then
		DelMagic(nSrcActiveSkillID)		
	end
	
	if nSrcPassiveSkillID then
		DelMagic(nSrcPassiveSkillID)
	end
	
	if nDestActiveSkillID then
		AddMagic(nDestActiveSkillID, nDestActiveLevel)
	end
	
	if nDestPassiveSkillID then
		AddMagic(nDestPassiveSkillID, nDestPassiveLevel)
	end
	
	local nCurLevel = GetLevel()
	TransLife7:OnLevelUpProcess(nCurLevel)
end
