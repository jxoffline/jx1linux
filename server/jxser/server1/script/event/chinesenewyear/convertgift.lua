--========ÎÄ¼ş¶¨Òå==================================--
--ÎÄ¼şÃû£ºconvertgift.lua
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-2-1
--¹¦ÄÜĞğÊö£º
--	´º½Ú»î¶¯£¬ÓÃ¼¦ÄêÉñÃØÀñÎï»»È¡ÀñÎï¡£±¾»î¶¯·ÖÁ½²½£¬
--µÚÒ»²½£¬¿ÉÒÔ°ÑÊıÁ¿µÄ¼¦ÄêÉñÃØÀñÎïÉı¼¶¡£µÚ¶ş²½£¬ÓÃ¼¦
--ÄêÉñÃØÀñÎï»»È¡½±Æ·¡£
--
--ÓÎÏ·½Å±¾¡¤½£ÏÀÇéÔµÍøÂç°æ
--½ğÉ½Èí¼ş¹É·İÓĞÏŞ¹«Ë¾£¬copyright 1992-2005
--==================================================--

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
--	:giftLevelup(worth)£ºÉñÃØÀñÎïÉı¼¶
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
	Include ("\\script\\class\\worthanalyse.lua")
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
		self.__gifttabfile = new(KTabFile,"/settings/event/chinesenewyear/giftslvlup.txt","GIFT")
		self.__bonustabfile = new(KTabFile,"/settings/event/chinesenewyear/bonuslist.txt","BONUS")
		self.__crystaltabfile = new(KTabFile,"/settings/event/chinesenewyear/crystal.txt","CRYSTAL")
		self.__giftWorth = new(WorthAnalyse,80)
		self.__bonusWorth = new(WorthAnalyse,60)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		for i=1,self.__bonustabfile:getRow() do
			self.__bonusWorth:addWorth(i,tonumber(self.__bonustabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
		self.__bonusWorth:makeBaseP()
		return
	end,
	
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£º:giftLevelup(worth)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜĞğÊö£º
--	ÓÉ¼ÛÖµÁ¿worthÑ¡³ö½«ÒªÉı¼¶µÃµ½µÄÉñÃØÀñÎïµÄË÷ÒıºÅ¡£
--²ÎÊı£º
--	worth£º¼ÛÖµÁ¿£¬ÕâÀïÊÇ´ÓÍæ¼ÒÌá½»µÄÉñÃØÀñÎïËã³öÀ´µÄ
--¼ÛÖµÁ¿×ÜºÍ¡£
--·µ»ØÖµ£º
--	³É¹¦Ôò·µ»Ø½«ÒªÉı¼¶µÃµ½µÄÉñÃØÀñÎïË÷Òı£¬·ñÔòÎªnil
--ÓÃÀı£º
--
--
--
--==================================================--
	giftLevelup =function(self,worth)
		self.__giftWorth:makeWorthP(worth)
		return self.__giftWorth:getFromWorth()
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
	convert = function(self,worth)
		self.__bonusWorth:makeWorthP(worth)
		return self.__bonusWorth:getFromWorth()
	end,
	 
}

TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --´óÓÚ5000Íò£¬ÉæÏÓË¢Ë®¾§
GOLD_LASTDATE = tonumber(date("%d"))  --ÉÏÒ»´Î·¢¸ß¼ÛÖµÁ¿½±Æ·µÄÈÕ×Ó£¬Ö»¼ÇÂ¼ÈÕÆÚ
GOLD_WORTH = 0  --ÒÑ·¢½±Æ·µÄ¼ÛÖµÁ¿,³ıÒÔ100000±£´æ
MAXWORTHPERDAY = 100000 --5¼ş¼ÛÖµ×î¸ßµÄ»Æ½ğ×°±¸
GOLD_PRICE_LIMIT = 10000000	--¸ßÓÚ10000000µÄ½±ÀøËã±¦Îï¡£

MAXGIVENUM = 20  --¿ÉÒÔ¸øÀñÎïµÄ×î´óÉÏÏŞ
TF_GIFT_WORTH = 3  --giftlvl.txtÖĞworthÏîµÄÁĞÊı
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8

TF_BONUS_TYPE = 2
TF_BONUS_TYPENAME = 3
TF_BONUS_NAME = 4
TF_BONUS_WORTH = 5
TF_BONUS_P1 = 6
TF_BONUS_P2 = 7
TF_BONUS_P3 = 8
TF_BONUS_P4 = 9
TF_BONUS_MESSAGE = 18
TF_BONUS_ANNOUNCE = 19

TF_CRYSTAL_WORTH = 2

--eg.
Convert:loadSettings()
--randomseed(date("%S"))
--for i=1,20 do
--	r = random(20000,150000000)
--	local idx = Convert:convert(r)
--	if(idx) then
--		print(r..":"..idx.."["..Convert.__bonustabfile:getCell("Worth",idx).."]="..r..Convert.__bonustabfile:getCell("Worth",idx).."->"..Convert.__bonusWorth.__worthP[idx])
--	end
--end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºComputeWorth(nCount)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜĞğÊö£º
--	¸ù¾İ¸øÓë½çÃæµÄÎïÆ·£¬¼ÆËã³öÆä¼ÛÖµÁ¿¡£
--²ÎÊı£º
--	nCount£º¸øÓë½çÃæÖĞÎï¼şµÄ×ÜÊı
--·µ»ØÖµ£º
--	³É¹¦Ôò·µ»Ø¼ÛÖµÁ¿£¬·ñÔò·µ»Ønil
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function ComputeWorth(nCount)
	local worth = 0	--ÀñÎï¼ÛÖµÁ¿
	local crystal = 0	--Ë®¾§¼ÛÖµÁ¿
	local maxCount = 0	--ÀñÎïµÄ×ÜÊı
	
	if(nCount == 0) then
		Talk(1,"","<#> LÔ quan c­êi hİp m¾t: 'cã g× ®­a ta kh«ng? '","B¹n g·i g·i ®Çu: 'Th«i chÕt! Ta quªn mÊt råi! '")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --´íÎóµÀ¾ß
			Talk(2,"","<#> LÔ quan chau mµy: 'Ng­¬i ®­a cho ta c¸i qu¸i g× thÕ?' ","<#> B¹n l¹i g·i ®Çu: 'wa! Xin ®­a l¹i cho ta!' ")
			return nil
		end
		if(d > 467 and d < 487) then -- Ë®¾§
			crystal = crystal + GetItemStackCount(itemIdx)*Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467))
		else --ÉñÃØÀñÎï
			function checkGiftCount(idx,count)  --¼ì²âÉñÃØµÀ¾ßµÄÊıÁ¿
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ÊıÁ¿Ì«¶à
					Talk(2,"","<#> LÔ quan g·i ®Çu: Xin lçi! Ta giµ råi nªn hoa m¾t!' ","<#> B¹n phãng th¼ng 1 c­íc, tróng ngay m«ng lÔ quan")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local lvl = d - 508
				if(lvl ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl)
				end
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --¼ÛÖµÁ¿´óÓÚ5000w£¬ÉæÏÓË¢Ë®¾§
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1,"","<#> Xin lçi! İt nhÊt ph¶i cã 1 lÔ vËt n¨m DËu!")
		return nil
	end
	return worth + crystal
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºGiftLevelUp(nCount)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-26
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-26
--¹¦ÄÜĞğÊö£º
--	Íæ¼ÒÑ¡ÔñÉı¼¶ÉñÃØÎïÆ·Ö®ºó£¬µ¯³ö¸øÓë½çÃæ£¬´Ëº¯ÊıÎª
--¸Ã¸øÓë½çÃæµã»÷È·¶¨°´Å¥Ö®ºóµÄ»Øµ÷º¯Êı¡£
--²ÎÊı£º
--	¸øÓë½çÃæÖĞµÀ¾ßÎïÆ·µÄ×ÜÊı£¬¸ÃÊıÁ¿²»¼ÆËãµş¼ÓµÄÊıÁ¿¡£
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function GiftLevelUp(nCount)
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--ÒÑ¾­µÃµ½ºÏÀíµÄ¼ÛÖµÁ¿£¬É¾³ıËùÓĞÎïÆ·£¬Ñ¡Ôñ¶ÔÓ¦µÄÌØÊâÉñÃØÀñÎï
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if(worth < 0) then
		--ÉæÏÓË¢Ë®¾§£¬¿ÛµôËùÓĞÎïÆ·£¬²¢¼ÇÂ¼ÈÕÖ¾
		WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					"Trong lóc hîp thµnh lÔ VËt n¨m DËu, ph¸t hiÖn ra ®· sö dông Thñy Tinh v­ît qu¸ 5000 v¹n. KiÕn nghŞ nªn khãa ngay Account nµy")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					"§· sö dông"..GetTask(TID_CLONECRYSTAL).."lÇn, Thñy Tinh nµy cã nhiÒu kh¶ n¨ng lµ phi ph¸p. Xin GM h·y chó ı!")
		end
		--Ëµ¾äÉñÃ´»°ÄØ£¿ÃÔ»óÒ»ÏÂ
		Say("<#> LÔ quan thÊt väng nãi: '¤i! ThÊt b¹i råi! Ng­¬i cã muèn thö l¹i kh«ng?' ",2,"§­îc! Ta muèn thö l¹i!/GiveUIForGift","Th«i ®i! §õng lõa ta n÷a!/onCancel")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --Ê§°Ü£¬Ã»ÓĞÑ¡³öÈÎºÎ¶«Î÷
		Talk(1,"","<#> LÔ quan l¾c l¾c ®Çu: sao l¹i cã thÓ thÊt b¹i nhØ?")
		return
	end
	if(idx == 1) then
		Say("<#> LÔ quan thÊt väng nãi: '¤i! ThÊt b¹i råi! Ng­¬i cã muèn thö l¹i kh«ng?' ",2,"§­îc! Ta muèn thö l¹i!/GiveUIForGift","Th«i ®i! §õng lõa ta n÷a!/onCancel")
		return
	end
	AddItem(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P2,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P3,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P4,idx),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					", sö dông"..worth.."§ñ sè ThÇn bİ lÔ vËt, hîp thµnh"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."Gi¸ trŞ l­îng thÇn bİ lÔ vËt, hÖ thèng nhËn ®­îc "..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."Gi¸ trŞ cßn thõa l¹i.")
	Say("<#> Hîp thµnh 1 lÔ vËt n¨m DËu tiÒm chÊt thÇn bİ:"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."Ng­¬i ®· võa ı ch­a?",
			2,
			"Ch­a võa ı! Ta muèn tiÕp tôc lÇn n÷a/GiveUIForGift","Còng tµm t¹m! Ta ®i ®©y!/onCancel")
	return
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºConvertBonus(nCount)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	ÓÃ¼¦ÄêÉñÃØÀñÎï¶Ò»»½±Æ·¡£´Ëº¯Êı±»¸øÓë½çÃæµÄÈ·¶¨°´Å¥
--»Øµ÷¡£
--²ÎÊı£º
--	nCount£º¸øÓë½çÃæÖĞµÄÎïÆ·×ÜÊı
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function ConvertBonus(nCount)
	if(GOLD_LASTDATE ~= date("%d")) then --ĞÂµÄÒ»Ìì¿ªÊ¼ÁË
		GOLD_LASTDATE = date("%d")
		GOLD_WORTH = 0
	end
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--ÒÑ¾­µÃµ½ºÏÀíµÄ¼ÛÖµÁ¿£¬É¾³ıËùÓĞÎïÆ·£¬Ñ¡Ôñ¶ÔÓ¦µÄ½±Àø
	if(worth < 0) then
		--ÉæÏÓË¢Ë®¾§£¬¿ÛµôËùÓĞÎïÆ·£¬²¢¼ÇÂ¼ÈÕÖ¾
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					"Trong lóc nhËn quµ tÆng n¨m míi, ph¸t hiÖn ra ®· sö dông Thñy Tinh vuît qu¸ 5000 v¹n. KiÕn nghŞ nªn khãa ngay Account nµy")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					"§· sö dông"..GetTask(TID_CLONECRYSTAL).."lÇn, Thñy Tinh nµy cã nhiÒu kh¶ n¨ng lµ phi ph¸p. Xin GM h·y chó ı!")
		end
		--Ëµ¾äÉñÃ´»°ÄØ£¿ÃÔ»óÒ»ÏÂ
		Talk(1,"","<#> Chóc mõng ng­¬i tróng sè ®éc ®¾c, nh­ng kh«ng lÊy ®­îc g× ")
		return
	end
	local idx = Convert:convert(worth)
	if(not idx) then --Ê§°Ü£¬Ã»ÓĞÑ¡³öÈÎºÎ¶«Î÷
		Talk(1,"","<#> LÔ quan l¾c l¾c ®Çu: sao l¹i cã thÓ thÊt b¹i nhØ?")
		return
	end
		
	local bonusWorth = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx))
	if(bonusWorth > GOLD_PRICE_LIMIT) then  --¿ªÊ¼¹Ø×¢
		if((bonusWorth/100000 + GOLD_WORTH) > MAXWORTHPERDAY) then --Èç´Ë¹óÖØµÄÎïÆ·²»ÄÜ·¢£¬´ïµ½Ã¿Ìì·¢¸ß¼¶½±ÀøµÄÉÏÏŞ
			Talk(1,"","<#> Quµ tÆng h«m nay ®· ph¸t hÕt råi! Mai h·y trë l¹i nhĞ!")
			return
		else
			GOLD_WORTH = GOLD_WORTH + bonusWorth/100000
		end
	end
	for i=1,nCount do  --¿Û³ıËùÓĞµÀ¾ß
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					", sö dông"..worth.."®ñ sè ThÇn bİ lÔ vËt, ®æi ®­îc"..
					Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx).."Sè quµ th­ëng n¨m míi, hÖ thèng nhËn ®­îc"..
					tostring(worth-Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx)).."Gi¸ trŞ cßn thõa l¹i.")
	return PayBonus(idx)
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºPayBonus(bonusIdx)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	¸øÍæ¼Ò·¢·Åsettings/event/chinesenewyear/bonuslist.txt
--ÖĞµÚbonusIdxÏîµÄ½±Æ·
--²ÎÊı£º
--	bonusIdx£º½±Æ·Ïî±àºÅ£¬ÔÚtabfileÖĞµÄĞĞÊı-1
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function PayBonus(bonusIdx)
	local _type = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_TYPE,bonusIdx))
	if(not _type) then return end --error.
	local msg = Convert.__bonustabfile:getCell(TF_BONUS_MESSAGE,bonusIdx)
	msg = replace(msg,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
	Msg2Player(msg)
	if(_type == 1) then --»Æ½ğ×°±¸
		AddGoldItem(0,Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	elseif(_type == 2) then --ÆÕÍ¨µÀ¾ß
		AddItem(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx),0,0,0,0,0,0,0,0)
	elseif(_type == 3) then --ÁÙÊ±×´Ì¬
		AddSkillState(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx))
	elseif(_type == 4) then --¾­ÑéÖµ
		AddOwnExp(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	else --ÄªÃûÆäÃî
		print("pay bonus error.")
	end
	WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
			", ®æi ®­îc"..Convert.__bonustabfile:getCell(TF_BONUS_TYPENAME,bonusIdx).."--"..
			Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx)..", gi¸ trŞ lµ:"..
			Convert.__bonustabfile:getCell(TF_BONUS_WORTH,bonusIdx))
	local announce = Convert.__bonustabfile:getCell(TF_BONUS_ANNOUNCE,bonusIdx)
	if(strlen(announce)>0) then
		announce = replace(announce,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
		announce = replace(announce,"<player>",GetName())
		AddGlobalNews(announce)
	end
	return
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºGiveUIForGift()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	´ò¿ª¸øÓë½çÃæ£¬ÓÃÓÚºÏ³É¼¦ÄêÉñÃØÀñÎï¡£±»Àñ¹ÙµÄ¶Ô»°
--µ÷ÓÃ¡£
--²ÎÊı£º
--	ÎŞ
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function GiveUIForGift()
	GiveItemUI("Hîp thµnh LÔ vËt n¨m DËu ","h·y ®­a ta 20 lÔ vËt n¨m DËu vµ 1 B¨ng Tinh, Ta sÏ gióp ng­¬i n©ng cÊp lÔ vËt!", "GiftLevelUp", "onCancel" );
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºGiveUIForBonus()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	´ò¿ª¸øÓë½çÃæ£¬ÓÃÓÚ¶Ò»»ĞÂ´º½±Àø¡£±»Àñ¹ÙµÄ¶Ô»°µ÷ÓÃ¡£
--²ÎÊı£º
--	ÎŞ
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function GiveUIForBonus()
	GiveItemUI("Trao ®æi lÔ vËt n¨m míi","h·y ®­a ta 20 lÔ vËt n¨m DËu vµ 1 B¨ng Tinh, ®Ó ®æi quµ th­ëng n¨m míi.", "ConvertBonus", "onCancel" );
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºEventHappyNewYear()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	ĞÂ´º»î¶¯µÄÀñ¹Ù¶Ô»°×Ó½çÃæ¡£
--²ÎÊı£º
--	ÎŞ
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function EventHappyNewYear()
	local buttons = {
		"Ta muèn nhËn quµ tÆng n¨m míi/GiveUIForBonus",
		"Ta muèn n©ng cÊp lÔ vËt n¨m DËu/GiveUIForGift",
		"T×m hiÓu ho¹t ®éng lÇn nµy/AboutNewYearEvent",
		"Toµn g¹t trÎ con. Ta ch¼ng quan t©m!/onCancel"
	}
	local talk = "<#> Hoan nghªnh tham gia ho¹t ®éng <color=red>quµ th­ëng n¨m míi<color>.Trong thêi gian ho¹t ®éng, b¹n ®¸nh qu¸i sÏ tïy c¬ nhËn ®­îc <color=yellow>LÔ vËt n¨m DËu<color>. Khi cã ®ñ sè l­îng <color=yellow>LÔ vËt n¨m DËu<color>, cã thÓ mang ®i ®æi quµ th­ëng n¨m míi"
	Say(talk,getn(buttons),buttons)
	return
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºAboutNewYearEvent()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-1-27
--×îºóĞŞ¸ÄÈÕÆÚ£º2005-1-27
--¹¦ÄÜĞğÊö£º
--	µã»÷ÁË½â±¾´Î»î¶¯Ö®ºó£¬³öÏÖµÄ¶Ô»°ÄÚÈİ¡£
--²ÎÊı£º
--	ÎŞ
--·µ»ØÖµ£º
--	ÎŞ
--ÓÃÀı£º
--	ÎŞ
--==================================================--
function AboutNewYearEvent()
	Talk(2,"",
		"<#> Hoan nghªnh tham gia ho¹t ®éng 'quµ th­ëng n¨m míi'. Trong thêi gian ho¹t ®éng, b¹n ®¸nh qu¸i sÏ tïy c¬ nhËn ®­îc LÔ vËt n¨m DËu, Khi cã ®ñ sè l­îng, cã thÓ mang ®Õn <color=red>D­¬ng Ch©u- LÔ quan<color>®æi quµ th­ëng!","<#> PhÇn th­ëng lÇn nµy rÊt phong phó, gåm: Trang bŞ Hoµng Kim, s¸ch kü n¨ng, b¶o vËt, MÆt n¹, n¨ng lùc, ®iÓm kinh nghiÖm. ChØ cÇn tİch lòy 1 sè l­îng LÔ vËt n¨m DËu nhÊt ®Şnh, cã thÓ t×m ta ®Ó ®æi quµ. T×m chÊt thÇn bİ cña LÔ vËt n¨m DËu th× gi¸ trŞ phÇn th­ëng cµng cao")
	return
end
