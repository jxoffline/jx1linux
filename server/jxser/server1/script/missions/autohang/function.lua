Include("\\script\\missions\\autohang\\head.lua");

-- ¸ù¾İÍæ¼Ò¼¶±ğ£¬¼ÆËã¾­ÑéÖµ
-- ´Ëº¯ÊıÔÚGameServerÆô¶¯Ê±×Ô¶¯µ÷ÓÃ£¬ÓÃÓÚ½¨Á¢¹Ò»ú¾­ÑéÊıÖµ±í
function AEXP_GetHangExpValue(nLevel)	

	nExp = 0;
	-- Ò»Ğ¡Ê±¹Ò»ú¾­Ñé£ºe={3.5w+floor[(lv-50)/5]*0.5w}*1.2
	if (nLevel == 50) then 	-- 50
		nExp = 700; -- Ã¿·ÖÖÓ»ñµÃµÄ¾­ÑéÖµ
	elseif (nLevel < 100) then 	-- 51~99
		nExp = 700 + floor((nLevel - 50)/5)*100; -- Ã¿·ÖÖÓ»ñµÃµÄ¾­ÑéÖµ
	else -- 100¼¶¼°100¼¶ÒÔÉÏ
		nExp = 1700; -- Ã¿·ÖÖÓ»ñµÃµÄ¾­ÑéÖµ[700 + floor((100 - 50)/5)*100]
	end
	
	--2007-01-05 ¾­Ñéµ÷ÕûÎªÔ­À´µÄ3±¶
	nExp = nExp * AEXP_FREQ * 3 / 2; -- (10)·ÖÖÓ»ñµÃµÄ¾­ÑéÖµ
	
	return nExp;
end;

-- ¸ù¾İÍæ¼Ò¼¶±ğ£¬ÒÔ¼°¹Ò»úÊ±¼ä(ÒÔĞ¡Ê±Îªµ¥Î»)£¬¼ÆËãËùĞèµÄ½ğÇ®
function AEXP_GetNeedMoney(nLevel, nTime)
	nTemp =  60 / AEXP_FREQ; -- Ò»Ğ¡Ê±(60·ÖÖÓ)µ÷Õû¼¸´Î¾­Ñé
	nMoney = AEXP_GetHangExpValue(nLevel) * nTemp * nTime / 2; -- ¾­ÑéÖµ:ÒøÁ½Êı = 2:1
	return nMoney;
end;

-- ½øÈëÌÒ»¨µº
-- ·µ»ØÖµ£º1±íÊ¾³É¹¦£¬0±íÊ¾Ê§°Ü£¬-1±íÊ¾ÒøÁ½²»×ã
function aexp_gotothd(nSubWorldID)
	if (GetCash() < AEXP_TICKET) then
		return -1;
	end
	
	if(GetExtPoint( 0 ) <= 0 ) then
		Say("Xin lçi! ChØ cã n¹p thÎ míi ®i ®­îc §µo Hoa ®¶o ",0)
		return -2
	end

	Pay(AEXP_TICKET)
	LeaveTeam(); -- Àë¿ª¶ÓÎé
	SetAutoHangMapFlag(1) -- ÉèÖÃ½øÈë¹Ò»úµØÍ¼±ê¼Ç(ÆÁ±Î¹«ÁÄ¡¢»Ø³ÇµÈ¹¦ÄÜ)
	
	-- Ãâ·ÑË«¾­ÑéÊ±¼ä£¬²»ĞèĞ£Õı¹Ò»úÊ±¼ä
	if (AEXP_IsFreeTimeDoubleExp() == 0) then-- ·ÇÃâ·ÑË«¾­ÑéÈÕ×Ó
		-- Ê£ÓàÊ±¼äĞ£Õı - start
		-- Íæ¼ÒÔÚÀë¿ªÌÒ»¨µºÊ±£¬À°°ËÖàµÄÒ©Á¦ÎŞĞ§µ«ÓĞĞ§Ê±¼äÈÔ»áÏûºÄ
		-- ËùÒÔÔÚÔÙ´Î½øÈëÊ±Ğè¿Û³ıÕâ²¿·Ö¹Ò»úÊ±¼ä
		--06.06.13
		--À°°ËÖàÒÑ±»ÍÚ¿óÊ±¼äÌæ»»£»Íæ¼ÒÀë¿ªÌÒ»¨µºÊ±¼ä²»»áÏûºÄ£¬²»Ğè¿Û³ıÊ±¼ä
		--nTime = GetTask(AEXP_OLTIME_TASKID);
		--if (nTime > 0) then
		--	nTime = floor((GetGameTime() - nTime) / 60); -- µ¥Î»£º·ÖÖÓ
		--	nPointTime = GetTask(AEXP_TASKID) - nTime;  -- ¿ÛÊ±¼ä(µ¥Î»£º·ÖÖÓ)
		--	if (nPointTime < 0) then
		--		nPointTime = 0;
		--	end
		--	
		--	SetTask(AEXP_TASKID, nPointTime); -- ĞÂµÄÊ£ÓàÊ±¼ä
		--end
		-- Ê£ÓàÊ±¼äĞ£Õı - end
	end
	
	NewWorld(nSubWorldID,1523,3237)
	SetFightState(0)
	Msg2Player("B¹n ®· ®Æt ch©n vµo mét thÕ giíi riªng biÖt. T¹i ®©y n¨ng lùc cña b¹n sÏ bŞ ¶nh h­ëng: Kh«ng thÓ t¸n gÉu thµnh thŞ, t¸n gÉu m«n ph¸i, t¸n gÉu thÕ giíi; kh«ng thÓ sö dông Thæ ®Şa phï, T©m T©m T­¬ng ¸nh Phï; kh«ng thÓ tæ chøc ®éi, kh«ng thÓ bu«n b¸n. ");
	return 1;
end;
