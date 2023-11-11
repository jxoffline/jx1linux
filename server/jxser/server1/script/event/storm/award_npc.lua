Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êı

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--Ãû´ÎµÄÎÄ×ÖÃèÊö
TB_STORM_LADDERNAME = {"Qu¸n qu©n", "¸ qu©n", "H¹ng 3", " H¹ng 4", " H¹ng 5",
	"H¹ng 6", " H¹ng 7", " H¹ng 8", " H¹ng 9", " H¹ng 10", "kh«ng cã trong b¶ng xÕp h¹ng", "Kh«ng cã xÕp h¹ng"}

--ÎäÁÖÃË´«ÈË	
STORM_WLMCR = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>Vâ l©m truyÒn nh©n<link>"

--¼ì²éÖ¸¶¨µÄawardtype
--awardid == nil	·µ»Ø£º»ı·Ö+/-ÅÅĞĞ	¿ÉÒÔÁìÈ¡µÄËùÓĞ½±Àø
--awardid > 0		·µ»Ø£ºnil²»¿ÉÒÔÁìÈ¡	·ñÔò·µ»Ø»ı·Ö+/-ÅÅĞĞ
function storm_checkaward(awardtype, awardid)
	storm_anotherday()
	
	if (awardtype == nil or TB_STORM_AWARD[awardtype] == nil) then
		return nil
	end
	
	if (GetTask(TB_STORM_AWARD[awardtype][3]) > 0) then
		Say("Xin lçi! "..TB_STORM_AWARD[awardtype][1].."phÇn th­ëng cña ng­¬i ®· nhËn qua råi!", 0)
		return nil
	end
	
	local awardvalue = 0
	if (TB_STORM_AWARD[awardtype][2] == 1) then
		awardvalue = -storm_getrank(awardtype)	--ÓÃ¸ºÊı×÷±È½Ï¸ü·½±ã
	else
		awardvalue = GetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if (awardid == nil) then
		local tb_award = {}
		local awardlevel = awardvalue
		for i = 1, getn(TB_STORM_AWARD[awardtype][5]) do
			if (awardvalue >= TB_STORM_AWARD[awardtype][5][i][1]) then
				if (awardlevel == TB_STORM_AWARD[awardtype][5][i][1] or getn(tb_award) == 0) then	--²»ÄÜÁìµÍ¼¶½±Àø
					awardlevel = TB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1] = i
				end
			end
		end
		return awardvalue, tb_award
	else
		if (awardvalue < TB_STORM_AWARD[awardtype][5][awardid][1]) then
			Say("Vâ l©m truyÒn nh©n: H×nh nh­ ng­¬i kh«ng thÓ nhËn phÇn th­ëng nµy!", 0)
			return nil
		else
			return awardvalue
		end
	end
end

--Ö÷¶Ô»°
function storm_main()
	if (GetTask(STORM_TASKID_LETTER) ~= 2) then
		Describe(STORM_WLMCR.."<#> KiÕp giang hå lÊy s«ng nói lµ nhµ! NgÈng mÆt nh×n tr¨ng, cuèi ®Çu mh×n n­íc! Chît nghÜ ®Õn c©u th¬: Vİ thö ®­êng ®êi b»ng ph¼ng m·i, anh hïng hµo kiÖt cã h¬n ai!", 1, "B¾t ®Çu ho¹t ®éng Phong ba th¸ng 9/storm_main")
		Msg2Player("B¹n nhËn ®­îc b¶n th¶o thÇn bİ cña ThÈm ThiÖu ViÔn")
		AddItem(6, 1, 898, 1, 0 ,0)
		SetTask(STORM_TASKID_LETTER, 2)
	else
		local tb_option = {}
		tb_option[getn(tb_option)+1] = "Ta muèn l·nh phÇn th­ëng h«m nay/#storm_award(1)"
		if (GetTask(STORM_TASKID_DAY_LASTAWARD) == 0) then
			tb_option[getn(tb_option)+1] = "Ta muèn l·nh phÇn th­ëng h«m qua/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1] = "Ta muèn l·nh phÇn th­ëng tuÇn tr­íc/#storm_award(2)"
		tb_option[getn(tb_option)+1] = "Ta muèn l·nh phÇn th­ëng th¸ng tr­íc/#storm_award(3)"
		tb_option[getn(tb_option)+1] = "T×m hiÓu ®iÓm tİch lòy cña ta/#storm_query(0)"
		tb_option[getn(tb_option)+1] = "T×m hiÓu ho¹t ®éng Phong Ba/storm_help"
		tb_option[getn(tb_option)+1] = "Kh«ng cÇn!/OnCancel"
		Describe(STORM_WLMCR.."<#> Xin xem th«ng tin chi tiÕt ho¹t ®éng trªn trang chñ ", getn(tb_option), tb_option)
	end
	storm_anotherday()
end

--ÁìÈ¡½±Àø£¨²é¿´½±Àø£©
function storm_award(awardtype)
	local awardvalue, tb_award = storm_checkaward(awardtype)
	if (awardvalue == nil) then
		return
	end
	
	local str = ""
	if (awardvalue >= 0) then
		str = "B¹n "..TB_STORM_AWARD[awardtype][1].."tİch lòy Phong Ba lµ:"..storm_point2str(awardvalue)
	elseif (awardvalue == -12) then
		str = TB_STORM_AWARD[awardtype][1].."kh«ng cã trong b¶ng xÕp h¹ng"
	elseif (awardvalue == -11) then
		str = "B¹n "..TB_STORM_AWARD[awardtype][1].."kh«ng cã trong b¶ng xÕp h¹ng"
	elseif (awardvalue >= -3) then
		str = "B¹n "..TB_STORM_AWARD[awardtype][1].."trong ho¹t ®éng Phong ba th¸ng 9"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str = "B¹n "..TB_STORM_AWARD[awardtype][1].."trong ho¹t ®éng Phong ba th¸ng 9 xÕp thø "..storm_point2str(-awardvalue).."danh "
	end
	
	local awardcount = getn(tb_award)
	if (awardcount > 0) then
		local tb_option = {}
		if (awardcount == 1) then
			str = str..", Ng­¬i cã thÓ nhËn phÇn th­ëng: <enter>"
			str = str.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str = str.."<enter>, nhËn b©y giê chø?"
			Say("Vâ l©m truyÒn nh©n:"..str, 2, "Ta muèn nhËn phÇn th­ëng/#storm_getaward("..awardtype..","..tb_award[1]..",0)", "§Ó ta suy nghÜ l¹i/OnCancel")
		else
			str = str..", ng­¬i cã thÓ lùa chän 1 trong nh÷ng phÇn th­ëng sau ®©y: <enter>"
			for i = 1, getn(tb_award) do
				if (i >= 2) then
					str = str.."hoÆc   "
				end
				local awardname = TB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str = str.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1] = "l·nh"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str = str.."<enter> QuyÕt ®Şnh xong ch­a?"
			tb_option[getn(tb_option)+1] = "Kh«ng cÇn!/OnCancel"
			Say("Vâ l©m truyÒn nh©n:"..str, getn(tb_option), tb_option)
		end
	else
		Say("Vâ l©m truyÒn nh©n:"..str..", ng­¬i kh«ng thÓ nhËn quµ th­ëng", 0)
		return
	end
end

--ÁìÈ¡Ö¸¶¨½±Æ·
function storm_getaward(awardtype, awardid, sure)
	local awardvalue = storm_checkaward(awardtype, awardid)
	if (not storm_checkaward(awardtype, awardid)) then
		return
	end

	if (sure == 1) then
		Say("Tr­íc khi l·nh th­ëng cÇn s¾p xÕp l¹i  hµnh trang!", 2, "Ta ®· s½n sµng!/#storm_getaward("..awardtype..","..awardid..",2)", "Ta cßn ph¶i s¾p xÕp l¹i hµnh trang/OnCancel")
	elseif (sure == 2) then
		if (CalcFreeItemCellCount() < storm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])) then
			Say("Hµnh trang cña ng­¬i kh«ng cßn chç trèng, s¾p xÕp gän l¹i ®i!", 0)
		else
			if (awardtype == 1 or awardtype == 4) then
				local mapid = tostring(SubWorldIdx2ID(SubWorld))
				local plcount = GetGlbValue(46) + 1
				SetGlbValue(46, plcount)
				Ladder_NewLadder(10195, mapid, plcount, 1)
			end
			local str = "NhËn ®­îc"..TB_STORM_AWARD[awardtype][1].."PhÇn th­ëng tİch lòy Phong Ba "..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3], 1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if (awardvalue >= 0) then
				str = awardvalue.."®iÓm tİch lòy Phong Ba"
			else
				str = "XÕp h¹ng thø "..(-awardvalue).."danh "
			end
			if (awardtype == 2 or awardtype == 3 or awardid <= 2) then	--´ó½±·¢²¼¹«¸æ
				AddGlobalNews(GetName().."T¹i"..TB_STORM_AWARD[awardtype][1].."trong ho¹t ®éng Phong Ba nhËn ®­îc"..str..", nhËn ®­îc phÇn th­ëng"..TB_STORM_AWARD[awardtype][5][awardid][2].." ")
			end
		end
	else
		Say("Ng­¬i x¸c ®Şnh nhËn <color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color> ph¶i kh«ng? Sau khi nhËn xong kh«ng ®­îc nhËn "..TB_STORM_AWARD[awardtype][1].."phÇn th­ëng kh¸c n÷a!", 2, "Ta biÕt råi! Ta chØ nhËn vËt phÈm nµy th«i/#storm_getaward("..awardtype..","..awardid..",1)", "Kh«ng cÇn!/OnCancel")
	end
end

--²éÑ¯¸öÈË·ç±©»ı·ÖÇé¿ö
function storm_query(querytype)
	storm_anotherday()
	
	local str = ""
	local tb_sheet = {}
	local var_width, var_align
	if (querytype == 1) then
		if (GetTask(STORM_TASKID_DAY) <= STORM_END_DAY) then
			str = "Tİch lòy Phong Ba h«m nay cña b¹n nh­ sau: <enter>%sTæng ®iÓm tİch lòy h«m nay:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width = {12,8,8,10}
			var_align = 2
			tb_sheet[getn(tb_sheet)+1] = {"Tªn ho¹t ®éng", "Sè lÇn", "Tr¹ng th¸i ", "§iÓm tİch lòy cao nhÊt"}
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local trycount = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local state = ""
					if storm_valid_game(i) then
						state = "<color=red>§ang tiÕn hµnh<color>"
					elseif (trycount <= 0) then
						state = "<color=blue>Ch­a tiÕn hµnh<color>"
					elseif (trycount < TB_STORM_TRYTIMES[i]) then
						state = "<color=green>§· tiÕn hµnh<color>"
					else
						state = "<color=8947848>§· kÕt thóc<color>"
					end
					tb_sheet[getn(tb_sheet)+1] = {
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str = "ho¹t ®éng <color=red>Phong ba th¸ng 9<color> ®· kÕt thóc!"
		end
	elseif (querytype == 2) then
		str = "§iÓm tİch lòy Phong Ba gÇn ®©y cña b¹n lµ: <enter>%s"
		var_width = {8,10,6,8,10}
		var_align = 2
		tb_sheet[getn(tb_sheet)+1] = {
			"§iÓm tİch lòy h«m nay", storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), "",
			"§iÓm tİch lòy h«m qua", storm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"§iÓm tİch lòy tuÇn nµy", storm_point2str(GetTask(STORM_TASKID_WEEK_POINT)), "",
			"§iÓm tİch lòy tuÇn tr­íc", storm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"§iÓm tİch lòy th¸ng nµy", storm_point2str(GetTask(STORM_TASKID_MONTH_POINT)), "",
			"§iÓm tİch lòy th¸ng tr­íc", storm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"XÕp h¹ng tuÇn tr­íc", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>", "",
			"XÕp h¹ng th¸ng tr­íc", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("Ng­¬i muèn t×m hiÓu vÊn ®Ò g×?", 3, "§iÓm tİch lòy Phong Ba cña ta h«m nay/#storm_query(1)", "§iÓm tİch lòy Phong Ba gÇn ®©y cña ta/#storm_query(2)", "Kh«ng cã chuyÖn g× ®©u!/OnCancel")
		return
	end
	str = format(str, maketable(tb_sheet, var_width, var_align))
	Say(str, 2, "TiÕp tôc t×m hiÓu/#storm_query(0)", "Kh«ng cã g×, c¸m ¬n!/OnCancel")
end

--»î¶¯ËµÃ÷¡ª¡ª×Ü
function storm_help()
	local tb_option = {}
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			tb_option[getn(tb_option)+1] = "Liªn quan ho¹t ®éng Phong Ba-"..TB_STORM_DESCRIBE[i].."gióp ®ì/#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "Liªn quan phÇn th­ëng ho¹t ®éng Phong Ba/#storm_help_award(0)"
	tb_option[getn(tb_option)+1] = "Ta biÕt råi!/OnCancel"
	Say("  Ho¹t ®éng Phong Ba ®­îc më vµo ngµy 8/9/-2/10, bao gåm chiÕn tr­êng Tèng Kim, chuçi nhiÖm vô D· TÈu, nhiÖm vô s¸t thñ thö luyÖn. Mçi ngµy sÏ dùa theo thµnh tİch ë tõng hÖ thèng ®Ó cã ®iÓm <color=yellow>tİch lòy Phong Ba<color> (§iÒu kiÖn tham gia: Ng­êi ch¬i cÊp 50 trë lªn) . §iÓm tİch lòy mçi ngµy sau <color=red>24:00 sÏ bŞ xãa<color>, xin tr­íc 24:00 ®Õn l·nh th­ëng.<enter>. Mçi ngµy <color=red>23:30<color> b¾t ®Çu chiÕn tr­êng Tèng Kim, thµnh tİch ®ã kh«ng ®­îc tİnh vµo tİch lòy Phong Ba.", getn(tb_option), tb_option)
end

--»î¶¯ËµÃ÷¡ª¡ªÌôÕ½
function storm_help_game(gameid)
	local str = TB_STORM_HELP[gameid]
	if (gameid == 1) then	--ËÎ½ğĞèÒª²¹³äËµÃ÷·ÖÊıÉÏÏŞ
		str = format(str, "ChiÕn tr­êng Tèng Kim cao cÊp, mçi ng­êi mçi ngµy chØ nhËn ®­îc ®iÓm tİch lòy Phong Ba tèi ®a lµ <color=yellow>100<color> ®iÓm. ChiÕn tr­êng Tèng Kim s¬, trung cÊp ph©n biÖt tèi ®a nhËn ®­îc <color=yellow>80<color>, <color=yellow>90<color> ®iÓm.")
	end
	Say(str, 2, "Muèn t×m hiÓu nh÷ng thø kh¸c/storm_help", "Ta ®· biÕt råi!/OnCancel")
end

--»î¶¯ËµÃ÷¡ª¡ª½±Àø
function storm_help_award(awardtype,start)
	if (awardtype == 0) then
		Say("  Mçi ngµy ng­êi ch¬i cã thÓ ®Õn chç Vâ l©m truyÒn nh©n, c¨n cø <color=red>tİch lòy Phong Ba<color> sÏ nhËn ®­îc phÇn th­ëng t­¬ng øng. §ång thêi, mçi tuÇn, mçi th¸ng ®Òu cã b¶ng xÕp h¹ng tİch lòy Phong Ba t­¬ng øng, ng­êi ch¬i ®­îc <color=red>xÕph¹ng Top 10<color> cã thÓ tuÇn thø hai trong th¸ng ®Õn Vâ L©m truyÒn nh©n nhËn phÇn th­ëng", 4,
			"Xem phÇn th­ëng ngµy/#storm_help_award(1)",
			"Xem phÇn th­ëng tuÇn/#storm_help_award(2)",
			"Xem phÇn th­ëng th¸ng/#storm_help_award(3)",
			"Ta ®· biÕt råi!/OnCancel")
		return
	end
	
	local tb_awardstr = {"nhËt ", "TuÇn", "nguyÖt "}
	local str = "Tİch lòy Phong Ba"..tb_awardstr[awardtype].."PhÇn th­ëng nh­ sau:"
	if (not start) then
		start = 1
	end
	local lastvalue = nil
	local count = 0
	local PERPAGE = 4
	for i = start, getn(TB_STORM_AWARD[awardtype][5]) do
		if (count > PERPAGE) then	--PERPAGEÏîÒ»Ò³
			break
		end
		count = count + 1
		
		local awardvalue = TB_STORM_AWARD[awardtype][5][i][1]
		if (lastvalue ~= awardvalue) then
			if (awardvalue >= 0) then
				str = str.."<enter>".."Tİch lòy"..storm_point2str(awardvalue,3).."phót"
			else
				if (lastvalue) then
					str = str.."<enter>"..tb_awardstr[awardtype].."XÕp h¹ng thø "..storm_point2str(1-lastvalue).."®Õn"..storm_point2str(-awardvalue).."mÊy"
				else
					str = str.."<enter>"..tb_awardstr[awardtype].."XÕp h¹ng thø "..storm_point2str(-awardvalue).."mÊy"
				end
			end
			lastvalue = awardvalue
		else
			str = str.."hoÆc   "
		end
		str = str.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local tb_option = {}
	if (start > 1) then
		tb_option[getn(tb_option)+1] = "Trang tr­íc/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if (start + count < getn(TB_STORM_AWARD[awardtype][5])) then
		tb_option[getn(tb_option)+1] = "Trang kÕ /#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1] = "Muèn t×m hiÓu nh÷ng thø kh¸c/storm_help"
	tb_option[getn(tb_option)+1] = "Ta ®· biÕt råi!/OnCancel"
	Say(str, getn(tb_option), tb_option)
end

--µÃµ½¸ÃÍæ¼ÒÔÚÖ¸¶¨ÅÅĞĞÖĞµÄÃû´Î
function storm_getrank(laddertype)
	local ladderid = nil
	if (laddertype == 1) then	--ÈÕÅÅĞĞ£¬ÔİÎŞ
		return 12
	elseif (laddertype == 2) then	--ÖÜÅÅĞĞ
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 1 and weekid <= 4) then 	--Ö»ÓĞ2¡¢3¡¢4¡¢5ÖÜÓĞÉÏÖÜ
			ladderid = STORM_LADDERID_WEEK1 + weekid - 1
		end
	elseif (laddertype == 3) then	--ÔÂÅÅĞĞ
		if (GetTask(STORM_TASKID_MONTH) == 10) then	--Ö»ÓĞ10ÔÂÓĞÉÏÖÜ
			ladderid = STORM_LADDERID_MONTH
		end
	else
		return 12
	end
	
	if (ladderid == nil) then
		return 12
	end
	
	local playername = GetName()
	for i = 1, 10 do
		if (playername == Ladder_GetLadderInfo(ladderid, i)) then
			return i
		end
	end
	return 11
end

--¿ÉÉı¼¶µÄ¼Ó¾­Ñé
function storm_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end

--¸øÓëÈ«²¿½±Àø
function storm_giveallaward(tb_awards)
	for i = 1, getn(tb_awards) do
		storm_giveoneaward(tb_awards[i])
	end
end

--¸øÓëÒ»¸ö½±Àø
function storm_giveoneaward(tb_award)
	local awardtype = tb_award[1]
	local awardcount = tb_award[3]
	if (awardtype == 1) then	--ÆÕÍ¨ÎïÆ·
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 2) then	--»Æ½ğÎïÆ·
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 3) then	--·ÇÎïÆ·
		if (tb_award[2] == 1) then	--¾­Ñé
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--Áô×÷À©Õ¹
			WriteLog("storm_giveoneaward : error tb_award[2]")
		end
	elseif (awardtype == 4) then	--Ëæ»úÎïÆ·
		while (awardcount > 0) do
			local giveindex = random(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount = awardcount - 1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward : error awardtype")
	end
end

--¹ÀËãÈ«²¿½±ÀøÎïÆ·ÊıÁ¿
function storm_countallaward(tb_awards)
	local count = 0
	for i = 1, getn(tb_awards) do
		if (tb_awards[i][1] == 1) then	--ÆÕÍ¨ÎïÆ·
			count = count + tb_awards[i][3]
		elseif (tb_awards[i][1] == 2) then	--»Æ½ğÎïÆ·
			count = count + tb_awards[i][3]*2
		elseif (tb_awards[i][1] == 4) then	--Ëæ»úÎïÆ·
			count = count + tb_awards[i][3]*2
		end
	end
	return count
end

--½«Êı×é²ğ¿ª
function storm_splittb(tb, n)
	if (n == nil) then
		n = 1
	end
	if (n == getn(tb)) then
		return tb[n]
	end
	return tb[n], storm_splittb(tb,n+1)
end
