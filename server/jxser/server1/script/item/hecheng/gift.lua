
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
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__crystaltabfile = new(KTabFile,"/settings/event/juanzhouhecheng/crystal.txt","CRYSTAL")		
		self.__giftWorth = new(WorthAnalyse,80)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
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
}



TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --´óÓÚ5000Íò£¬ÉæÏÓË¢Ë®¾§

MAXGIVENUM = 20  --¿ÉÒÔ¸øÀñÎïµÄ×î´óÉÏÏŞ
TF_GIFT_WORTH = 3  --giftlvl.txtÖĞworthÏîµÄÁĞÊı
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8
TF_CRYSTAL_WORTH = 2

Convert:loadSettings()


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
		Talk(1, "GiveUIForGift", "<#> C¸i g× còng kh«ng ®­a, ng­¬i muèn lµm g× ®©y!")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)

		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --´íÎóµÀ¾ß
			Talk(1,"GiveUIForGift","<#> Ng­¬i ®­a cho ta c¸i qu¸i g× thÕ nµy?")
			return nil
		end
		if(d > 467 and d < 487) then -- ±ù¾§
			crystal = crystal + GetItemStackCount(itemIdx)* tonumber(Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467)))
		else --ÉñÃØÀñÎï
			function checkGiftCount(idx,count)  --¼ì²âÉñÃØµÀ¾ßµÄÊıÁ¿
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ÊıÁ¿Ì«¶à
					Talk(1, "GiveUIForGift", "<#> §å ng­¬i cho nhiÒu qu¸, nh×n kh«ng râ g× hÕt!")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				if (d == 518) then
					Say("LÔ vËt n¨m DËu b¹n ®Æt vµo trong cã LÔ vËt n¨m DËu (cÊp 10) , nh­ thÕ sÏ ¶nh h­ëng hîp thµnh thÊt b¹i, cã cÇn hîp thµnh l¹i kh«ng?", 2, "§­îc, hîp thµnh l¹i ®i!/GiveUIForGift", "Kh«ng cÇn!/onCancel")
					return nil
				end
				maxCount = maxCount + num
				local lvl = d - 507
				worth = worth + num * tonumber(Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl))
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --¼ÛÖµÁ¿´óÓÚ5000w£¬ÉæÏÓË¢±ù¾§
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1, "GiveUIForGift", "<#> Xin lçi! İt nhÊt cÇn mét LÔ vËt n¨m DËu.")
		return nil
	end

	return worth + crystal
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
	GiveItemUI("Hîp thµnh LÔ vËt n¨m DËu ","B¹n cã thÓ ®Æt nhiÒu nhÊt lµ 20 c¸i LÔ vËt n¨m DËu vµ B¨ng Tinh trong ho¹t ®éng gi¸ng sinh cßn d­ l¹i.", "GiftLevelUp", "onCancel" );
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
		Talk(1,"","<#> Hõ! ChuyÖn g× vËy, thÊt b¹i råi µh? Sao k× vËy nÌ…… ")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --Ê§°Ü£¬Ã»ÓĞÑ¡³öÈÎºÎ¶«Î÷
		Talk(1,"","<#> Hõ! ChuyÖn g× vËy, thÊt b¹i råi µh? Sao k× vËy nÌ…… ")
		return
	end
	if (idx == 1) then
		Talk(1,"","<#> Hõ! ChuyÖn g× vËy, thÊt b¹i råi µh? Sao k× vËy nÌ…… ")
		return
	end

	AddItem(tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P2,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P3,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P4,idx)),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					", sö dông"..worth.."§ñ sè ThÇn bİ lÔ vËt, hîp thµnh"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."Gi¸ trŞ l­îng thÇn bİ lÔ vËt, hÖ thèng nhËn ®­îc "..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."Gi¸ trŞ cßn thõa l¹i.")
	Talk(1, "","<#> Hîp thµnh ra mét tiÒm chÊt"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."LÔ vËt n¨m DËu")
	Msg2Player("B¹n nhËn ®­îc mét LÔ vËt n¨m DËu")
	return
end

function main()
	Talk(1, "GiveUIForGift", "Hîp thµnh LÔ vËt n¨m DËu: §Æt nhiÒu nhÊt lµ 20 c¸i <color=yellow>LÔ vËt n¨m DËu<color>, th× cã kh¶ n¨ng hîp thµnh ®­îc LÔ vËt n¨m dËu cao cÊp h¬n. NÕu b¹n cßn d­ <color=yellow>B¨ng Tinh<color> trong dŞp lÔ gi¸ng sinh còng cã thÓ bá vµo ®Ó t¨ng x¸c xuÊt cao h¬n. ")
end

function onCancel()
end