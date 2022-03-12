-- ÍæZingPlay»ñµÃ½±Æ·
-- ZingPlayºì°ü

-- COMMON ³£Á¿ --
ZingPlay_Start_Date	= 20081018;		-- »î¶¯ÆðÊ¼Ê±¼ä
ZingPlay_End_Date	= 20081107;		-- ºì°üÊ¹ÓÃÏÞÆÚ


-- TSK ÈÎÎñ±äÁ¿ --
TSK_ZINGPLAY_VERSION	= 2563;		-- ¼ÇÂ¼»î¶¯ÆðÊ¼Ê±¼ä
TSK_ZINGPLAY_MAXEXP		= 2564;		-- ¼ÇÂ¼»ñµÃµÄ¾­ÑéÖµ

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	
	local n_cur_date = GetTask(TSK_ZINGPLAY_VERSION);
	
	if (n_cur_date ~= ZingPlay_Start_Date) then
		SetTask(TSK_ZINGPLAY_VERSION, ZingPlay_Start_Date);
		SetTask(TSK_ZINGPLAY_MAXEXP, 0);
	end
	
	local n_max_exp = 200000000;
	local n_one_exp = 20000000;
	
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		local n_cur_exp = GetTask(TSK_ZINGPLAY_MAXEXP);
		
		if (n_cur_exp >= n_max_exp) then
			Say(format("§¹i hiÖp ®· nhËn ®­îc %d kinh nghiÖm tõ ho¹t ®éng ZingPlay, v× vËy kh«ng thÓ tiÕp tôc sö dông bao l× x× ZingPlay n÷a.", n_max_exp), 0);
			return 1;
		end
		
		SetTask(TSK_ZINGPLAY_MAXEXP, n_cur_exp + n_one_exp);
		AddOwnExp(n_one_exp);
		
		local sz_msg = format("Sö dông bao l× x× ZingPlay thu ®­îc %d kinh nghiÖm", n_one_exp);
		
		Msg2Player(sz_msg);
		
		WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
				GetLocalDate("%Y-%m-%d_%X"),
				GetName(),
				GetAccount(),
				sz_msg	));
	else
		
		Say("Ho¹t ®éng ®· kÕt thóc, kh«ng thÓ sö dông vËt phÈm nµy n÷a.");
		return 0;
	end
end
