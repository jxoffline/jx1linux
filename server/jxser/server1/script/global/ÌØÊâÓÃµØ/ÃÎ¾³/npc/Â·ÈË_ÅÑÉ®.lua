-- ÃÎ¾³ Â·ÈË_ÅÑÉ®.lua  Ï´µã¹¦ÄÜNPC

Include("\\script\\missions\\clearskill\\clearhole.lua");

function main()
	-- ·Ç·¨×´Ì¬
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("TiÕn nhËp vµo §¶o TÈy Tñy mét c¸ch kh«ng b×nh th­êng. ");
		Say("GM: <color=red>B¹n kh«ng thÓ vµo ®¶o TÈy Tñy, ®· bŞ hÖ thèng ghi nhí, xin h·y ®i t×m ng­êi phôc vô ®Ó chØnh lı l¹i! <color> ", 1, "Rêi khái ®¶o TÈy Tñy /LeaveHere_yes")
		return -1;
	end
	
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "CÊp cña ng­¬i vÉn ch­a ®¹t "..CSP_NEEDLEVEL.."Ch­a thÓ rêi khái ®¶o TÈy Tñy. ")
		return -1;
	end

	nType = GetTask(CSP_TID_ClearType);
	if (nType == CSP_CTYPE_SKILL) then -- Ö»Ï´¼¼ÄÜµã
		local tbOpt = 
		{
			"TÈy ®iÓm kü n¨ng /DoClearSkill",
			"T¨ng ®iÓm tiÒm n¨ng/add_prop",
			"Kh«ng tÈy /OnCancel",
			"VÒ viÖc TÈy Tñy /Help",
			"Rêi khái ®¶o TÈy Tñy /LeaveHere",
		}
		Say("ng­¬i chØ cã thÓ tÈy <color=blue> ®iÓm kü n¨ng<color>. Cã ®ång ı tÈy kh«ng? ", getn(tbOpt), tbOpt)
	elseif (nType == CSP_CTYPE_PROP) then -- Ö»ÄÜÇ±ÄÜµã
		local tbOpt = 
		{
			"TÈy ®iÓm tiÒm n¨ng/DoClearProp",
			"T¨ng ®iÓm tiÒm n¨ng/add_prop",
			"Kh«ng tÈy /OnCancel",
			"VÒ viÖc TÈy Tñy /Help",
			"Rêi khái ®¶o TÈy Tñy /LeaveHere",
		}
		Say("Ng­¬i chØ cã thÓ tÈy <color=blue> ®iÓm tiÒm n¨ng<color>. Cã ®ång ı tÈy kh«ng? ", getn(tbOpt), tbOpt)
	else -- if (nType == CSP_NEEDJEWEL_ALL) then -- È«Ï´(nType¿ÉÄÜÊÇ0£¬»ò3)
		local tbOpt = 
		{
			 "TÈy ®iÓm kü n¨ng /DoClearSkill",
			 "TÈy ®iÓm tiÒm n¨ng/DoClearProp", 
			 "T¨ng ®iÓm tiÒm n¨ng/add_prop", 
			 "Kh«ng tÈy /OnCancel", 
			 "VÒ viÖc TÈy Tñy /Help", 
			 "Rêi khái ®¶o TÈy Tñy /LeaveHere"
		}
		Say("Ng­¬i cã ®ång ı tÈy tñy kh«ng? ", getn(tbOpt),tbOpt)
	end;
end

function add_prop()
	Say("Thİch Minh: Ng­¬i muèn t¨ng ®iÓm kü n¨ng nµo?", 4,
			"t¨ng søc m¹nh/add_prop_str",
			"t¨ng Th©n Ph¸p/add_prop_dex",
			"t¨ng Ngo¹i C«ng/add_prop_vit",
			"T¨ng néi c«ng/add_prop_eng")
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè søc m¹nh: ");
end

function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè th©n ph¸p: ");
end

function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè ngo¹i c«ng:");
end

function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "Xin h·y nhËp ®iÓm sè néi c«ng: ");
end

function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end

function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end

function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end

function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end

function DoClearSkill()
	Say("Ng­¬i ®ång ı TÈy ®iÓm kü n¨ng kh«ng? ", 2, "TÈy ®iÓm kü n¨ng /DoClearSkillCore","Kh«ng tÈy /OnCancel")
end
function DoClearSkillCore()
--	if (Pay(100000) == 0) then
--		Say("ÊÍÃ÷£º¶Ô²»Æğ£¬Ã¿´ÎÏ´ËèĞè10ÍòÁ½£¬ÄãÉíÉÏ´øµÄÇ®²»¹»¡£", 0)
--		return
--	end

	i = HaveMagic(210)		-- Çá¹¦ÁíÍâ²Ù×÷
	j = HaveMagic(400)		-- ¡°½Ù¸»¼ÃÆ¶¡±ÁíÍâ²Ù×÷
	n = RollbackSkill()		-- Çå³ı¼¼ÄÜ²¢·µ»ØËùÓĞ¼¼ÄÜµã£¨°üÀ¨Çá¹¦µÈÌØÊâ¼¼ÄÜ£©
	x = 0
	if (i ~= -1) then x = x + i end		-- ÕâÁ½¾äÅĞ¶ÏÊÇÅÅ³ı´ÓÎ´Ñ§¹ıÇá¹¦µÄÈË·µ»Ø-1´Ó¶øµ¼ÖÂµãÊı¼ÆËã´íÎóÇé¿ö
	if (j ~= -1) then x = x + j end
	rollback_point = n - x			-- °Ñ¼¼ÄÜµãµ±×ö¿ÕÏĞµãÊı·µ»¹£¬µ«ÏÈ¿Û³ıÇá¹¦µÈ
	if (rollback_point + GetMagicPoint() < 0) then		-- Èç¹ûÏ´³ÉÁË¸ºÊı£¬Ôòµ±×÷0£¨ÎªÒÔºó¶à´ÎÏ´µã±£Áô£©
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end			-- Èç¹ûÑ§¹ıÇá¹¦Ôò¼Ó»ØÔ­ÓĞµÈ¼¶
	if (j ~= -1) then AddMagic(400,j) end			-- Èç¹ûÑ§¹ı¡°½Ù¸»¼ÃÆ¶¡±Í¬Ñù´¦Àí
	Msg2Player("TÈy Tñy thµnh c«ng! ng­¬i ®· cã thÓ ph©n phèi ®iÓm "..rollback_point.."§iÓm kü n¨ng cã thÓ ph©n phèi l¹i. ")
	Talk(1,"KickOutSelf","TÈy Tñy thµnh c«ng! ng­¬i ®· cã thÓ ph©n phèi ®iÓm "..rollback_point.."§iÓm kü n¨ng cã thÓ ph©n phèi l¹i. ")
end;

function DoClearProp()
	Say("Ng­¬i ®ång ı tÈy ®iÓm tiÒm n¨ng kh«ng? ", 2, "TÈy ®iÓm tiÒm n¨ng/DoClearPropCore", "Kh«ng tÈy /OnCancel")
end

function DoClearPropCore()
		base_str = {35,20,25,30,20}			-- ÎåĞĞÈËÎïµÄÌìÉúÊôĞÔÖµ
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1

		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- ½«ÒÑ·ÖÅäÇ±ÄÜÖØÖÃ£¨task(88)ÊÇÈÎÎñÖĞÖ±½Ó½±ÀøµÄÁ¦Á¿¡¢Éí·¨µÈ£©
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
end;

function OnCancel()
end;

function Help()
	strHelp = 
	{
		"Sau khi TÈy Tñy, ng­¬i cã thÓ ®i ra ngoµi ®Ó ®¸nh víi méc nh©n, hoÆc c¶ nhãm sÏ cïng ®i vµo s¬n ®éng ®Ó thùc nghiÖm chiÕn ®Êu, sau ®ã rêi khái ®¶o míi ®­îc xem lµ ®· hoµn thµnh. ",
		"ChØ cÇn ng­¬i kh«ng rêi khái ®¶o, ta sÏ gióp ng­¬i tÈy tñy võa ı!",
		"Ngoµi kia cã Cäc gç (3000 Sinh lùc) ;  Bao c¸t (10000 Sinh lùc) ; Méc nh©n 30000 Sinh lùc) ®Ó cho ng­¬i thö nghiÖm hiÖu qu¶ tÈy tñy!",
		"NÕu muèn thi ®Êu cã thÓ vµo trong s¬n ®éng, cho dï cã thÊt b¹i th× còng kh«ng bŞ tæn thÊt g×. ",
		"Nh­ng bªn trong s¬n ®éng th× l¹i rÊt nhá nhÑp, nhiÒu nhÊt còng chØ chøa ®­îc 20 ng­êi, cho nªn nÕu nh­ ®· cã ®ñ ng­êi th× ng­¬i kh«ng thÓ ®i vµo. ",
		"Nh­ng bªn trong s¬n ®éng th× l¹i rÊt nhá nhÑp, nhiÒu nhÊt còng chØ chøa ®­îc 20 ng­êi, cho nªn nÕu nh­ ®· cã ®ñ ng­êi th× ng­¬i kh«ng thÓ ®i vµo. ",
		"Cuèi cïng, khi nµo ng­¬i c¶m thÊy ®iÓm kü n¨ng ®· ®ñ h·y ®Õn t×m ta, ta sÏ ®­a ng­¬i trë vÒ chç cò "
	}
	Talk(7, "", strHelp[1], strHelp[2], strHelp[3], strHelp[4], strHelp[5], strHelp[6], strHelp[7]);
end;

function LeaveHere()
	Say("ng­¬i cho r»ng ®· TÈy Tñy xong råi ­? Cã muèn rêi khái kh«ng? ",2, "Muèn rêi khái /LeaveHere2", "§Ó ta suy nghÜ kü l¹i xem/OnCanCel")
end

function LeaveHere2()
	Say("Rêi khái ®¶o TÈy Tñy, nÕu muèn trë l¹i sÏ rÊt khã. ng­¬i vÉn kiªn quyÕt rêi khái chø? ", 2, "ta thËt sù muèn rêi khái n¬i ma qu¸i nµy /LeaveHere_yes", "ta vÉn muèn ë l¹i /OnCanCel")
end

function LeaveHere_yes()
	W,X,Y = GetWorldPos();
	LeaveTeam()
	CSP_LeaveClearMap(W);
end
