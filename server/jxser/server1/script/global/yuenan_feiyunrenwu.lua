--Ô½ÄÏ·ÉÔÆÈÎÎñ:»î¶¯¿ªÊ¼ºóĞÂÈËÎï´ïµ½¹æ¶¨µÄµÈ¼¶£¨60¼¶£¬90¼¶£¬100¼¶£©£¬Ôò¿Éµ½NPC´¦ÁìÈ¡ÏàÓ¦µÄ½±Àø
--			a.	Íæ¼Ò´ïµ½60¼¶ºó£¬¿ÉÒÔµ½ÁÙ°²Ìú½³´¦(×ø±ê166/191) ¶Ô»°²¢ÁìÈ¡½±Àø£¬½±ÀøÎª¾ßÓĞÁ½¸ö
--				Òş²ØÊôĞÔ£¨ÊôĞÔËæ»ú£©µÄÀ¶É«×°±¸Ò»¸ö(½äÖ¸»ò»¤Éí·û/ÏîÁ´»òÓñÅå/Óñïí)£»
--			b.	Íæ¼Ò´ïµ½90¼¶ºó£¬¿ÉÒÔµ½ÏåÑôÌú½³´¦(×ø±ê195/205) ¶Ô»°²¢ÁìÈ¡½±Àø,½±ÀøÎª¾ßÓĞÈı¸öÒş²Ø
--				ÊôĞÔ£¨ÊôĞÔËæ»ú£©µÄÀ¶É«ÎäÆ÷Ò»¸ö(ÎäÆ÷ÖÖÀàÊÓÍæ¼ÒÃÅÅÉ¶ø¶¨)£»
--			c.	Íæ¼Ò´ïµ½100¼¶ºó£¬¿ÉÒÔµ½ÏåÑôÁõÔÌ¹Å´¦(×ø±ê201/199) ¶Ô»°²¢ÁìÈ¡½±Àø£¬½±ÀøÎª·ÉÔÆÉñÂíÒ»Æ¥¡£


--Date:		November fifteenth 2006
--Author:	liaozhishan
--Right:	Kingsoft all rights reserved@
--file:		yuenan_feiyunrenwu.lua

if (not __H_V_FEIYUNACTION__) then	--__H_V_FEIYUNACTION__
	__H_V_FEIYUNACTION__ = 1;

Include([[\script\lib\gb_taskfuncs.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl60.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl90.lua]]);

--	Date define field: following lines lies date defination;
V_FY_SZ_ACTIONNAME = "v_feiyun06_permanent";	-- Ô½ÄÏÓÀ¾ÃĞÔ»î¶¯
V_FY_TK_GETSIGN = 1781;

tab_Reference = {
	[60] = {60, 150, 160},
	[90] = {90, 150, 190},
	[100] = {100, 160, 190},
};

--	common interface following
function v_fy_is_active()	-- Active check up
	do return 0 end		-- »î¶¯ÒÑ½áÊø£¬ÓÀ¾Ã¹Ø±Õ by ×Ó·Çô~
	if (gb_GetTask(V_FY_SZ_ACTIONNAME, 1) ~= 0) then
		return 0;
	end;
	return 1;
end;

function v_fy_is_newrole()	--make sure Role is of new type 
	local nPoint = GetExtPoint(6);
	local nBit = GetBit(nPoint, 7);
	if (nBit == 1) then
		return 1;
	end;
	return 0;
end;

--	check if he has gotten the level prize;
--	return value: has gotten return 1; in opposition return 0
function v_fy_is_got(nLevel)
	if (not tab_Reference[nLevel]) then
		return 0;
	end;
	
	local UWorld1781 = GetTask(V_FY_TK_GETSIGN);
	if (UWorld1781 >= 250) then
		return 0
	end;
	local table = tab_Reference[nLevel];
	for i = 1, getn(table) do
		if (UWorld1781 == table[i]) then
			return 0;
		end;
	end;
	return 1;
end;

--	check get prize
--	return value: yes return 1; no return 0;
function v_fy_awardcheck(nLevel)
	if (GetLevel() < nLevel) then
		Say("B¹n ch­a ®¹t ®¼ng cÊp yªu cÇu!", 0);
		return 0;
	end;
	
	if (v_fy_is_got(nLevel) == 0) then
		Say("B¹n ®· nhËn phÇn th­ëng, kh«ng thÓ nhËn thªm n÷a!", 0);
		return 0;
	end;
	
	if (v_fy_is_newrole() == 0) then
		Say("B¹n kh«ng ph¶i ch¬i tõ tµi kho¶n míi, kh«ng thÓ nhËn th­ëng.", 0);
		return 0;
	end;
	return 1;
end;

--	add a number into task
function v_fy_tkvalueadd(nTaskID, nAddend)
	SetTask(nTaskID, ( GetTask(nTaskID) + nAddend ) );
	SyncTaskValue( nTaskID );
end;

--	common interface above

--	field level 60:	Prize when a role level up at 60:
function v_fy_60_entrance()
	Say("Kim binh thÕ m¹nh nh­ th¸c lò, T­¬ng D­¬ng s¾p thÊt thñ!, Hoµng Th­îng ®· tô häp anh hïng nghÜa sü kh¾p n¬i bµn b¹c tİnh kÕ, ®ång thêi ban tÆng 1 mãn trang bŞ tri ©n c¸c anh hïng hµo kiÖt ®¹t ®Õn cÊp 60.", 2, 
	"NhËn phÇn th­ëng cÊp 60/v_fy_60_next",
	"Nh©n tiÖn ghĞ xem th«i!/no");
end;

function v_fy_60_next()
	local tab_Content = {
		"Ta muèn nhËn Giíi chØ/v_fy_60_ring",
		"Ta muèn nhËn ngäc béi (h­¬ng nang)/v_fy_60_yu",
		" Hé th©n phï (H¹ng liªn)/v_fy_60_necklace",
		"Rêi khái/no"
	};
	Say("Ng­¬i muèn nhËn phÇn th­ëng g×?", getn(tab_Content), tab_Content);
end;

function v_fy_60_ring()	--ÁìÈ¡60¼¶µÄ½äÖ¸
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_vn_fy_ring[nSeries]));
	local Index2 = random(1, getn(tab_vn_fy_ring[nSeries][Index1]));
	local str = "B¹n nhËn ®­îc 1 <color=yellow>Tæ MÉu Lôc Giíi ChØ<color>";
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	AddItemEx(4,tab_vn_fy_ring[nSeries][Index1][Index2],0, 0,3,0, 6,0,200, 6,6,6,6,0,0)
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_necklace()	--ÁìÈ¡60¼¶µÄ»¤Éí·û(ÏîÁ´)
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local tab_award = tab_vn_fy_hushenhu;
	if (nSex == 1) then	-- Èç¹ûÊÇ¸öÅ®½ÇÉ«
		tab_award = tab_vn_fy_xianglian;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "Hæ Ph¸ch Hé Th©n phï ";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,1, 6,0,200, 6,6,6,6,0,0);
	elseif (nSex == 1) then	-- Èç¹ûÊÇ¸öÅ®½ÇÉ«
		szItemName = "Lôc Tïng Th¹ch H¹ng Liªn";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,0, 6,0,200, 6,6,6,6,0,0);
	end;
	local str = "B¹n nhËn ®­îc <color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_yu()	--ÁìÈ¡60¼¶µÄÏîÁ´
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	
	local tab_award = tab_vn_fy_yupei;
	if (nSex == 1) then	-- Èç¹ûÊÇ¸öÄĞ½ÇÉ«
		tab_award = tab_vn_fy_xiangrang;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "Thanh Ngäc Ngäc Béi ";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,1, 6,2,200, 6,6,6,6,0,0)
	elseif (nSex == 1) then	-- Èç¹ûÊÇ¸öÄĞ½ÇÉ«
		szItemName = "Tö T« H­¬ng Nang";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,0, 6,0,200, 6,6,6,6,0,0)
	end;
	local str = "B¹n nhËn ®­îc <color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 90:
function v_fy_90_entrance()
	Say("Kim binh thÕ m¹nh nh­ th¸c lò, T­¬ng D­¬ng s¾p thÊt thñ! Hoµng Th­îng kªu gäi c¸c anh hïng nghÜa sü hiÖp søc cøu quèc, ®ång thêi ban tÆng 1 mãn lÔ vËt cho c¸c anh hïng hµo kiÖt ®¹t ®Õn cÊp 90.", 2, 
	"NhËn phÇn th­ëng cÊp 90/v_fy_90_next",
	"Nh©n tiÖn ghĞ xem th«i!/no");
end;

v_fy_90_tab_weapon = {
	["cuiyan"] = {"§¹i Phong §ao", "Th«n NhËt Tr·m"},
	["emei"] = {"HuyÒn ThiÕt KiÕm (Nga Mi kiÕm)", "HuyÒn ThiÕt KiÕm (Nga Mi khİ)"},
	["tangmen"] = 	 {"B¸ V­¬ngTiªu", "To¸i NguyÖt §ao", "Khæng T­íc Linh"},
	["wudu"] = {"§¹i Phong §ao (Ngò §éc ch­ëng)", "§¹i Phong §ao (Ngò §éc ®ao)"},
	["tianwang"] = {"Ph¸ Thiªn Kİch", "Ph¸ Thiªn chïy", "§¹i Phong §ao"},
	["shaolin"] = {"§¹i Phong §ao", "Kim C« Bæng"},
	["wudang"] = {"HuyÒn ThiÕt KiÕm (Vâ §ang kiÕm)", "HuyÒn ThiÕt KiÕm (Vâ §ang khİ)"},
	["kunlun"] = {"§¹i Phong §ao", "HuyÒn ThiÕt KiÕm"},
	["gaibang"] = 	 {"Kim C« Bæng (C¸i bang ch­ëng)", "Kim C« bæng (C¸i Bang c«n)"},
	["tianren"] = {"Ph¸ Thiªn Kİch (Thiªn NhÉn kİch)", "Ph¸ Thiªn Kİch (Thiªn NhÉn ch­ëng)"}
};

function v_fy_90_next()
	local player_Faction = GetFaction();	-- Get Faction Name
--	player_Faction = "tianren";
	if (not player_Faction or not v_fy_90_tab_weapon[player_Faction]) then		-- skip if role not in Faction
		Say("Ng­¬i h·y gia nhËp m«n ph¸i tr­íc råi ®Õn t×m ta.", 0);
		return
	end;

	local tab_Content = {}
	for i = 1, getn(v_fy_90_tab_weapon[player_Faction]) do
		tinsert(tab_Content, "Ta muèn nhËn l·nh"..v_fy_90_tab_weapon[player_Faction][i].."/#v_fy_90_weapon([["..player_Faction.."]],"..i..")");
	end;
	tinsert(tab_Content, "Rêi khái/no");

	Say("Ng­¬i muèn nhËn phÇn th­ëng g×?", getn(tab_Content), tab_Content);
end;

-- Get tanle
function v_fy_90_gettable(player_Faction)
	if (player_Faction == "cuiyan") then
		return tab_vn_fy_cym, tab_vn_fy_cym_add
	elseif(player_Faction == "emei") then
		return tab_vn_fy_emp, tab_vn_fy_emp_add
	elseif(player_Faction == "tangmen") then
		return tab_vn_fy_tm, tab_vn_fy_tm_add
	elseif(player_Faction == "wudu") then
		return tab_vn_fy_wdj, tab_vn_fy_wdj_add
	elseif(player_Faction == "tianwang") then
		return tab_vn_fy_twb, tab_vn_fy_twb_add
	elseif(player_Faction == "shaolin") then
		return tab_vn_fy_slp, tab_vn_fy_slp_add
	elseif(player_Faction == "wudang") then
		return tab_vn_fy_wdp, tab_vn_fy_wdp_add
	elseif(player_Faction == "kunlun") then
		return tab_vn_fy_klp, tab_vn_fy_klp_add
	elseif(player_Faction == "gaibang") then
		return tab_vn_fy_gb, tab_vn_fy_gb_add
	elseif(player_Faction == "tianren") then
		return tab_vn_fy_trj, tab_vn_fy_trj_add
	end;
	return nil;
end;

-- Get the prize of level up to 90
function v_fy_90_weapon(player_Faction, i)
	if (v_fy_awardcheck(90) == 0) then
		return
	end;
	
	local table = {};
	local _t = {};
	table, _t = v_fy_90_gettable(player_Faction);
	if (not table or not _t) then
		return
	end;
	local nIndex = random(1, getn(table[i]));
	local str = "B¹n nhËn ®­îc <color=yellow>"..v_fy_90_tab_weapon[player_Faction][i].."<color>.";
	if (player_Faction == "emei" or player_Faction == "wudang")  then
		str = "B¹n nhËn ®­îc <color=yellow>HuyÒn ThiÕt KiÕm<color>.";
	elseif (player_Faction == "gaibang") then
		str = "B¹n nhËn ®­îc <color=yellow>Kim C« Bæng<color>.";
	elseif (player_Faction == "wudu") then
		str = "B¹n nhËn ®­îc <color=yellow>§¸i Phong §ao<color>.";
	elseif (player_Faction == "tianren") then
		str = "B¹n nhËn ®­îc <color=yellow>Ph¸ Thiªn Kİch<color>.";
	end;
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 90);
	AddItemEx(_t[i][1],table[i][nIndex],_t[i][3], _t[i][4],_t[i][5],_t[i][6], _t[i][7],_t[i][8],_t[i][9], _t[i][10],_t[i][11],_t[i][12],_t[i][13],_t[i][14],_t[i][15]);
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 100:
function v_fy_100_entrance()
	Say("Kim binh thÕ m¹nh nh­ th¸c lò, T­¬ng D­¬ng s¾p thÊt thñ!, Hoµng Th­îng ®· tô häp anh hïng nghÜa sü kh¾p n¬i bµn b¹c tİnh kÕ, ®ång thêi ban tÆng Phi V©n ThÇn M· ®Ó tri ©n c¸c vŞ anh hïng.", 2, 
	"NhËn phÇn th­ëng cÊp 100/v_fy_100_next",
	"Nh©n tiÖn ghĞ xem th«i!/no");
end;

function v_fy_100_next()
	if (v_fy_awardcheck(100) == 0) then
		return
	end;
	
	-- ¼ÓÒ»Æ¥ÉñÂí
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 100);
	AddItem(0, 10, 8, 1, 0, 0, 0);
	Msg2Player("B¹n nhËn ®­îc <color=yellow>Phi V©n ThÇn M·<color>");
end;


function no()
end;


end;	--__H_V_FEIYUNACTION__
