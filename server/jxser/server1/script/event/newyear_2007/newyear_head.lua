-- ½£ÏÀÇéÔµonline 2007 Ôªµ©»î¶¯Í·ÎÄ¼ş

if (not __H_NEWYEAR_2007__) then
	__H_NEWYEAR_2007__ = 1;
Include([[\script\lib\pay.lua]]);

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- ¶ÁÈë 2006 Ôªµ©»î¶¯Í·ÎÄ¼ş
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- Ëæ»úÈÎÎñµÄ´¦ÀíÖ§³Ö
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êı
--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- Éı¼¶ËùĞèµÄ¾­Ñé±í

ID_GETTASKBOOK_DATE_NY07  		 = 1789;  -- ÁìÈ¡ÈÎÎñ¾íÖáµÄÈÕÆÚ
ID_MOREEXP_ONLINETIME_NY07        = 1790;  -- ´¢´æÍæ¼ÒÔÚÏßÊ±¼ä
ID_MOREEXP_DATE_NY07              = 1791;  -- ¼ÇÂ¼Íæ¼ÒÉÏ´ÎÁìÈ¡¾­ÑéµÄÈÕÆÚ
ID_MEDAL_DATE_NY07              = 1792;  -- ¼ÇÂ¼Íæ¼ÒÉÏ´ÎÁìÈ¡ÈÙÓşÁîµÄÈÕÆÚ


-- ÅĞ¶ÏÊÇ·ñÔªµ©ÈÕÆÚµÄÖ÷º¯Êı
function ny07_isactive()
	local nDate  = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070101 and nDate <= 20070103) then
		return 1;
	end;
	return 0;
end;

-- ĞÂÄê»î¶¯Èë¿Ú
function ny07_entrance()
	if (IsCharged() == 0) then
		Say("Ö»ÓĞ<color=red>³ä¿¨Íæ¼Ò<color>²ÅÄÜ²Î¼ÓĞÂÄê»î¶¯¡£", 0);
		return
	end;
	Say("µ±½ñÎäÁÖ£¬ÈË½Ü±²³ö£¬¸÷´óÃÅÅÉíÂ¾«Í¼Ç¿¡£µ±´ËÂÒÊÀ£¬¸÷Î»ÈÔÎªÎäÁÖÃË¾¡ĞÄ½ßÁ¦¡£Ç¡·ê¼Ñ½Ú£¬¶À¹ÂÃËÖ÷ÌØÎª¸÷Î»ÏÀÊ¿ÏÀÅ®ËÍÉÏ½ÚÈÕºØÀñ£¬×£ºÏ¼Ò°²¿µ£¬ÍòÊÂÈçÒâ£¡", 4,
	"NhËn phÇn th­ëng ®iÓm kinh nghiÖm mçi ngµy/ny07_getexp",
	"NhËn mËt tŞch nhiÖm vô mçi ngµy/ny07_getTaskBook",
	"ÁìÈ¡Ã¿ÈÕµÄÈÙÓşÁîÅÆ/ny07_getmedal",
	"Rêi khái/no"
	);
end;


ny07_tab_medal = {
{"LÖnh bµi vinh dù Hoµng Kim",	1	,1254	},
{"LÖnh bµi vinh dù B¹ch Ng©n",	10	,1255	},
{"LÖnh bµi vinh dù Thanh ®ång",	30	,1256	},
{"LÖnh bµi vinh dù",	259	,1294	},
{"LÖnh bµi vinh dù Hµn thiÕt",	700	,1257	},
};
function ny07_getmedal()
	if (GetLevel() < 120) then
		Say("<color=yellow>120¼¶<color>ÒÔÉÏµÄÍæ¼Ò²ÅÄÜÁìÈ¡ÎäÁÖÎäÁÖÈÙÓşÁî¡£", 0);
		return
	end;
	
	if (ny07_isactive()==0) then
		Say("Giê ®· hÕt Nguyªn §¸n råi!", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 1) then
		Say("ÄãµÄ±³°ü¿Õ¼ä²»¹»£¬ÇëÇåÀí±³°ü¡£", 0);
		return
	end;
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate == GetTask(ID_MEDAL_DATE_NY07)) then
		Say("Äã½ñÌìÒÑ¾­ÁìÈ¡¹ıÁË£¬²»ÄÜÔÙÁìÈ¡ÁË¡£", 0);
		return
	end;
	
	local nSeed = random(1, 1000);
	local nSum = 0;
	for i = 1, getn(ny07_tab_medal) do
		nSum = nSum + ny07_tab_medal[i][2];
		if (nSeed <= nSum) then
			SetTask(ID_MEDAL_DATE_NY07, nDate);
			local nidx = AddItem(6, 1, ny07_tab_medal[i][3], 1, 0, 0, 0);
			SetSpecItemParam(nidx, 1, 20070131);
			SetSpecItemParam(nidx, 2, 2007);
			SetSpecItemParam(nidx, 3, 1);
			SetSpecItemParam(nidx, 4, 31);
			SyncItem(nidx);
			local str = "B¹n nhËn ®­îc <color=yellow>"..ny07_tab_medal[i][1].."<color>£¬¸ÃÁîÅÆµÄÓĞĞ§Ê±¼ä½ØÖÁ<color=yellow>2007Äê1ÔÂ31ÈÕ<color>¡£"
			Msg2Player(str);
			Say(str, 0);
			break;
		end;
	end;
end;

-- ÅĞ¶ÏÍæ¼ÒÊÇ·ñÄÜ»ñÈ¡ÔùËÍµÄ¾­Ñé
function ny07_canGetMoreExp()
	local nTime       = GetGameTime();
	local nLateTime   = GetTask(ID_MOREEXP_ONLINETIME_NY07);
	local nDate       = tonumber(GetLocalDate("%Y%m%d"));
	local nLateDate   = GetTask(ID_MOREEXP_DATE_NY07);
	
	if (nLateDate == 0) then
		return 1;
	end;

	if ((nTime - nLateTime >= 60*60) and (nDate~=nLateDate)) then
		return 1;
	end;
	return 0;
end;

-- ÓĞµÈ¼¶ÏŞÖÆµÄÔö¼ÓÍæ¼Ò¾­Ñé£¬Èç¹û nLimitLevel Îª 0 Ôò²»ÏŞÖÆ
function ny07_addPlayerExpForLimit(myExpValue, nLimitLevel)
	tl_addPlayerExpForLimit	(myExpValue, nLimitLevel);
end;


-- Ñ¯ÎÊÍæ¼ÒÊÇ·ñÁìÈ¡¾­Ñé
function ny07_getexp()
	Say("Trong kho¶ng thêi gian tõ <color=yellow>20-12-2005 ®Õn 01-01-2006<color>, mçi ngµy lªn m¹ng ®Òu nhËn ®­îc ®iÓm kinh nghiÖm do Vâ l©m minh chñ tÆng.<color=yellow>Trong vßng 3 ngµy nµy cã thÓ nhËn 1 lÇn <color>, nh­ng 2 lÇn nhËn ph¶i c¸ch nhau <color=yellow>trªn mét giê trªn m¹ng<color>. Ng­¬i ®ång ı nhËn kh«ng?",2,
		"§­îc råi! Ta muèn nhËn l·nh!/ny07_getexp_next",
		"Th«i ®Ó l¸t ®i/no"
	);
end;

ny07_aryExp = {
5000000,
10000000, 
15000000, 
};
-- ÁìÈ¡Ã¿ÈÕµÄ¾­Ñé
function ny07_getexp_next()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nIndex = tonumber(mod(nDate, 10));
	if (nIndex > 3 or nIndex < 1) then
		return
	end;
	local nExp = ny07_aryExp[nIndex];
	-- Èç¹ûÈÕÆÚ²»¶Ô£¬Ö±½Ó·µ»Ø
	if ny07_isactive()==0 then
		Say("Giê ®· hÕt Nguyªn §¸n råi!", 0);
		return
	end;
	
	if (ny07_canGetMoreExp()==1) then
		if GetLevel()<50 then
			ny07_addPlayerExpForLimit(nExp, 5); -- ÏŞÖÆÖ»ÄÜÉı 5 ¼¶
		else
			ny07_addPlayerExpForLimit(nExp, 0); -- ²»ÏŞÖÆ
		end;
		Msg2Player("B¹n nhËn ®­îc phÇn th­ëng trong ho¹t ®éng Nguyªn §¸n:<color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm!");
		
		-- ¼ÇÂ¼ÁìÈ¡¾­ÑéµÄÏà¹ØÊı¾İ
		local nTime       = GetGameTime();
		SetTask(ID_MOREEXP_ONLINETIME_NY07, nTime);
		SetTask(ID_MOREEXP_DATE_NY07, nDate);
		WriteTaskLog("nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm mçi ngµy:"..nExp);
	else
		Say("ÄãÏÖÔÚµÄÌõ¼ş²»ÄÜ¹»ÁìÈ¡Ã¿ÈÕµÄ¾­Ñé£¬ÔÚ1ÔÂ1ÈÕÖÁ1ÔÂ3ÈÕÆÚ¼ä£¬Ã¿ÈÕÉÏÏß¶¼»á»ñµÃ¶À¹ÂÃËÖ÷ÔùËÍµÄ´óÅú¾­Ñé¡£<color=yellow>ÕâÈıÌìÖ®ÄÚÃ¿ÌìÄÜÁìÒ»´Î<color>£¬µ«Á½´ÎÁìÈ¡¾­ÑéÖ®¼äÏà¸ôĞèÒª<color=yellow>ÔÚÏß³¬¹ı1Ğ¡Ê±<color>Å¶£¡", 0);
		return
	end;
end;


-- ÈÎÎñÏµÍ³µÄĞ´Èë LOG ¹ı³Ì
function WriteTaskLog(strMain)
	if strMain==nil then return end;	-- Èç¹ûÊÇ¿ÕÖµÔò²»Ğ´Èë
	WriteLog("[2007ÄêÔªµ©»î¶¯]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]").." [mËt m·:"..GetAccount().."] [nh©n vËt:"..GetName().."]"..strMain);
end;

-- µÃµ½ÈÎÎñ¾íÖá
function ny07_getTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	local nDate  = tonumber(GetLocalDate("%Y%m%d"));
	-- Èç¹ûÈÕÆÚ²»¶Ô£¬Ö±½Ó·µ»Ø
	if ny07_isactive()==0 then
		Say("Giê ®· hÕt Nguyªn §¸n råi!", 0);
		return
	end;
	
	-- Èç¹ûµÈ¼¶Î´´ïµ½ 80 ¼¶
	if GetLevel()<80 then
		Say("ChØ cã ng­êi ch¬i tõ cÊp 80 trë lªn míi cã thÓ nhËn ®­îc mËt tŞch nhiÖm vô nµy!", 0);
		return
	end;
	
	if (GetTask(ID_GETTASKBOOK_DATE_NY07) == nDate) then
		Say("H«m nay b¹n ®· nhËn mét mËt tŞch nhiÖm vô råi!", 0);
		return
	end;

	-- ÉèÖÃÈÎÎñ±äÁ¿
	SetTask(ID_GETTASKBOOK_DATE_NY07, nDate);
	
	-- Éú³ÉÒ»¸öÈÎÎñ¾íÖá
	nRandomTaskID = TaskNo(selectNextTask());
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	SyncItem(nRandomItemIndex);		-- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
	Msg2Player("B¹n nhËn ®ù¬c <color=green>nhiÖm vô ngÉu nhiªn!<color>");
	WriteTaskLog("NhËn ®­îc 1 mËt tŞch nhiÖm vô, m· sè lµ:"..nRandomTaskID);
end;


function no()

end;
end;	--	__H_NEWYEAR_2007__