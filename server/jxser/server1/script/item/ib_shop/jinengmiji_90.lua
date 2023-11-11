-- ÎÄ¼þÃû¡¡£ºjinengmiji_90.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£º¸÷ÃÅÅÉµÄÃØ¼®£¬ ¿ÉÒÔÑ§Ï°90¼¶¼¼ÄÜ
-- ´´½¨Ê±¼ä£º2011-07-12 15:59:01

Include("\\script\\dailogsys\\dailogsay.lua")
--£¨ÉÙÁÖ0 ÌìÍõ1  ÌÆÃÅ2  Îå¶¾3   ¶ëÃ¼4  ´äÑÌ5   Ø¤°ï6   ÌìÈÌ7   Îäµ±8   À¥ÂØ9£©
sbook_list =
{	-- ¸ñÊ½£º{¼¼ÄÜID, ¼¼ÄÜµÈ¼¶, °ïÅÉID, ËùÐè¼¶±ð, ¼¼ÄÜÊéÃû³Æ, ¼¼ÄÜÃû³Æ}
	[2959] = {	
		{318, 1, 0, 90, "ThiÕu L©m MËt TÞch", "ThiÕu L©m Ch­ëng Ph¸p - §¹t Ma §é Giang"},
		{319, 1, 0, 90, "ThiÕu L©m MËt TÞch", "ThiÕu L©m C«n Ph¸p - Hoµnh T¶o Thiªn Qu©n"},
		{321, 1, 0, 90, "ThiÕu L©m MËt TÞch", "ThiÕu L©m Dao Ph¸p - V« T­íng Tr¶m"},
	},
	[2960] = {	
		{322, 1, 1, 90, "Thiªn V­¬ng MËt TÞch", "Thiªn V­¬ng §ao Ph¸p - Ph¸ Thiªn Tr¶m"},
		{323, 1, 1, 90, "Thiªn V­¬ng MËt TÞch", "Thiªn V­¬ng Th­¬ng Ph¸p - Truy Tinh Trôc NguyÖt"},
		{325, 1, 1, 90, "Thiªn V­¬ng MËt TÞch", "Thiªn V­¬ng Chïy Ph¸p - Truy Phong QuyÕt"},
	},
	[2961] = {	 
		{339, 1, 2, 90, "§­êng M«n MËt TÞch ", "§­êng M«n Phi §ao - NhiÕp Hån NguyÖt ¶nh"},
		{302, 1, 2, 90, "§­êng M«n MËt TÞch ", "§­êng M«n Tô TiÔn - B¹o Vò Lª Hoa"},
		{342, 1, 2, 90, "§­êng M«n MËt TÞch ", "§­êng M«n Phi Tiªu - Cöu Cung Phi Tinh"},
		{351, 1, 2, 90, "§­êng M«n MËt TÞch ", "§­êng m«n H¶m TÜnh - Lo¹n Hoµn KÝch"},
	},
	[2962] = {	 
		{353, 1, 3, 90, "Ngò §éc MËt TÞch", "Ngò §éc Ch­ëng Ph¸p - ¢m Phong Thùc Cèt"},
		{355, 1, 3, 90, "Ngò §éc MËt TÞch", "Ngò §éc §ao Ph¸p - HuyÓn ¢m Tr¶m"},
		{390, 1, 3, 90, "Ngò §éc MËt TÞch", "Ngò §éc NhiÕp T©m ThuËt - §o¹n C©n Hñ Cèt"},
	},
	[2963] = {	 
		{328, 1, 4, 90, "Nga Mi MËt TÞch", "Nga My KiÕm Ph¸p - Tam Nga TÔ TuyÕt"},
		{380, 1, 4, 90, "Nga Mi MËt TÞch", "Nga My Ch­ëng Ph¸p - Phong S­¬ng To¸i ¶nh"},
		{332, 1, 4, 90, "Nga Mi MËt TÞch", "Nga Mi Phæ §é - Phæ §é Chóng Sinh"},
	},
	[2964] = {	 
		{336, 1, 5, 90, "Thóy Yªn MËt TÞch", "Thóy Yªn §¹o Ph¸p - B¨ng Tung V« ¶no"},
		{337, 1, 5, 90, "Thóy Yªn MËt TÞch", "Thóy Yªn Song §ao - B¨ng T©m Tiªn Tö"},
	},
	[2965] = {	 
		{357, 1, 6, 90, "C¸i Bang MËt TÞch", "C¸i Bang Ch­ëng Ph¸p - Phi Long T¹i Thiªn"},
		{359, 1, 6, 90, "C¸i Bang MËt TÞch", "C¸i Bang C«n Ph¸p - Thiªn H¹ V« CÈu"},
	},
	[2966] = {	 
		{361, 1, 7, 90, "Thiªn NhÉn MËt TÞch", "Thiªn NhÉn M©u Ph¸p - V©n Long KÝch"},
		{362, 1, 7, 90, "Thiªn NhÉn MËt TÞch", "Thiªn NhÉn §ao Ph¸p - Thiªn Ngo¹i L­u Tinh"},
		{391, 1, 7, 90, "Thiªn NhÉn MËt TÞch", "Thiªn NhÉn Chó ThuËt - NhiÕp Hån Lo¹n T©m"},
	},
	[2967] = {	 
		{365, 1, 8, 90, "Vâ §ang MËt TÞch ", "Vâ §ang Ch­ëng Ph¸p - Thiªn §Þa V« Cùc"},
		{368, 1, 8, 90, "Vâ §ang MËt TÞch ", "Vâ §ang KiÕm Ph¸p - Nh©n KiÕm Hîp NhÊt"},
	},
	[2968] = {	 
		{372, 1, 9, 90, "C«n L«n MËt TÞch", "C«n L«n Ngù Phong - Ng¹o TuyÕt Tiªu Phong"},
		{375, 1, 9, 90, "C«n L«n MËt TÞch", "C«n L«n Ngù L«i - L«i §éng Cöu Thiªn"},
		{394, 1, 9, 90, "C«n L«n MËt TÞch", "C«n L«n Ngù T©m - Tóy Tiªn T¸ Cèt"},
	},
}

function LearnSkillByBook(index, list, nItemIndex, nPlayerIndex)

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
	
	-- ÅÐ¶Ïµ±Ç°µÄÎïÆ·ÊÇ·ñÎªÉÙÁÖÃØ¼®£¬ÊÇÔòÏÈÉ¾³ý£¬ºóÔö¼Ó¼¼ÄÜ
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("Hñy Bá ThiÕu L©m MËt TÞch thÊt b¹i")
		return 
	end
	
	AddMagic(list[index][1], list[index][2])										-- Ñ§»á¼¼ÄÜ

	WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..", Sö dông: "..list[index][5].."§· häc ®­îc: "..list[index][6]);
	Msg2Player("§· häc ®­îc kü n¨ng "..list[index][6].."'. ")
	return 0
end

function selectskill(list, nItemIndex, nPlayerIndex)
	local szTitle = "§¹i hiÖp muèn häc lo¹i kü n¨ng nµo"
	local tbOpt = {}
	for index,v in list do
		tinsert(tbOpt, {v[6], LearnSkillByBook, {index, list, nItemIndex, PlayerIndex}})
	end
	tinsert(tbOpt, {"§Ó ta suy nghÜ l¹i", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function main(nItemIndex)
	Genre, DetailType, Particular=GetItemProp(nItemIndex)
	selectskill(sbook_list[Particular], nItemIndex, PlayerIndex)
	return 1
end
