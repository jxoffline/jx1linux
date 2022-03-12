-- ¼¼ÄÜ
IncludeLib("SETTING");
Include("\\script\\global\\login_head.lua")
-- ItemParticular={MagicID,IniLevel, NeedFaction, BookName, SkillName}
local faction_skill_list = {
	[0] = {[90] = {318, 319, 321}, [120] = {709}, [150] = {1055, 1056, 1057},},
	[1] = {[90] = {322, 325, 323}, [120] = {708}, [150] = {1058, 1059, 1060},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710}, [150] = {1069, 1070, 1071, 1110},},
	[3] = {[90] = {353, 355, 390}, [120] = {711}, [150] = {1066, 1067},},
	[4] = {[90] = {380, 328, 332}, [120] = {712}, [150] = {1061, 1062, 1114},},
	[5] = {[90] = {336, 337}, [120] = {713}, [150] = {1063, 1065},},
	[6] = {[90] = {357, 359}, [120] = {714}, [150] = {1073, 1074}},
	[7] = {[90] = {361, 362, 391}, [120] = {715}, [150] = {1075, 1076},},
	[8] = {[90] = {365, 368}, [120] = {716}, [150] = {1078, 1079},},
	[9] = {[90] = {372, 375, 394}, [120] = {717}, [150] = {1080, 1081},},
}

sbook_list =
{	-- ¸ñÊ½£º{¼¼ÄÜID, ¼¼ÄÜµÈ¼¶, °ïÅÉID, ËùÐè¼¶±ð, ¼¼ÄÜÊéÃû³Æ, ¼¼ÄÜÃû³Æ}
	[27] = {302, 1, 2, 80, "'Tô TiÔn thuËt. B¹o Vò Lª Hoa' ",	"B¹o Vò Lª Hoa"},
	[28] = {351, 0, 2, 80, "'H·m TÜnh thuËt. Lo¹n Hoµn KÝch' ",	"Lo¹n Hoµn KÝch"},
	[33] = {365, 1, 8, 80, "Th¸i Cùc QuyÒn Phæ- QuyÓn 3 ",	"Thiªn §Þa V« Cùc "},
	[34] = {368, 1, 8, 80, "'Th¸i Cùc KiÕm Phæ. QuyÓn 2' ",	"Nh©n KiÕm Hîp NhÊt  "},
	[35] = {361, 1, 7, 80, "'V©n Long KÝch. M©u ph¸p' ",		"V©n Long KÝch"},
	[36] = {362, 1, 7, 80, "'L­u Tinh. §ao ph¸p' ",		"Thiªn Ngo¹i L­u Tinh"},
	[37] = {325, 1, 1, 80, "'Thiªn V­¬ng Chïy Ph¸p. QuyÓn 1' ",	"Truy Phong QuyÕt "},
	[38] = {323, 1, 1, 80, "Thiªn V­¬ng Th­¬ng ph¸p- QuyÓn 2 ", 	"Truy Tinh Trôc NguyÖt "},
	[39] = {322, 1, 1, 80, "Thiªn V­¬ng §ao ph¸p - QuyÓn 3 ",	"Ph¸ Thiªn Tr¶m "},
	[40] = {336, 1, 5, 80, "'Thóy Yªn §ao ph¸p' ",			"B¨ng Tung V« ¶nh "},
	[41] = {337, 1, 5, 80, "'Thóy Yªn Song ®ao' ",			"B¨ng T©m Tiªn Tö  "},
	[42] = {328, 1, 4, 80, "'DiÖt KiÕm MËt TÞch' ",			"Tam Nga TÒ TuyÕt "},
	[43] = {380, 1, 4, 80, "'Nga Mi PhËt Quang Ch­ëng MËt TÞch' ",	"Phong S­¬ng To¸i ¶nh "},
	[45] = {339, 1, 2, 80, "'Phi §ao thuËt. NhiÕp Hån NguyÖt ¶nh' ",	"NhiÕp Hån NguyÖt ¶nh"},
	[46] = {342, 1, 2, 80, "'Phi Tiªu thuËt. Cöu Cung Phi Tinh' ",	"Cöu Cung Phi Tinh"},
	[47] = {353, 1, 3, 80, "'Ngò §éc Ch­ëng Ph¸p. QuyÓn 1' ",	"¢m Phong Thùc Cèt "},
	[48] = {355, 1, 3, 80, "'Ngò §éc §ao ph¸p. QuyÓn 2' ",	"HuyÒn ¢m Tr¶m "},
	[49] = {390, 0, 3, 80, "'Ngò §éc NhiÕp T©m thuËt. QuyÓn 3' ",	"§o¹n C©n Hñ Cèt "},
	[50] = {372, 1, 9, 80, "'Ngù Phong thuËt' ",			"Ng¹o TuyÕt Tiªu Phong "},
	[51] = {375, 1, 9, 80, "'Ngù L«i thuËt' ",			"L«i ®éng Cöu Thiªn "},
	[52] = {394, 0, 9, 80, "'Ngù T©m thuËt' ",			"Tóy Tiªn T¸ Cèt"},
	[53] = {391, 0, 7, 80, "NhiÕp Hån - Tr­íc Chó ",		"NhiÕp Hån Lo¹n T©m "},
	[54] = {357, 1, 6, 80, "'C¸i Bang Ch­ëng Ph¸p' ",			"Phi Long T¹i Thiªn "},
	[55] = {359, 1, 6, 80, "C¸i Bang C«n Ph¸p ",			"Thiªn H¹ V« CÈu "},
	[56] = {318, 1, 0, 80, "'ThiÕu L©m QuyÒn Ph¸p. QuyÓn 1' ",	"§¹t Ma §é Giang"},
	[57] = {319, 1, 0, 80, "'ThiÕu L©m C«n ph¸p. QuyÓn 2' ",	"Hoµnh T¶o Thiªn Qu©n"},
	[58] = {321, 1, 0, 80, "'ThiÕu L©m §ao ph¸p. QuyÓn 3' ",	"V« T­íng Tr¶m "},
	[59] = {332, 0, 4, 80, "'Phæ §é MËt TÞch' ",			"Phæ §é Chóng Sinh "},
}

function CheckIsCanGet150SkillTask()
		--Më nhiÖm vô nhËn kü n¨ng 150 - Modified By NgaVN - 20121207
	local nValue = GetTask(2885)
	if nValue > 0 then
		return
	end
	--ChØnh söa nhËn nv kü n¨ng 150 ph¶i trïng sinh 2 trë lªn - Modified By NgaVN - 20121207
	local nTransLife = ST_GetTransLifeCount()
	local nHaveTSFlag = 0;
	if(nTransLife > 1 ) then
		nHaveTSFlag = 1
	end
	
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or  nFact > 9 then
		return
	end
	local tb90Skill = %faction_skill_list[nFact][90]
	local nHave90SkillFlag = 0
	for i = 1, getn(tb90Skill) do
		if HaveMagic(tb90Skill[i]) >= 0 then
			nHave90SkillFlag = 1 
			break
		end
	end
	local tb120Skill = %faction_skill_list[nFact][120]
	local nHave120SkillFlag = 0
	for i = 1, getn(tb120Skill) do
		if HaveMagic(tb120Skill[i]) >= 0 then
			nHave120SkillFlag = 1 
			break
		end
	end
	local tb150Skill = %faction_skill_list[nFact][150]
	local nHave150SkillFlag = 0
	for i = 1, getn(tb150Skill) do
		if HaveMagic(tb150Skill[i]) >= 0 then
			nHave150SkillFlag = 1 
			break
		end
	end 
	if nHave150SkillFlag == 0 then
		if nHaveTSFlag ==1 and nHave90SkillFlag == 1 and nHave120SkillFlag == 1 and GetLevel() >= 150 then
			Msg2Player("<color=yellow>B©y giê ng­¬i cã thÓ nhËn nhiÖm vô kü n¨ng cÊp 150 <enter>")
		else
			local szMsg = "Ng­¬i muèn nhËn nhiÖm vô kü n¨ng 150 cÇn ph¶i"
			local nFlag = 0
			
			if nHave90SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s häc ®­îc kü n¨ng cÊp 90", szMsg) 
				nFlag = 1
			end
			if nHave120SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s häc ®­îc kü n¨ng cÊp 120", szMsg) 
				nFlag = 1
			end
			
			---ChØnh söa nhËn nv kü n¨ng 150 ph¶i trïng sinh 2 trë lªn - Modified By NgaVN - 20121207
			if nHaveTSFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s Trïng sinh 2 trë lªn", szMsg) 
				nFlag = 1
			end
			
			if GetLevel() < 150 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s ®¹t ®Õn cÊp 150", szMsg) 
				nFlag = 1
			end
			szMsg = format("<color=yellow>%s<color>", szMsg)
			Msg2Player(szMsg)
		end
	end
end

function LearnSkillByBook(index, list)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- ²»ÊÇÖ¸¶¨ÃÅÅÉ
		Msg2Player("B¹n cÇm lÊy "..list[index][5].."Nghiªn cøu c¶ nöa ngµy, kÕt qu¶ còng kh«ng lÜnh ngé ®­îc g× ")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- µ«Î´µ½Ö¸¶¨¼¶±ð
		Msg2Player("B¹n cÇm lÊy "..list[index][5].."Nghiªn cøu c¶ nöa ngµy, kÕt qu¶ lÜnh ngé rÊt Ýt. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- ÒÑÑ§¹ý¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· cÇm "..list[index][5].."NghiÒn tíi ngÉm lui, nh­ng còng kh«ng häc ®­îc g× trong ®ã ")
		return 1
	end

	AddMagic(list[index][1], list[index][2])										-- Ñ§»á¼¼ÄÜ
	
	CheckIsCanGet150SkillTask()

	WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..", Sö dông: "..list[index][5].."§· häc ®­îc: "..list[index][6]);
	Msg2Player("§· häc ®­îc kü n¨ng "..list[index][6].."'. ")
	return 0

end

function main(sel)
	Genre, DetailType, Particular=GetItemProp(sel)
	return LearnSkillByBook(Particular, sbook_list);
end

--Më nhiÖm vô nhËn kü n¨ng 150 - Modified By NgaVN - 20121207
--if login_add then login_add(CheckIsCanGet150SkillTask, 2) end