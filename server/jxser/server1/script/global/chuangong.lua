Include([[\script\global\ÌØÊâÓÃµØ\ÃÎ¾³\npc\Â·ÈË_ÅÑÉ®.lua]])
Include("\\script\\item\\levelup_item.lua")
Include("\\script\\global\\head_qianzhuang.lua")
Include("\\script\\global\\systemconfig.lua")
IncludeLib("SETTING")

TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr><link>"
function cg_getnextdate(oldday, num) --»ñµÃolddayµÄµÚnumÈÕµÄÈÕÆÚ£¬±ÈÈç060227µÄµÚ5ÈÕÎª060304
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	
	while (nDay > TBMONTH[nMonth]) do
		nDay = nDay - TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function chuangong_main()
	-- VN_MODIFY_20060427
	if (1) then
		Say("Chøc n¨ng vÉn ch­a Më ra", 0)
		return
	end
	
	if (gb_GetModule("TruyÒn c«ng") ~= 1) then
		Say("Xin lçi! Chøc n¨ng truyÒn c«ng ®· ®ãng l¹i, thêi gian më l¹i xem trang chñ ®Ó biÕt thªm th«ng tin!", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say(": "..GetName().."§· l©u kh«ng gÆp! H«m nay t×m ta cã viÖc g×?",3, "Ta muèn hái th¨m vÒ chuyÖn truyÒn c«ng./chuangong_info", "Ta muèn xin xãa bá truyÒn c«ng!/cg_undo", "ChØ lµ ®Õn th¨m Minh chñ!/OnCancel")
	else
		Say(": "..GetName().."§· l©u kh«ng gÆp! H«m nay t×m ta cã viÖc g×?",2, "Ta muèn hái th¨m vÒ chuyÖn truyÒn c«ng./chuangong_info", "ChØ lµ ®Õn th¨m Minh chñ!/OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("TruyÒn c«ng") ~= 1) then
		Say("Xin lçi! Chøc n¨ng truyÒn c«ng ®· ®ãng l¹i, thêi gian më l¹i xem trang chñ ®Ó biÕt thªm th«ng tin!", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.."Ng­êi cã ®¼ng cÊp tõ 100 ®Õn 160 cã thÓ chuyÓn c«ng lùc thµnh 1 viªn 'Nguyªn ThÇn §¬n', ng­êi tõ cÊp 10 trë xuèng, ch­a gia nhËp m«n ph¸i vµ ch­a b¸i s­ chØ cÇn uèng 1 viªn Nguyªn ThÇn ®¬n sÏ cãp ®­îc tinh lùc h¬n ng­êi. Ng­êi tõ 100~120 sau khi truyÒn c«ng kinh nghiÖm sÏ gi¶m 5%, ng­êi tõ 121~150 sau khi truyÒn c«ng kinh nghiÖm sÏ gi¶m 10%, Ng­êi tõ 150 trë lªn sÏ gi¶m 20%. <color=yellow>Suy nghÜ kü ch­a?<color>", 2, "Ta ngao du giang hå ®· l©u, muèn röa tay g¸c kiÕm!/chuangong_do", "§­¬ng nhiªn kh«ng ph¶i! ChØ lµ ®Õn hái th¨m 1 chót mµ th«i!./OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.."ChuÈn bŞ truyÒn c«ng! Ng­¬i quyÕt dŞnh ch­a? §· truyÒn lµ kh«ng thÓ rót l¹i ®©u ®ã!", 3, "§óng vËy! ı ta ®· quyÕt!./chuangong_dosure","Kh«ng! Tta muèn hñy bá truyÒn c«ng! /cg_undo", "§îi ta suy nghÜ thªm vµi ngµy./OnCancel");
	else
		Describe(strimg.."Ta ®ang chuÈn bŞ c¸c vËt liÖu cÇn thiÕt ®Ó truyÒn c«ng. Ta muèn ®Õn"..(num2datestr(applytime))..", sau ®ã míi tiÕn hµnh", 2, "Qu¶ lµ phiÒn Minh chñ, v·n bèi c¸o biÖt t¹i ®©y!   /OnCancel", "Kh«ng! Tta muèn hñy bá truyÒn c«ng! /cg_undo");
	end
end



function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.."n¨m"..month.."nguyÖt "..day.."nhËt "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.."Ta ®Õn"..num2datestr(nowday).."lµ cã thÓ truyÒn c«ng cho ng­¬i, cã thËt ng­¬i kh«ng muèn truyÒn c«ng kh«ng?",2,"Kh«ng! Ta kh«ng muèn truyÒn c«ng!/cg_undo_sure", "V©ng! Ta muèn truyÒn c«ng./OnCancel")
	else
		Describe(strimg.."Ng­¬i ch­a xin phĞp truyÒn c«ng, cÇn g× hñy bá!",1,"KÕt thóc ®èi tho¹i/OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."§­îc! Nguyªn liÖu nµy ta t¹m gi÷ l¹i, nÕu lÇn sau muèn truyÒn c«ng th× ®Õn ®©y!",1,"C¶m ¬n Minh chñ!/OnCancel")
end

function chuangong_do()
	local nEndLevel = GetLevel()
	local nRestExp = GetExp()
	if (nEndLevel < 100) then
		Describe(strimg.."Huynh ®Ö! Theo c«ng lùc cña ng­¬i hiÖn nay kh«ng ®ñ ®Ó truyÒn c«ng. Muèn truyÒn c«ng ph¶i tõ <color=yellow>cÊp 100<color> trë lªn, ng­¬i cÇn ph¶i luyÖn thªm!",1,"Ta biÕt råi!/OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.."§¼ng cÊp cña b¹n nhá h¬n 100 cÊp hoÆc h¬n 160 kh«ng thÓ truyÒn c«ng!",1,"Ta biÕt råi!/OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.."Víi vâ c«ng cña ng­¬i hiÖn nay, nÕu truyÒn c«ng sÏ chuyÓn hãa ®¼ng cÊp <color=yellow> "..fPerc.."<color>sÏ tæn thÊt kinh nghiÖm"..(100 - exp_getRate(nEndLevel)).." %Nguyªn ThÇn ®¬n"
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..", nh­ng ta cÇn ph¶i chuÈn bŞ mét tuÇn, trong thêi gian nµy, ng­¬i cã thÓ xãa bá truyÒn c«ng, muèn luyÖn ®Õn mét tr×nh ®é nhÊt ®Şnh th× kh«ng dÔ, trong thêi gian nµy h·y cè g¾ng luyÖn c«ng.",2,"Minh chñ! Ta ®· quyÕt t©m quy Èn, «ng cã thÓ b¾t ®Çu chuÈn bŞ!/chuangong_doprepair1","Nh­ thÕ! §Ó ta suy nghÜ l¹i xem!/OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog(" [TruyÒn c«ng]:"..nowday.." Acc:"..GetAccount().."Role:"..GetName().."§Ò nghŞ truyÒn c«ng")
	Describe(strimg.."§­îc! Ta lËp tøc chuÈn bŞ thñ tôc truyÒn c«ng cña ng­¬i, 1 tuÇn sau <color=yellow>"..num2datestr(nextday).."<color> ng­¬i h·y ®Õn, ta sÏ truyÒn c«ng cho ng­¬i! §­¬ng nhiªn ng­¬i lóc nµo còng cã thÓ ®Õn chç ta xãa bá truyÒn c«ng.", 1,"§a t¹ Minh chñ! TuÇn sau ta sÏ quay l¹i!/OnCancel")
	Msg2Player("TuÇn sau h·y ®Õn gÆp §éc c« kiÕm ®Ó chİnh thøc truyÒn c«ng, ®ång thêi nhËn ®­îc Nguyªn ThÇn §¬n! Còng cã thÓ xãa bá truyÒn c«ng!")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("§¼ng cÊp cña b¹n nhá h¬n 100 cÊp hoÆc h¬n 160 kh«ng thÓ truyÒn c«ng!",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("Lóc truyÒn c«ng kh«ng thÓ mÆc trang bŞ, xin h·y bá trang bŞ ra!",0)
		return
	end
	Describe(strimg.."TruyÒn c«ng cÇn ph¶i tr¶ 2 tÊm ng©n phiÕu, b¹n ®· bá vµo hµnh trang ch­a? B¹n x¸c ®Şnh muèn truyÒn c«ng?",2, "2 tÊm ng©n phiÕu ®· chuÈn bŞ xong, x¸c ®Şnh!/chuangong_doit1", "§Ó ta xem l¹i/OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("§¼ng cÊp cña b¹n nhá h¬n 100 cÊp hoÆc h¬n 160 kh«ng thÓ truyÒn c«ng!",0)
		return
	end
	Describe(strimg.."X¸c ®Şnh l¹i lÇn n÷a!",2, "X¸c ®Şnh!/chuangong_doit", "§Ó ta xem l¹i/OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("§¼ng cÊp cña b¹n nhá h¬n 100 cÊp hoÆc h¬n 160 kh«ng thÓ truyÒn c«ng!",0)
		return
	end
	local result = qz_use_silver(2, " [TruyÒn c«ng]")
	if ( result == 0) then
		Describe(strimg.."Ng­¬i kh«ng ®ñ 2 tÊm ng©n phiÕu, ta kh«ng thÓ truyÒn c«ng!", 1, "Ta sÏ chuÈn bŞ l¹i!/OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = " [TruyÒn c«ng]:"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." TruyÒn c«ng thµnh c«ng! Level:"..GetLevel().." Exp:"..GetExp();
	
	
	DoClearSkillCore()
	DoClearPropCore()
	UpdateSkill()
	local endlevel = GetLevel()
	local restexp = GetExp()
	
	ST_LevelUp(80 - endlevel)
	local param5 = chuangong_item(endlevel, restexp)
	logstr = logstr.." ItemParam5:"..param5
	WriteLog(logstr)
end

function chuangong_item(level,restexp)
	if (restexp <0) then
		restexp = 0
	end
	
	nIt = AddItem(6,1,1061,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	SetItemMagicLevel(nIt, 5, FileName2Id(GetName()))
	SyncItem(nIt)
	return GetItemParam(nIt, 5)
end

function OnCancel()
end