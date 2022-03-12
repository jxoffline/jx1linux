/*
if not AMULET then
	Include ("\\script\\item\\hecheng\\amulet.lua")
end

if not PENDANT then
	Include ("\\script\\item\\hecheng\\pendant.lua")
end

if not RING then
	Include ("\\script\\item\\hecheng\\ring.lua")
end
if not SHOSHI then
	SHOUSHI = 1
end
*/

--========Àà¶¨Òå====================================--
--ÀàÃû£ºConvert
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜĞğÊö£º
--	¸ºÔğ¼ÆËã¼¦ÄêÉñÃØÀñÎïÉı¼¶¹ØÏµµÄ¼ÛÖµÁ¿ºÍÓÃ¼¦ÄêÉñÃØ
--ÀñÎï¶Ò»»½±Æ·µÄ¼ÛÖµÁ¿¡£ÒÔ¼°Ñ¡Ôñ½±Æ·¡£
--
--³ÉÔ±±äÁ¿£º
--	__gifttabfile£ºÉñÃØÀñÎï¼ÛÖµÁ¿tabfile
--	__bonustabfile£º½±Æ·µÄtabfile
--	__giftWorth£ºÉñÃØÀñÎïÉı¼¶µÄ¼ÛÖµÁ¿±í
--	__bonusWorth£º½±Æ·µÄ¼ÛÖµÁ¿±í
--³ÉÔ±º¯Êı£º
--	:loadSettings()£ºÔØÈë¼ÛÖµÁ¿Éè¶¨ÎÄ¼ş¡£
--	:convert(worth)£ºÓÃworth»»È¡½±Æ·
--
--ÓÃÀı£º
--
--
--
--==================================================--

if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

if not WORTHANALYSE_HEAD then
	Include ("\\script\\item\\hecheng\\worthanalyse.lua")
end

Convert = {
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£º:loadSettings()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜĞğÊö£º
--	ÔØÈëÅäÖÃÎÄ¼ş²¢½øĞĞ¼ÛÖµÁ¿µÄ¼ÆËã¡£¸Ãº¯ÊıÊ×ÏÈÔØÈë
--settings/event/chinesenewyear/giftlvlup.txtºÍ
--settings/event/chinesenewyear/bounslist.txtÎÄ¼ş£¬
--È»ºó¸ù¾İÕâÁ½·İÎÄ¼ş·Ö±ğ¼ÆËãÉñÃØÀñÎïÉı¼¶µÄ¼ÛÖµÁ¿±íºÍ
--ÉñÃØÀñÎï¶Ò»»½±Æ·µÄ¼ÛÖµÁ¿±í¡£
--²ÎÊı£º
--	ÎŞ
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__ringtabfile = new(KTabFile,"/settings/event/juanzhouhecheng/ringlist.txt","RING")
		self.__amulettabfile = new(KTabFile,"/settings/event/juanzhouhecheng/amuletlist.txt","AMULET")
		self.__pendanttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/pendantlist.txt","PENDANT")
		self.__pendantWorth = new(WorthAnalyse,80)
		self.__amuletWorth = new(WorthAnalyse,80)
		self.__ringWorth = new(WorthAnalyse,80)
		return
	end,
	
	
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£º:convert(worth)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜĞğÊö£º
--	ÓÉ¼ÛÖµÁ¿worth¼ÆËã³öÍæ¼Ò½«ÒªµÄµ½µÄ½±Àø±àºÅ¡£
--²ÎÊı£º
--	worth£ºÉñÃØÀñÎïµÄ¼ÛÖµÁ¿Ö®ºÍ¡£
--·µ»ØÖµ£º
--	Èç¹û³É¹¦£¬Ôò·µ»ØËùµÃµ½½±ÀøµÄË÷Òı£¬·ñÔòÎªnil
--ÓÃÀı£º
--
--==================================================--
	convertring = function(self,worth,mark)
		for i=1,self.__ringtabfile:getRow() do
			if (tonumber(self.__ringtabfile:getCell("Ngò Hµnh",i)) == mark or tonumber(self.__ringtabfile:getCell("Ngò Hµnh",i)) == 9) then
				self.__ringWorth:addWorth(i, tonumber(self.__ringtabfile:getCell("Worth",i)), tonumber(self.__ringtabfile:getCell("mID",i)))
			else
				self.__ringWorth:addWorth(i, 0, tonumber(self.__ringtabfile:getCell("mID",i)))
			end
		end
		self.__ringWorth:makeBaseP()
		self.__ringWorth:makeWorthP(worth)
		return self.__ringWorth:getFromWorth()
	end,
	convertpendant = function(self,worth, mark)
		for i=1,self.__pendanttabfile:getRow() do
			if (tonumber(self.__pendanttabfile:getCell("Ngò Hµnh",i)) == mark or tonumber(self.__pendanttabfile:getCell("Ngò Hµnh",i)) == 9) then
				self.__pendantWorth:addWorth(i, tonumber(self.__pendanttabfile:getCell("Worth",i)), tonumber(self.__pendanttabfile:getCell("mID",i)))
			else
				self.__pendantWorth:addWorth(i, 0, tonumber(self.__pendanttabfile:getCell("mID",i)))
			end
		end
		self.__pendantWorth:makeBaseP()
		self.__pendantWorth:makeWorthP(worth)
		return self.__pendantWorth:getFromWorth()
	end,
	convertamulet = function(self,worth, mark)		
		for i=1,self.__amulettabfile:getRow() do
			if (tonumber(self.__amulettabfile:getCell("Ngò Hµnh",i)) == mark or tonumber(self.__amulettabfile:getCell("Ngò Hµnh",i)) == 9) then
				self.__amuletWorth:addWorth(i, tonumber(self.__amulettabfile:getCell("Worth",i)), tonumber(self.__amulettabfile:getCell("mID",i)))
			else
				self.__amuletWorth:addWorth(i, 0, tonumber(self.__amulettabfile:getCell("mID",i)))
			end
		end
		self.__amuletWorth:makeBaseP()
		self.__amuletWorth:makeWorthP(worth)
		return self.__amuletWorth:getFromWorth()
	end	 
}

--eg.
Convert:loadSettings()
ringmsg = 
	{
		"Hoµng Ngäc Giíi ChØ",
		"C¶m L·m Th¹ch Giíi ChØ",
		"Phï Dung Th¹ch Giíi ChØ",
		"PhØ Thóy Giíi ChØ",
		"Thóy Lùu Th¹ch Giíi ChØ",
		"Tæ MÉu Lôc Giíi ChØ",
		"H¶i Lam B¶o Th¹ch Giíi ChØ",
		"Hång B¶o Th¹ch Giíi ChØ",
		"Lam B¶o Th¹ch Giíi ChØ",
		"Toµn Th¹ch Giíi ChØ"
	}

pendantmsg = 
	{
		{"Hu©n Y H­¬ng Nang","M¹t LŞ H­¬ng Nang","Nhò H­¬ng H­¬ng Nang","Lan Hoa H­¬ng Nang","Hîp Hoan H­¬ng Nang","Tö T« H­¬ng Nang","TrÇm §µn H­¬ng Nang","Tiªn X¹ H­¬ng Nang","Giµ Nam H­¬ng Nang","Long Tiªn H­¬ng Nang"},
		{"Du Diªn Ngäc Béi ","Kinh B¹ch Ngäc Béi ","§µo Hoa Ngäc Béi ","Mai Hoa  Ngäc Béi ","Ngò S¾c Ngäc Béi ","Thanh Ngäc Ngäc Béi ","Bİch Ngäc Ngäc Béi ","MÆc Ngäc Ngäc Béi ","Hoµng Ngäc Ngäc Béi ","D­¬ng Chi B¹ch Ngäc"}
	}
	
amuletmsg = 
	{
		{"§ång H¹ng Liªn","Ng©n H¹ng Liªn","Kim H¹ng Liªn","B¹ch Kim H¹ng Liªn","Ngäc Ch©u H¹ng Liªn","Lôc Tïng Th¹ch H¹ng Liªn","Thñy Tinh H¹ng Liªn ","Khæng T­íc Th¹ch H¹ng Liªn","Tr©n Ch©u H¹ng Liªn","Toµn Th¹ch H¹ng Liªn"},
		{"Lôc Tïng Th¹ch Hé Th©n phï ","San H« Hé Th©n phï ","Miªu Nh·n Hé Th©n phï ","Hæ T×nh Hé Th©n phï ","Thñy Tinh Hé Th©n phï ","Hæ Ph¸ch Hé Th©n phï ","B¹ch PhØ Thóy Hé Th©n phï ","Hång PhØ Thóy Hé Th©n phï ","Tö PhØ Thóy Hé Th©n phï ","Lôc PhØ Thóy Hé Th©n phï "}
	}

MAXGIVENUM = 20  --¿ÉÒÔ¸øÀñÎïµÄ×î´óÉÏÏŞ
TF_GIFT_WORTH = 3  --giftlvl.txtÖĞworthÏîµÄÁĞÊı

TF_BONUS_WORTH = 3 
TF_BONUS_SEED = 4
TF_BONUS_P1 = 5
TF_BONUS_P2 = 6
TF_BONUS_P3 = 7
TF_BONUS_P4 = 8
TF_BONUS_P5 = 9
TF_BONUS_P6 = 10
TF_BONUS_P7 = 11
TF_BONUS_F = 12



function main()
	Talk(1, "GiveUIForThing", "Hîp thµnh nhÉn: Mçi lÇn bá tèi ®a vµo <color=yellow>20<color> lÔ vËt n¨m DËu vµ mét mãn <color=yellow>vò khİ<color> mµu xanh, cã thÓ hîp thµnh ra ®¼ng cÊp t­¬ng øng, trang søc thuéc tİnh ngò hµnh. Ta cµng bá nhiÒu lÔ vËt n¨m DËu vµo thuéc tİnh cña nhÉn cµng cao.<enter>C¸ch thøc ®æi: Vò khİ ®æi nhÉn; kh¨n ®éi hoÆc giµy ®æi ®ai th¾t; y phôc hoÆc yªu ®¸i ®æi d©y chuyÒn")
end

function GiveUIForThing()
	GiveItemUI("Giao diÖn hîp thµnh trang søc","Thanh c«ng cô phİa d­íi ®Æt vµo nhiÒu nhÊt 20 lÔ vËt n¨m dËu vµ mét vò khİ.", "ConvertThing", "onCancel" );
end

function ConvertThing(nCount)
	local worth = 0	--ÀñÎï¼ÛÖµÁ¿
	local maxCount = 0	--ÀñÎïµÄ×ÜÊı
	local wnum = 0
	local thindex = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#> C¸i g× còng kh«ng ®­a, ng­¬i muèn lµm g× ®©y!")
		return nil
	end
	for i=1,nCount do
		itemIdx = GetGiveItemUnit( i )
		g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 and d ~= 2 and d ~= 5 and d ~= 6 and d ~= 7 ))) then --´íÎóµÀ¾ß  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#> Ng­¬i ®­a cho ta c¸i qu¸i g× thÕ nµy?")
			return nil
		end
		if(g == 0 ) then -- ÎäÆ÷×°±¸
		magictype = GetItemMagicAttrib(itemIdx, 1)
			if (not magictype) then
				Talk(1, "GiveUIForThing", "<#> Ng­¬i ®­a ta mét vò khİ ph¶i cã thuéc tİnh mµu xanh. ")
				return
			end
		if (magictype == 0 ) then
			Talk(1, "GiveUIForThing", "<#> Ng­¬i ®­a ta mét vò khİ ph¶i cã thuéc tİnh mµu xanh. ")
			return
		end	
			wnum = wnum + 1
			thindex = itemIdx
		else --ÉñÃØÀñÎï

		end
	end
	if (wnum > 1) then	--Ö»ÄÜ·ÅÒ»¼ş×°±¸
		Talk(1, "GiveUIForThing", "<#> NhiÒu trang bŞ qu¸ sao ta lµm kŞp ®©y?……")
		return nil
	end	
	if (wnum < 1) then
		Talk(1, "GiveUIForThing", "<#> Vò khİ g× còng kh«ng ®Æt vµo sao ®æi trang søc ®©y?")
		return
	end
	gg, dd = GetItemProp(thindex)
	if(gg == 0 and (dd == 0 or dd == 1)) then -- ½äÖ¸
		ConvertRing(nCount)
	elseif (gg == 0 and (dd == 2 or dd == 6)) then --¾±´ø
		ConvertAmulet(nCount)
	elseif (gg == 0 and (dd == 7 or dd == 5)) then --Ñü×¹
		ConvertPendant(nCount)
	end
end

function onCancel()
end