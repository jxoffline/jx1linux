-- ÁÙ°²¡¡Â·ÈË¡¡ÍËÈÎ¹ÙÔ± (ÁÙ°²£º183/182)(NewWorld(176,1465,2927))
-- by£ºDan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-07-19) ²¿·ÖÍæ¼ÒÍê³É90¼¶ÈÎÎñÎŞ·¨µÃµ½¼¼ÄÜµÄBUGµÄ²¹¶¡

Include("\\script\\global\\skills_table.lua")

function main()
	faction_task = {7,3,2,10,1,6,8,4,5,9}
	faction_name = {"shaolin","tianwang","tangmen","wudu","emei","cuiyan","gaibang","tianren","wudang","kunlun"}
	quest_task = {122,121,123,124,125,126,128,127,129,130}
	LastFactionNo = GetLastFactionNumber()
	if (LastFactionNo < 0) then					-- Ã»ÓĞÃÅÅÉµÄ²»ÔÊĞí½øĞĞĞŞ¸´Á÷³Ì£¨°üÀ¨°×Ãû£©
		if (GetFaction() ~= "") then
			WriteLog("Ng­êi ch¬i' "..GetAccount().."'nh©n vËt'"..GetName().."': m«n ph¸i xuÊt hiÖn lçi, kh«ng thÓ thôc luyÖn kü n¨ng cÊp 90")
			Say("Ng­¬i lµ nguêi cña m«n ph¸i nµo? Sao ta cµng nh×n l¹i cµng kh«ng gièng ",0)
		else
			Talk(1,"","Ta võa míi tr×nh tÊu víi Hoµng th­îng c¸o l·o vÒ quª. Ta dù ®Şnh sÏ x©y mét khu hoa viªn ë L©m An ®Ó tËn h­ëng nh÷ng ngµy thanh nhµn cuèi ®êi. ")
		end
		return
	end

	if (GetFaction() == "wudang") and (GetSeries() == 4) then	-- Ö»ÒªÊÇÎäµ±ÅÉ¾ÍÔÊĞí½øĞĞ¼ì²é£¬¼ì²éÓĞÎÊÌâµÄÖ±½ÓĞŞ¸´ÍË³ö£¬Ã»ÓĞÎÊÌâµÄ¼ÌĞøºóÃæµÄÁ÷³Ì
		MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - 1		-- Ó¦ÓĞµãÊı
		GetMagic_total = 	GetTotalSkill() + GetMagicPoint()												-- ÊµÓĞµãÊı
		if (HaveMagic(210) == 1) then GetMagic_total = GetMagic_total - 1 end		-- ÕâÁ½¾äÅĞ¶ÏÊÇÅÅ³ı´ÓÎ´Ñ§¹ıÇá¹¦µÄÈË·µ»Ø-1´Ó¶øµ¼ÖÂµãÊı¼ÆËã´íÎóÇé¿ö
		if (HaveMagic(400) == 1) then GetMagic_total = GetMagic_total - 1 end
		n = MagicPoint_total - GetMagic_total
		if (n > 0) then						--¡¡ÊµÓĞµãÊı<Ó¦ÓĞµãÊı£¬¼´¼¼ÄÜµã¶ªÊ§
			SetTask(137,0)
			Say("Chµng trai trÎ! §õng cã nãng véi! H·y t×m c¸ch tiªu gi¶i nh÷ng ­u phiÒn ®ã ®i. Ta ®· gióp ng­¬i söa ch÷a nh÷ng sai lÇm ®ã råi ",1,"BiÕt råi/KickOutSelf")
			return
		end
	end

	i = faction_task[LastFactionNo + 1]
	j = quest_task[LastFactionNo + 1]
	k = floor(LastFactionNo/2)
	if (GetTask(2) == 80*256) and (GetSeries() == 1) and (HaveMagic(302) == 0) then
		AddMagic(302,1)				-- ĞŞ¸´³ÔÊéµÃµ½±©ÓêÀæ»¨¼¼ÄÜµÈ¼¶Îª0¼¶µÄ´íÎó
		Say("Chµng trai trÎ ®õng v× mét chuyÖn nhá nh­ vËy mµ buån rÇu. BÜ cùc th¸i lai. ChuyÖn g× råi còng cã thÓ gi¶i quyÕt ®­îc! Cè lªn! Cè lªn! Khµ khµ! ",0)
	elseif (GetTask(i) == 80*256) and (GetFaction() == faction_name[LastFactionNo+1]) and (GetSeries() == k) and (GetTask(j) == 245) then
		SetTaskTemp(20,0)		-- Çå¿ÕÁÙÊ±±äÁ¿£¬×¼±¸Ê¹ÓÃ
		repair90(i)			-- 90¼¶¼¼ÄÜĞŞ¸´
		SetTask(j,255)			-- ÈÎÎñ×´Ì¬ĞŞ¸´
		WriteLog("Ng­êi ch¬i' "..GetAccount().."'nh©n vËt'"..GetName().."': kü n¨ng cÊp 90 ®· c¨n cø theo m«n ph¸i"..i..", sè nhiÖm vô "..j.." hoµn thµnh s÷a ch÷a! ")
		Say("Chµng trai trÎ ®õng v× mét chuyÖn nhá nh­ vËy mµ buån rÇu. BÜ cùc th¸i lai. ChuyÖn g× råi còng cã thÓ gi¶i quyÕt ®­îc! Cè lªn! Cè lªn! Khµ khµ! ",0)
		SetTaskTemp(20,0)		-- Çå¿ÕÁÙÊ±±äÁ¿£¬ÒÔ±¸ÏÂ´Î
	else
		Talk(1,"","Ta võa míi tr×nh tÊu víi Hoµng th­îng c¸o l·o vÒ quª. Ta dù ®Şnh sÏ x©y mét khu hoa viªn ë L©m An ®Ó tËn h­ëng nh÷ng ngµy thanh nhµn cuèi ®êi. ")
	end
end;

function repair90(x)
	if (x == 1) then
		SetTaskTemp(20,332)
		add_em(90)
	elseif (x == 2) then
		SetTaskTemp(20,351)
		add_tm(90)
	elseif (x == 3) then
		add_tw(90)
	elseif (x == 4) then
		SetTaskTemp(20,391)
		add_tr(90)
	elseif (x == 5) then
		add_wd(90)
	elseif (x == 6) then
		add_cy(90)
	elseif (x == 7) then
		add_sl(90)
	elseif (x == 8) then
		add_gb(90)
	elseif (x == 9) then
		SetTaskTemp(20,394)
		add_kl(90)
	elseif (x == 10) then
		SetTaskTemp(20,390)
		add_wu(90)
	end
end
