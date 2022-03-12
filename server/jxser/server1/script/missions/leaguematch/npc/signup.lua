Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_want2transback()
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("ThŞ vÖ héi tr­êng: ChiÕn ®éi cña b¹n kh«ng ph¶i ®ang thi ®Êu sao? NÕu b©y giê rêi ®éi sÏ kh«ng thÓ l·nh phÇn th­ëng. B¹n nghÜ kü ch­a?",
			2, "§óng vËy!/wlls_transback", "Kh«ng cÇn!/OnCancel")
	else
		wlls_transback()
	end
end

--¼ì²éÊÇ·ñ¿ÉÒÔ½øÈë×¼±¸³¡£¬³É¹¦·µ»Ø£¨n_matchtype,leagueid£©£¬·ñÔò·µ»Ønil
function wlls_ready2join()
	local n_mtype, n_group = wlls_get_mapinfo()
	local n_lid = wlls_check_player(GetName(), nil, n_mtype)
	if (FALSE(n_lid)) then
		wlls_transback()
		return nil
	end
	
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	if (n_matchphase < 3) then
		Say("B©y giê b¹n ng­¬i ch­a thi ®Êu, cã cÇn ta ®­a ng­¬i vÒ?", 2, "§óng vËy!/wlls_transback", "Ta ch­a muèn vÒ!/OnCancel")
		return nil
	end
	
	local tb_option = wlls_add_option({}, "Kh«ng cÇn")
	if (n_matchphase == 3) then	--¼äĞªÊ±¼ä
		--Èç¹û²»ÊÇ×îºóÒ»³¡£¿
		Say("Xin h·y t¹m nghØ ë ®©y! HiÖn vÉn ch­a b¾t ®Çu thi ®Êu, ng­¬i cßn yªu cÇu nµo kh«ng?", getn(tb_option), tb_option)
		return nil
	end
	
	--ÅĞ¶ÏÊÇ·ñÔ½¼¶
	local str = wlls_levelcheck(n_lid)
	if (str) then
		Say("Quan viªn héi tr­êng:"..str, 2, "Ta muèn rêi khái héi tr­êng!/wlls_want2transback", "Kh«ng cÇn!/OnCancel")
		return nil
	end

	if (n_matchphase == 5) then	--±ÈÈüÊ±¼ä
		local n_combatmap = wlls_get_mapid(3, n_mtype, n_group)
		local n_resttime = WLLS_TIMER_FIGHT_TOTAL - GetGlbValue(GLB_WLLS_TIME)
		n_resttime = ceil(n_resttime*WLLS_TIMER_FIGHT_FREQ/60)
		Say("VÉn ®ang tiÕn hµnh thi ®Êu! Thêi gian kÕt thóc cßn"..n_resttime.."phót, b¹n cÇn gióp ®ì g× kh«ng?", getn(tb_option), tb_option)
		return nil
	end

	if (n_matchphase == 4) then	--×¼±¸Ê±¼ä
		return n_mtype, n_lid
	end
	
	print("n_matchphase error! :"..n_matchphase)
end

function main()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then
		return
	end
	
	local nLevel	= wlls_get_level(n_mtype)
	if (not wlls_CheckIsOpen(nLevel)) then
		return
	end
	
	local tb_option = {"Ta muèn tham chiÕn!/wlls_en1"}
	wlls_add_option(tb_option, "Kh«ng cÇn")
	Say("HiÖn thi ®Êu ®ang trong giai ®o¹n b¸o danh, muèn tham gia thi ®Êu ph¶i kh«ng?", getn(tb_option), tb_option)
	
	local _, _, n_count = LG_GetLeagueInfo(n_lid)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_maxmem = WLLS_TAB[n_type].max_member
	if (n_count < n_maxmem) then
		Msg2Player("Nhãm cña b¹n hiÖn chØ cßn<color=yellow>"..n_count.."<color>thµnh viªn, chiÕn ®éi cña b¹n cã thÓ gia nhËp nhiÒu nhÊt<color=yellow>"..n_maxmem.."<color>thµnh viªn.")
	end
end

function wlls_en1()
	Say("Vâ l©m liªn ®Êu kh«ng ®­îc sö dông <color=red> bÊt cø lo¹i d­îc phÈm PK nµo<color>, <color=yellow>c¸c hiÖu qu¶ hç trî cho kü n¨ng còng bŞ v« hiÖu<color>. Sau khi b¾t ®Çu thi ®Êu cã thÓ <color=yellow>®iÒu phèi l¹i c¸c kü n¨ng<color>. Tr­íc khi vµo ®Êu tr­êng cÇn xem l¹i ®é hao mßn cña c¸c trang bŞ, ®Êu tr­êng kh«ng cho phĞp vøt trang bŞ ra ngoµi",2, "Ta ®· s½n sµng!/wlls_en2", "Ta sÏ quay l¹i sau!/OnCancel")
end

function wlls_en2()
	Say("Quan viªn héi tr­êng:<color=red>Vµo khu vùc chuÈn bŞ vµ khu vùc thi ®Êu, ng­êi ch¬i kh«ng thÓ di chuyÓn vËt phÈm trong hµnh trang nh­ng vÉn cã thÓ sö dông vËt phÈm trong thanh c«ng cô vµ hµnh trang. Ng­¬i h·y kiÓm tra l¹i vËt phÈm trong thanh c«ng cô ®· ®Çy hay ch­a?",2,"X¸c nhËn/wlls_en3", "Ta ch­a s½n sµng!/OnCancel")
end

function wlls_en3()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then return end
	if not wlls_en_check() then return end
	
	local szResult = n_mtype.." "..GetName()
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_want2join", szResult , "", "")
end

