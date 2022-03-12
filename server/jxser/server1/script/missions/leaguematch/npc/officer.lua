--ÎäÁÖÁªÈü¹ÙÔ±

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )
Include("\\script\\lib\\log.lua")


--Ö÷¶Ô»°¿ò
function main()
	local n_level = wlls_getcityinfo()
	if (not wlls_CheckIsOpen(n_level)) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (not FALSE(n_lid)) then
		--¼ì²é²¢ÌáÊ¾ÕÒ´í¹ÙÔ±µÄÇé¿ö
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mylevel = WLLS_TAB[n_mytype].match_type[n_mtype].level
		if (n_mylevel ~= n_level) then
			wlls_descript("<enter>   C¸c h¹ ®· gia nhËp<color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> Ta lµ <color=red>"..WLLS_LEVEL_DESC[n_level].."<color>, cã ph¶i ®· t×m nhÇm ng­êi?", wlls_add_option({}, "Kh«ng cã chuyÖn g× hÕt"))
			return
		end
		
		--ÅĞ¶ÏÊÇ·ñÔ½¼¶
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"Ta muèn rêi khái nhãm!/wlls_want2leaveleague",
				"Ta muèn xem thö m×nh cã phÇn th­ëng kh«ng/wlls_wantaward",
				"Ta sÏ quay l¹i sau/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "Ta muèn ®Õn "..str_des.."héi tr­êng/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = " "..str_des.."nhãm/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "Ta muèn l·nh phÇn th­ëng liªn ®Êu/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "Ta muèn kiÓm tra ®iÓm Uy Danh/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "§ãng/ më nhËn kinh nghiÖm/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "Ta chØ tiÖn ghĞ qua"))
end

--ÁìÈ¡½±Àø£¨¶Ô»°£©
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter>####bÊt kÓ tham gia Vâ l©m liªn ®Êu hay vâ l©m kiÖt xuÊt ®Òu ®­îc nhËn phÇn th­ëng. PhÇn th­ëng bao gåm <color=red>PhÇn th­ëng xÕp h¹ng<color> vµ <color=red>®iÓm Vinh dù<color>. Sau mçi giai ®äan thi ®Êu kÕt thóc, sÏ c¨n cø vµo<color=red>®iÓm tich lòy, tû lÖ th¾ng, tæng thêi gian thi ®Êu<color> ®Ó xÕp h¹ng. <color=red>"..n_awardmin.."®éi xÕp cao nhÊt<color> sÏ nhËn ®­îc <color=red>phÇn th­ëng ®Æc biÖt<color>. Ng­êi ch¬i trong qu¸ tr×nh thi ®Êu cß thÓ dïng ®iÓm vinh dù ®Ó ®æi phÇn th­ëng danh dù. Ng­¬i muèn nhËn phÇn th­ëng g×?"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "Ta muèn l·nh phÇn th­ëng xÕp h¹ng!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "Ta muèn l·nh gi¶i th­ëng danh hiÖu!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "Ta muèn ®æi phÇn th­ëng danh dù/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "Ta muèn mua phÇn th­ëng uy danh/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "Ta chØ tiÖn ghĞ qua/OnCancel"
	wlls_descript(str, tb_option)
end

--ÁìÈ¡ÅÅÃû½±Àø£¨¶Ô»°£©
function wlls_wantaward_rank()
	--¼ì²éÅÅÃû½±Àø	
	local nAward, nLevel, szLGName, nRank = wlls_checkaward_rank()
	if nAward then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[nLevel][nAward]
		local str = "<enter>  ChiÕn ®éi cña b¹n:<color=yellow>"..szLGName.."<color>Trong lÇn thi ®Êu "..str_des.." nµy ®­îc xÕp h¹ng <color=yellow>"..nRank.."<color>. Ng­¬i cã thÓ nhËn ®­îc ®iÓm vinh dù"..tb_award[2].."®iÓm."
		if (tb_award[3]) then	--ÓĞ¶Ó³¤¶îÍâ½±Àø
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.."®éi tr­ëng (S­ phô) nhËn thªm ®iÓm vinh dù"..tb_award[3].."®iÓm."
			end
		end
		str = str.."L·nh ngay b©y giê chø?"
		wlls_descript(str,
			"Ta muèn l·nh gi¶i th­ëng!/wlls_getaward_rank",
			"Ta sÏ quay l¹i sau!/OnCancel")
		return
	end
end

--¼ì²éÊÇ·ñ¿ÉÒÔÁìÈ¡ÅÅÃû½±Àø£¬·µ»Ø¿ÉÒÔÁìµÄÀàĞÍ£¬nilÎª²»¿ÉÁì
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--¸ÕºÃÔÚ¿çÈü¼¾µÄÊ±ºòÒªÁì½±
		if (not b_silent) then
			Msg2Player("HiÖn nay liªn ®Êu ®· tiÕn hµnh cuéc thi míi, kh«ng thÓ nhËn gi¶i th­ëng xÕp h¹ng liªn ®Êu lÇn tr­íc.")
		end
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local str_des = wlls_get_desc(1)
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_awardmin = wlls_get_award_min()
	local n_rank = 0
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > n_awardmin) then
		if (not b_silent) then
			wlls_descript("<enter>  LÇn nµy"..str_des.." <color=red>"..n_awardmin.."<color> hiÖn ®· xÕp h¹ng, h×nh nh­ chiÕn ®éi cña C¸c h¹ kh«ng cã trong ®©y!"..n_awardmin.."®Ó ta gióp kiÓm tra l¹i")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>  §õng t­ëng gia nhËp nhãm kh¸c lµ cã thÓ ®Õn gi¶ m¹o nhËn gi¶i th­ëng! Ta ch­a cã lÈm cÈm! Mïa thi ®Êu sau C¸c h¹  h·y quay l¹i!")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>  C¸c h¹ ®· l·nh th­ëng råi! §Şnh g¹t ta n÷a ­?")
		end
		return nil
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_award = WLLS_TAB[n_type].award_rank[n_level]
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award, n_level, str_lgname, n_rank
end

--ÁìÈ¡³ÆºÅ½±Àø
function wlls_wantaward_title()
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then
		Msg2Player("§· tiÕn hµnh cuéc thi ®Êu míi, kh«ng thÓ nhËn gi¶i th­ëng!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().."Gi¶i th­ëng nµy chØ tÆng"..wlls_get_desc(1).."trong, ng­êi xuÊt s¾c nhÊt (4 ®éi h¹ng ®Çu) . Ng­¬i kh«ng thuéc nhãm ®ã, ®õng ®Õn ®©y ph¸ rèi!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter>  §õng t­ëng gia nhËp nhãm kh¸c lµ cã thÓ ®Õn gi¶ m¹o nhËn gi¶i th­ëng! Ta ch­a cã lÈm cÈm! Mïa thi ®Êu sau C¸c h¹  h·y quay l¹i!")
		return nil
	end
	local n_title = WLLS_AWARD_TITLE[n_level] + n_rank - 1
	
	
	if (n_level == 2) then
		if WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)] then
			n_title = WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)][n_rank]
		end
	end
	
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	
	local nTime	= nMon * 1000000 + nDay * 10000	-- ³ÖĞøµ½ÏÂ½ìÁªÈü½áÊø
	_M("Title_AddTitle", n_title, nTime)
	
	--Remove hµo quang VLMC nÕu cã tr­íc khi add hµo quang míi - Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
		
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	
	
	SetTask(1122, n_title)	--µ±Ç°Íæ¼ÒÁìÈ¡µÄÊÇÄÄ¸öÍ·ÏÎID
	local tb = {"Qu¸n qu©n", "¸ ", "H¹ng 3", "H¹ng 4"}
	Msg2Player("Chóc mõng b¹n ®¹t ®­îc danh hiÖu <color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color>! Danh hiÖu nµy cã thÓ duy tr× trong <color=yellow>20<color> ngµy.")
end

--×îÖÕÁìÈ¡ÅÅĞĞ½±Àø
function wlls_getaward_rank()
	local n_award, n_level, str_lgname, nRank = wlls_checkaward_rank();
	if (n_award) then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[n_level][n_award]
		local n_got = GetGlbValue(GLB_WLLS_SID)
		n_got = SetByte(n_got, 4, n_type)
		n_got = SetByte(n_got, 3, n_level)
		n_got = SetByte(n_got, 2, n_award)
		SetTask(WLLS_TASKID_GOTAWARD, n_got)
		local nPoint	= tb_award[2]
		Msg2Player("Chóc mõng b¹n ®¹t ®­îc"..str_des.."PhÇn th­ëng xÕp h¹ng: ®iÓm vinh dù"..tb_award[2].."®iÓm")
		wlls_award_log(format("NhËn ®­îc phÇn th­ëng xÕp h¹ng %s: ®iÓm vinh dù %d ®iÓm",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--ÓĞ¶Ó³¤¶îÍâ½±Àø
			--¸ÃÅĞ¶ÏÖ»¶Ô¶Ó³¤²»ÄÜ×ªÒÆµÄÇé¿ö£¨Ê¦Í½Èü£©°²È«
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("Chóc mõng b¹n ®¹t ®­îc"..str_des.."PhÇn th­ëng xÕp h¹ng (®éi tr­ëng): ®iÓm vinh dù"..tb_award[3].."®iÓm")
				wlls_award_log(format("NhËn ®­îc phÇn th­ëng xÕp h¹ng %s (®éi tr­ëng): §iÓm vinh dù: %d ®iÓm",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("Tæng céng cã %d ®iÓm vinh dù", GetTask(WLLS_TASKID_HONOUR)))
		
		if (nRank == 1) then -- »ñµÃµÚÒ»Ãû ÈÙÓşÅÅĞĞ°ñ ÁªÈüÖµ¼Ó1
		    local nCurPoint = GetTask(2601);
		    nCurPoint = nCurPoint + 1;
		    SetTask(2601, nCurPoint);
		end

		SyncTaskValue(WLLS_TASKID_HONOUR)
	end
end

--¼ì²éÊÇ·ñ¿ÉÒÔ½¨Á¢Õ½¶Ó
function wlls_cancreate(n_level)
	local n_mylevel = wlls_player_level()
	--µÈ¼¶ÏŞÖÆ
	if (n_mylevel ~= n_level) then
		if (n_level == 1) then
			if (n_mylevel < n_level) then
				wlls_descript("<enter>  <color=red>Vâ l©m kiÖt xuÊt liªn ®Êu<color> tuy nãi lµ ®Ó chän ra nh÷ng hµo kiÖt ­u tó cña c¸c m«n ph¸i trong giang hå, nh­ng ®¼ng cÊp cña b¹n vÉn ch­a ®ñ!"..WLLS_LEVEL_JUNIOR.."cÊp, vâ nghÖ ch­a tinh, chØ sî ®ao kiÕm v« nh·n, lµm ng­¬i bŞ th­¬ng. Ng­¬i nªn tiÕp tôc luyÖn tËp!")
			else
				wlls_descript("<enter>  C¸c h¹ ®· lµ ®¹i hiÖp giang hå ®Ønh ®Ønh ®¹i danh, <color=red>liªn ®Êu Vâ l©m kiÖt xuÊt<color> lµ ®Ó chän ra nh÷ng tµi n¨ng trÎ, ng­¬i cÇn g× ph¶i ra oai víi ®¸m hËu bèi chø? Hay lµ ng­¬i tham gia <color=red>Vâ l©m liªn ®Êu<color> ®i!")
			end
		else
			wlls_descript("<enter>  <color=red>Vâ l©m liªn ®Êu<color> vÉn lµ n¬i Anh hïng thiªn h¹ luËn kiÕm, ®¼ng cÊp cña ng­¬i vÉn ch­a ®ñ!"..WLLS_LEVEL_SENIOR.."cÊp, anh hïng kh¾p n¬i tÒ tô, ngäa hæ tµng long, e r»ng ng­¬i chØ lµ kÎ hËu bèi! Tèt h¬n nªn luyÖn tËp thªm!")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter>  C¸c h¹ ®· vµo nhãm råi, kh«ng thÓ thµnh lËp nhãm kh¸c!")
		return nil
	end
	return wlls_player_type()
end

--ÎÒµÄÕ½¶Ó
function wlls_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local n_type

	if (FALSE(n_lid)) then
		n_type = GetGlbValue(GLB_WLLS_NEXT)
	else
		n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)		
	end
	
	WLLS_TAB[n_type].npc_mylg()
end

function wlls_want2create()
	local n_level = wlls_getcityinfo()
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	if (not wlls_cancreate(n_level)) then return end
	wlls_descript("<enter>"..WLLS_TAB[n_next].text_creat,
		"Ta muèn lËp nhãm!/wlls_inputstr_lgname",
		"§Ó ta xem l¹i/OnCancel")
end

--ÊäÈëÕ½¶ÓÃû
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "NhËp tªn nhãm muèn thµnh lËp")
end

--½¨Á¢Õ½¶Ó£¨×îÖÕ£©
function wlls_createleague(str_lgname)
	if (not str_lgname) then
		str_lgname = GetName()
	end
	local n_level = wlls_getcityinfo()
	local n_mtype = wlls_cancreate(n_level)
	if (not n_mtype) then return end
	str_lgname = strsub(str_lgname,1,16)
	local forbidstr={" ","\"","/","#","|","\t","\n"}
	local str
	for i = 1, getn(forbidstr) do
		if (not FALSE(strfind(str_lgname,forbidstr[i]))) then
			str = "Xin lçi! Nhãm cña b¹n kh«ng chøa ch÷ nµy:"
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [chôp h×nh]"
				elseif (forbidstr[i]=="\t") then
					str = str .. "[TAB]"
				elseif (forbidstr[i]=="\n") then
					str = str .. " [Enter]"
				else
					str = str .. forbidstr[i]
				end
			end
			break
		end
	end
	if (not str) then
		if (not FALSE(LG_GetLeagueObj(WLLS_LGTYPE, str_lgname))) then
			str = "Xin lçi! Tªn ®éi thi ®Êu nµy ®· cã ng­êi sö dông."
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "Xin lçi! Nhãm cña b¹n chøa tõ kh«ng ®óng."
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "HiÓu råi! Ta sÏ nhËp l¹i!/wlls_inputstr_lgname", "Kh«ng cÇn!/OnCancel")
		return
	end
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local szParam = GetName().." "..n_next.." "..n_mtype.." "..str_lgname
	LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, GetName(), "\\script\\leaguematch\\league.lua", "wlls_create", szParam , "", "")
	
	
	SetRespect(0)
end


--Ìí¼Ó³ÉÔ±£¨¶Ô»°£©
function wlls_want2addmember()
	local teammember, _, str_lgname = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local str = wlls_npcname().."B¹n muèn nh÷ng ng­êi d­íi ®©y"..getn(teammember).."gia nhËp nhãm cña b¹n ["..str_lgname.."] ph¶i kh«ng?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "§óng råi! §¨ng kı ®Ó anh Êy (c« Êy) gia nhËp ®éi thi ®Êu/wlls_sure2addmember","Kh«ng cÇn!/OnCancel")
end

--Ìí¼Ó³ÉÔ±£¨×îÖÕ£©
function wlls_sure2addmember()
	local teammember = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local str_lgname = LG_GetLeagueInfo(n_lid)
	for i = 1, getn(teammember) do
		local nPlayerIndex = SearchPlayer(teammember[i])
		if nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, SetRespect, 0)
			local szParam = teammember[i].." "..str_lgname.." "..GetName()
			LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, teammember[i], "\\script\\leaguematch\\league.lua", "wlls_add", szParam , "", "")
		end	
	end
end

--¼ì²é×é¶Ó¶ÓÔ±ÊÇ·ñ¿ÉÒÔ±»Ìí¼Óµ½µ±Ç°¶ÓÎéÖĞ£¬³É¹¦·µ»Ø×é¶Ó¶ÓÔ±Ãûµ¥¡¢Õ½¶ÓÀàĞÍ¡¢Õ½¶ÓÃû£¬·ñÔò·µ»Ønil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().."Xin lçi! B¹n cÇn ph¶i lµ <color=red> ®éi tr­ëng<color> trong <color=red>nhãm<color>, míi cã thÓ ®¨ng kı ®éi viªn gia nhËp chiÕn ®éi.",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().."Nhãm cña b¹n h×nh nh­ kh«ng cã thµnh viªn nhãm kh¸c? B¹n muèn cho ai vµo chiÕn ®éi cña m×nh?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."Xin lçi! B¹n ch­a lËp nhãm, kh«ng thÓ cho ng­êi kh¸c vµo nhãm!", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().."Xin lçi! B¹n kh«ng ph¶i lµ ®éi tr­ëng, kh«ng thÓ cho ng­êi kh¸c vµo chiÕn ®éi!", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().."Xin lçi! Lo¹i h×nh liªn ®Êu kú sau ®· thay ®æi, chiÕn ®éi cña b¹n hiÖn t¹i ®· qu¸ h¹n, kh«ng thÓ tiÕp tôc sö dông.", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().."Xin lçi! ChiÕn ®éi cña b¹n ["..str_lgname.."]®· ®ñ sè l­îng, kh«ng thÓ gia nhËp thªm ®éi viªn!",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().."Xin lçi! ChiÕn ®éi cña b¹n ["..str_lgname.."]chØ cÇn nhËp l¹i "..n_mcount.." ng­êi, kh«ng thÓ cho toµn bé thµnh viªn cña b¹n gia nhËp! Xin h·y cho thµnh viªn thõa t¹m thêi rêi khái nhãm!",0)
		return nil
	end

	local teammember = {}
	local str_capname = GetName()
	local n_capidx = PlayerIndex
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i)
		local membername = GetName()
		--±ÜÃâÖØ¸´¼ÓÈë¶ÓÔ±
		if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, membername))) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname().."Xin lçi! §éi viªn trong nhãm:"..membername.." ®· lµ thµnh viªn cña chiÕn ®éi kh¸c, cho nªn kh«ng thÓ vµo chiÕn ®éi cña b¹n!", 0)
		 	return nil
		end
		--¼ÓÈë¶ÓÔ±ÌØÊâ¼ì²é
		local str = wlls_check_addmem(n_capidx, n_lid, n_mtype)
		if (str) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname()..str, 0)
		 	return nil
		end
		teammember[i-1] = membername
	end
	PlayerIndex = n_capidx
	return teammember, n_mtype, str_lgname
end

--Àë¿ªÕ½¶Ó£¨¶Ô»°£©
function wlls_want2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB)
	local str = wlls_npcname().."Ng­¬i muèn rêi khái chiÕn ®éi ["..str_lgname.."]ph¶i kh«ng?"
	if(n_memcount <= 1) then
		str = str .. "B¹n hiÖn lµ <color=red>thµnh viªn duy nhÊt<color> cña chiÕn ®éi cña b¹n. NÕu nh­ b¹n rêi khái chiÕn ®éi, chiÕn ®éi sÏ bŞ gi¶i t¸n."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--Ê¦Í½Èü
			str = str .. "HiÖn t¹i b¹n lµ <color=red>®éi tr­ëng (s­ phô)<color> cña chiÕn ®éi, nÕu b¹n rêi khái chiÕn ®éi, ®å ®Ö cña b¹n sÏ <color=red>kh«ng ®­îc tham gia thi ®Êu<color>."
		else	--ÆäËûÁªÈü
			str = str .. "B¹n hiÖn lµ <color=red>§éi tr­ëng<color>, nÕu nh­ b¹n rêi khái nhãm, chøc §éi tr­ëng sÏ ®­îc chuyÓn cho thµnh viªn kh¸c."
		end
	end
	Say(str, 2, "§óng vËy!/wlls_sure2leaveleague","Kh«ng cÇn!/OnCancel")
end

--Àë¿ªÕ½¶Ó£¨È·ÈÏ¶Ô»°£©
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().."Sau khi b¹n rêi khái nhãm, sÏ <color=yellow>kh«ng thÓ l·nh gi¶i th­ëng cña chiÕn ®éi<color>, b¹n x¸c nhËn muèn rêi khái nhãm?", 2, "§óng vËy!/wlls_leaveleague_final","Kh«ng cÇn!/OnCancel")
end

--Àë¿ªÕ½¶Ó£¨×îÖÕ£©
function wlls_leaveleague_final()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	LG_ApplyDoScript(WLLS_LGTYPE, "", GetName(), "\\script\\leaguematch\\league.lua", "wlls_leave", GetName() , "", "")
end

--½øÈë»á³¡£¨¶Ô»°£©
function wlls_want2signmap()
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	
	if (n_matchphase < 2) then
		Say(wlls_npcname().."Hiªn t¹i lµ thêi gian liªn ®Êu t¹m nghØ, héi tr­êng sÏ t¹m ®ãng cöa, b¹n h·y chê ®Õn kú thi ®Êu h·y quay l¹i!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("B¹n ch­a "..str_des.."chiÕn ®éi, nÕu tham gia thi ®Êu, hÖ thèng sÏ lËp cho b¹n 1 chiÕn ®éi. B¹n cã muèn lËp 1 chiÕn ®éi kh«ng?", "Ta muèn lËp chiÕn ®éi!/#wlls_createleague()", "Ta kh«ng muèn thi ®Êu!/OnCancel")
		else
			wlls_descript("<enter>  LÇn nµy"..str_des.." ch­a thÊy b¸o danh chiÕn ®éi cña b¹n, cã nhÇm lÉn g× kh«ng? Quy ®Şnh cña Vâ l©m minh chñ nghiªm ngÆt, ta muèn gióp ng­¬i còng kh«ng ®­îc. §¹i hiÖp h·y ®i x¸c nhËn l¹i, råi h·y ®Õn t×m ta!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--¼ÇÂ¼Èë³¡µØµã
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--´«ËÍµ½±¨ÃûµãµØÍ¼
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("B¹n ®· ®Õn<color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color>khu vùc thi ®Êu")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--¼ì²éÊÇ·ñ¿ÉÒÔÀë¿ªÕ½¶Ó¡£¿ÉÒÔ·µ»Øn_lid£¬·ñÔò·µ»Ønil,Ô­Òò×Ö·û´®
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "B¹n vÉn ch­a vµo chiÕn ®éi!"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "Do chiÕn ®éi cña b¹n ®ang thi ®Êu, b¹n kh«ng thÓ rêi khái chiÕn ®éi, h·y chê ®Õn lóc thi ®Êu xong h·y quay l¹i!"
	end
	
	if(n_phase > 3) then
		return nil, "§ang trong thi ®Êu, kh«ng thÓ rêi khái chiÕn ®éi, xin ®îi sau trËn ®Êu lóc thêi gian nghØ ng¬i míi rêi khái chiÕn ®éi."
	end
	
	return n_lid
end

--È¡µÃµ±Ç°±ÈÈüÅÅÃû½±ÀøÖÁÉÙĞèÒª¶àÉÙÃû
function wlls_get_award_min()
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_level = wlls_getcityinfo()
	local tb = WLLS_TAB[n_type].award_rank[n_level]
	return tb[getn(tb)][1]
end

--¾­ÑéÁìÈ¡¿ª¹Ø
function wlls_show_expswitch()
	local b_exps = GetBit(GetTask(WLLS_TASKID_SWITCH), 1)
	local str = "<enter>   PhÇn th­ëng vâ l©m liªn ®Êu lÇn nµy phong phó l¾m! NÕu c¸c ng­¬i kh«ng muèn sö dông ngay ®iÓm kinh nghiÖm th× ë chç ta cã thiÕt lËp nót ®ãng, më ®iÓm kinh nghiÖm, ng­¬i cã thÓ khãa phÇn th­ëng ®iÓm kinh nghiÖm cña m×nh.<enter>"
	str = str.."<enter>   Tr¹ng th¸i ®ãng/më hiÖn t¹i cña b¹n lµ:"..iif(b_exps == 0, "<color=red>më<color> (cã thÓ nhËn phÇn th­ëng kinh nghiÖm) ", "<color=red>®ãng<color> (kh«ng thÓ nhËn phÇn th­ëng kinh nghiÖm) ")..""
	wlls_descript(str, iif(b_exps == 0, "Ta muèn ®ãng phÇn th­ëng/#wlls_set_expswitch(1)", "Ta muèn më phÇn th­ëng/#wlls_set_expswitch(0)"), "§­îc th«i! Ta ®· thiÕt lËp xong råi!/OnCancel")
end

--ÉèÖÃ¾­ÑéÁìÈ¡¿ª¹Ø
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "Thµnh c«ng"..iif(b_exps == 0, "më ", "§ãng").."phÇn th­ëng kinh nghiÖm liªn ®Êu!")
end

--ÓÃÈÙÓş»»È¡ÉÌÆ·
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end

	Msg2Player("b¹n hiÖn ®ang cã <color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> ®iÓm vinh dù")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- ÉÌµêµÄÈÙÓş»ı·Ö±àºÅÎª11
	else
		Say(wlls_npcname().."Xin më khãa r­¬ng tr­íc råi h·y mua! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "HiÖn t¹i ®¹i hiÖp cã ®iÓm uy danh lµ <color=yellow>"..GetRespect().."<color>")
end

--ÓÃÈÙÓş»»È¡ÉÌÆ·
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end
	--Bá giíi h¹n thêi gian b¸n ®¹o cô trong shop danh väng - Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "HiÖn t¹i kh«ng thÓ mua ®¹o cô danh väng")
--		return 
--	end
	
	
	Msg2Player("HiÖn t¹i ®¹i hiÖp cã ®iÓm uy danh lµ <color=yellow>"..GetRespect().."<color>")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- ÉÌµêµÄÈÙÓş»ı·Ö±àºÅÎª11
	else
		Say(wlls_npcname().."Xin më khãa r­¬ng tr­íc råi h·y mua! ", 0)
	end
end