-- ½­ÄÏÇø ÌÒ»¨µº Â·ÈË_ÌÒ»¨ÒşÊ¿.lua
-- by: Dan_deng(2004-05-15)
-- Âô¹Ò»úÒ©£¬²éÑ¯Ê±¼ä£¬ÎªÏ´µã×öºÏ·¨ĞÔ¼ì²é

Include("\\script\\global\\timerhead.lua")
Include("\\script\\missions\\autohang\\function.lua")

function main()
	--Uworld137 = GetTask(137)
	--if (Uworld137 == 0) then						-- µÚÒ»´Î¶Ô»°£¬ĞèÒª¼ì²â¼¼ÄÜ¸üĞÂ
	--	if (check_faction() < 20) then			-- ĞèÒª¸üĞÂÆä¼¼ÄÜ
	--		Talk(1,"","ÌÒ»¨ÒşÊ¿£ºÏà¼û¼´ÊÇÓĞÔµ£¬¼ÈÈ»À´µ½ÌÒ»¨µº£¬ÏÈÈ¥¼û¹ıÄã±¾ÃÅµÄ³¤±²°É¡£Ëµ²»¶¨ËûÃÇÒ»¸ßĞËÖ¸µãÄãÁ½ÕĞ¾ÍÊÜÓÃÎŞÓÃÁË¹ş¡£")
	--	else												-- ²»Ğè¸üĞÂ£¬Ö±½ÓÌø¹ı
	--		Talk(1,"","ÌÒ»¨ÒşÊ¿£º»¶Ó­Ò»¶¨À´µ½ÌÒ»¨µº£¬¿´ÄãÆøÓî²»·²£¬¶¨ÊÇÄêÇáÓĞÎªµÄĞ¡ÅóÓÑ¡£")
	--	end
	-- elseif (Uworld137 < 20) then					-- Ã»ÓĞÈ¥¸üĞÂ¼¼ÄÜµÄ£¬²»ÔÊĞíÂò¹Ò»úÒ©
	--	Talk(1,"","ÌÒ»¨ÒşÊ¿£º¿ìÈ¥°İ¼ûÄãµÄ±¾ÃÅ³¤±²°É£¬ÎÒÏ²»¶¶®ÀñÃ²µÄºÃº¢×Ó¡£")
	--elseif (GetLevel() >= 50) then		-- Âò¹Ò»úµÀ¾ßÒ²Òª¼ì²âºÏ·¨ĞÔ
		-- Say("ÌÒ»¨ÒşÊ¿£ºÌÒ»¨µº³äÂú×ÅÁéÆø£¬ÊÇÁ·¹¦µÄ±¦µØ¡£ºÈÍë<color=red>À°°ËÖà<color>£¬ÇáÇáËÉËÉ¹¦Á¦×Ô¶¯ÌáÉı£¡Ò»Íë¿ÉÎ¬³Ö¹¦Ğ§Ò»Ğ¡Ê±¡£",3,"ºÃ£¬ÎÒºÈ/buy_yes","ÇëÎÊÒ»ÏÂÀ°°ËÖà¹¦Ğ§»¹ÓĞ¶àÉÙÊ±¼ä/check_time","ÏÂ´ÎÔÙËµ°É/OnCancel")
	--end
	
	strNeedLevel = "§µo Hoa §¶o vµ c¸ch tuyÖt víi thÕ giíi bªn ngoµi, ®­êng ®i nguy hiÓm, kh«ng ®Õn<color=red> "..AEXP_NEEDLEVEL.."cÊp<color> mµ muèn vµo ®©y? VÒ luyÖn c«ng thªm ®i!";
	-- Ãâ·ÑË«¾­Ñé
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- Ãâ·ÑË«¾­ÑéÈÕ×Ó
		nLevel = GetLevel();	
		if (nLevel < AEXP_NEEDLEVEL) then
			Say(strNeedLevel, 0);
		else
			Say("HiÖn nay §µo Hoa ®¶o linh khİ rÊt m¹nh, lóc nµy luyÖn c«ng kh«ng cÇn ph¶i dïng ®Õn ch¸o L¹p B¸t. Nh÷ng b¸t ch¸o ®· uèng còng sÏ kh«ng bŞ trõ thêi gian. H«m nay qu¶ lµ mét ngµy ®Ñp trêi. L·o phu ®©y còng c¶m thÊy tinh thÇn phÊn chÊn. §­îc råi! §¹i hiÖp kh«ng cÇn tèn ng©n l­îng! C¬ héi hiÕm cã, h·y tranh thñ luyÖn c«ng ®i nhĞ!", 0);
		end
		
		return 1;		
	end
	
	nLevel = GetLevel();	
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(strNeedLevel, 0);
	else
		Say("§µo Hoa ®¶o linh khİ sung m·n. Uèng thªm b¸t <color=red>ch¸o L¹p B¸t<color> sc«ng lùc sÏ t¨ng lªn rÊt nhiÒu. Mçi b¸t cã c«ng hiÖu trong 1 giê!",
			4,
			"§­îc! ta uèng! /buy_yes",
			"Xin hái: Thø ch¸o nµy, uèng vµo bao l©u sau míi cã c«ng hiÖu? /check_time",
			--"Ta muèn chÕ t¹o Hçn Nguyªn Linh Lé/refine",
			"LÇn sau sÏ nãi tiÕp /OnCancel");
	end
end

-- Á¶ÖÆ»ìÔªÁéÂ¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function check_faction()
	if (GetTask(3) >= 10*256) and (GetTask(3) ~= 75*256) then			-- ÌìÍõ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,3)
		return 3
	elseif (GetTask(7) >= 10*256) and (GetTask(7) ~= 75*256) then		-- ÉÙÁÖ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,7)
		return 7
	elseif (GetTask(2) >= 10*256) and (GetTask(2) ~= 75*256) then		-- ÌÆÃÅ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,2)
		return 2
	elseif (GetTask(10) >= 10*256) and (GetTask(10) ~= 75*256) then	-- Îå¶¾»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,10)
		return 10
	elseif (GetTask(1) >= 10*256) and (GetTask(1) ~= 75*256) then		-- ¶ëáÒ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,1)
		return 1
	elseif (GetTask(6) >= 10*256) and (GetTask(6) ~= 75*256) then		-- ´äÑÌ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,6)
		return 6
	elseif (GetTask(4) >= 10*256) and (GetTask(4) ~= 75*256) then		-- ÌìÈÌ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,4)
		return 4
	elseif (GetTask(8) >= 10*256) and (GetTask(8) ~= 75*256) then		-- Ø¤°ï»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,8)
		return 8
	elseif (GetTask(5) >= 10*256) and (GetTask(5) ~= 75*256) then		-- Îäµ±»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,5)
		return 5
	elseif (GetTask(9) >= 10*256) and (GetTask(9) ~= 75*256) then		-- À¥ÂØ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,9)
		return 9
	else																					-- °×ÃûµÄ£¬²»ĞèÒª¸üĞÂ
		SetTask(137,20)
		return 20
	end
end;

function check_time()

	-- Ãâ·ÑË«¾­Ñé
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- Ãâ·ÑË«¾­ÑéÈÕ×Ó
		Say("HiÖn nay §µo Hoa ®¶o linh khİ rÊt m¹nh, lóc nµy luyÖn c«ng kh«ng cÇn ph¶i dïng ®Õn ch¸o L¹p B¸t. Nh÷ng b¸t ch¸o ®· uèng còng sÏ kh«ng bŞ trõ thêi gian. C¬ héi hiÕm cã. §¹i hiÖp h·y tranh thñ luyÖn c«ng ®i nhĞ!", 0);
		return 1;
	end
	
	nCurValue = GetTask(AEXP_TASKID);
	
	if (nCurValue == 0) then	-- ¿ÉÄÜ´ÓÎ´ºÈ¹ıÀ°°ËÖà
		Say("H×nh nh­ <color=red>ch¸o L¹p B¸t<color> cña ng­¬i kh«ng cã t¸c dông! H·y mua thªm b¸t n÷a xem sao!", 0);
		return 0;
	end

	nTemp = mod(nCurValue, AEXP_TIME_ONE);
	nHours = (nCurValue - nTemp) / AEXP_TIME_ONE; -- ÒÑºÈµÄÍëÊı(Ğ¡Ê±Êı)
	nMinutes = nTemp * 60 / AEXP_TIME_ONE;

	if (nHours == 0) and (nMinutes < AEXP_FREQ) then	-- ¹Ò»úÊ±¼ä²»×ã
		Say("C«ng hiÖu cña ch¸o l¹p b¸t ®· hÕt! Ng­¬i cÇn ph¶i mua thªm mét İt n÷a míi cã thÓ tiÕp tôc ph¸t huy!", 0);
	elseif (nHours > 0) then				-- »¹ÓĞ1Ğ¡Ê±ÒÔÉÏ
		Say("C«ng hiÖu cña Ch¸o L¹p B¸t cßn cã thÓ duy tr×<color=red> "..nHours.."<color>giê<color=red>"..nMinutes.."<color> phót", 0);
	else
		Say("C«ng hiÖu cña Ch¸o L¹p B¸t cßn cã thÓ duy tr×<color=red> "..nMinutes.."<color> phót", 0);
	end
end;

g_arBuyNumber = {1, 2, 4, 8}; -- µ¥Î»£ºĞ¡Ê±
function buy_yes()
	nLevel = GetLevel();
	arBuyStr = {};
	nCount = getn(g_arBuyNumber);

	for i = 1, nCount do
		nNumber = g_arBuyNumber[i];
		nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
		if (nMoney > 0) then
			arBuyStr[i] = ""..nNumber.."B¸t [ "..nMoney.." l­îng]".."/buy_deal";
		end
	end

	arBuyStr[nCount + 1] = "Ta ch­a muèn dïng ®Õn!/OnCancel"
	Say("Ng­¬i muèn uèng mÊy b¸t?", nCount+1, arBuyStr);
end;

function buy_deal(nSel)
	nNumber = g_arBuyNumber[nSel+1]; -- µ¥Î»£ºĞ¡Ê±
	
	--ÍëÊı¼ì²é - start
	nCurValue = GetTask(AEXP_TASKID);
	temp = (AEXP_TIME_MAX - nCurValue) / AEXP_TIME_ONE; -- Ä¿Ç°¿ÉºÈµÄÍëÊı(Ğ¡Ê±Êı)
	nRemainNumber = floor(temp);
	if (nRemainNumber <= 0) then
		Msg2Player("B¹n ®· uèng"..AEXP_HOUR_MAX.."B¸t ch¸o L¹p B¸t, c¶m gi¸c tù m×nh còng kh«ng ¨n thªm ®­îc tİ nµo. Cã lÏ sau 1 thêi gian tiªu hãa míi cã thÓ ¨n mÊy b¸t. ")
		return 0;
	end

	if (nNumber > nRemainNumber) then
		Msg2Player("b¹n c¶m thÊy m×nh cã thÓ uèng tèi ®a"..AEXP_HOUR_MAX.."B¸t ch¸o L¹p B¸t, b©y giê ®· ¨n råi "..(AEXP_HOUR_MAX - nRemainNumber).."B¸t. ")
		nNumber = nRemainNumber;
	end
	--ÍëÊı¼ì²é - end

	nLevel = GetLevel();
	nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
	if (GetCash() >= nMoney) then
		Pay(nMoney);
		nValueTotal = nCurValue + (AEXP_TIME_ONE * nNumber);
		SetTask(AEXP_TASKID,  nValueTotal);

		-- ÍëÊı¼°Ê±¼äÌáÊ¾ - start
		nTemp = mod(nValueTotal, AEXP_TIME_ONE);
		nHours = (nValueTotal - nTemp) / AEXP_TIME_ONE; -- ÒÑºÈµÄÍëÊı(Ğ¡Ê±Êı)
		nMinutes = nTemp * 60 / AEXP_TIME_ONE;
		Msg2Player("B¹n ®· uèng"..nNumber.."b×nh ch¸o L¹p B¸t. Cã thÓ tù ®éng luyÖn c«ng"..nHours.."giê "..nMinutes.."phót");
		-- ÍëÊı¼°Ê±¼äÌáÊ¾ - end
				
		if (nCurValue == 0) then -- ¿ÉÄÜÊÇµÚÒ»´ÎºÈ
			Talk(1,"","Ch¸o L¹p B¸t chØ cã c«ng hiÖu trªn §µo Hoa ®¶o! NÕu uèng råi mµ rêi khái ®©y sÏ mÊt t¸c dông")
		end
	else
		Talk(1,"","Ch¸o L¹p B¸t lµ mét d­îc phÈm thÇn kú, kh«ng thÓ tÆng! §¹i hiÖp h·y mang "..nMoney.." l­îng ®Õn ®Ó mua!")
	end
end;

function OnCancel()
end;
