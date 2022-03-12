if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
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
		self.__oretabfile = new(KTabFile,"/settings/item/004/itemvalue/ore.txt","ORE")
	end	
}

MAXGIVENUM = 50  --¿ÉÒÔ¸ø×î´óÉÏÏŞ
TF_ORE_WORTH = 2

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
	local maxCount = 0	--ÀñÎïµÄ×ÜÊı
	local mark = 0

	if(nCount == 0) then
		Talk(1,"GiveUIForOre","<#> C¸i g× còng kh«ng bá vµo, sao hîp thµnh ®©y?")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit(i)
		local g,d,p,lvl = GetItemProp(itemIdx)

		if (mark ~= 0) then
			if (mark ~= lvl) then

				Talk(1,"GiveUIForOre","<#> Ng­¬i bá c¸i qu¸i g× thÕ? §¼ng cÊp kh«ng gièng nhau g× hÕt!")
				return nil
			end
		end
		mark = lvl

		if (lvl > 4) then
			Talk(1, "GiveUIForOre", "<#> HuyÒn Tinh Kho¸ng Th¹ch cña ng­¬i bá vµo ®¼ng cÊp qu¸ cao, kh«ng n»m trong ph¹m vi n¨ng lùc cña ta.")
			return nil
		end
		if(g ~= 6 or p ~= 147) then --´íÎóµÀ¾ß
			Talk(1, "GiveUIForOre", "<#> Ng­¬i bá c¸i qu¸i g× thÕ? Cã ph¶i HuyÒn Tinh Kho¸ng Th¹ch kh«ng?")
			return nil
		end
		function checkGiftCount(idx,count)  --¼ì²âÉñÃØµÀ¾ßµÄÊıÁ¿
			local num = GetItemStackCount(idx)
			if(count + num > MAXGIVENUM) then -- ÊıÁ¿Ì«¶à
				Talk(1,"GiveUIForOre","<#> Ng­¬i bá c¸i qu¸i g× v« vËy?")
				return nil
			end
			return num
		end
		local num = checkGiftCount(itemIdx,maxCount)
		if(not num) then
			return nil
		else
			maxCount = maxCount + num
			worth = worth + num * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl))
		end

	end

	return worth, mark
end
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºGiveUIForOre()
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
function GiveUIForOre()
	GiveItemUI("Hîp thµnh HuyÒn Tinh Kho¸ng Th¹ch","§em tèi ®a 50 viªn HuyÒn Tinh Kho¸ng Th¹ch cã ®¼ng cÊp gièng nhau ®Æt vµo thanh vËt phÈm th× cã thÓ hîp thµnh ra sè l­îng HuyÒn Tinh Kho¸ng Th¹ch cÊp cao h¬n t­¬ng øng.", "OreLevelUp", "onCancel" );
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºOreLevelUp(nCount)
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
function OreLevelUp(nCount)
	local worth, lvl = ComputeWorth(nCount)
	if(not worth) then return end
	--ÒÑ¾­µÃµ½ºÏÀíµÄ¼ÛÖµÁ¿£¬É¾³ıËùÓĞÎïÆ·£¬Ñ¡Ôñ¶ÔÓ¦µÄÌØÊâÉñÃØÀñÎï
	local num, worth2 = ConvertWorth(worth, lvl)
	local lvl2 = lvl + 1
	
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if (num < 1) then
		Talk(1, "", "Hõ! L¹i thÊt b¹i n÷a råi, ®em İt HuyÒn Tinh Kho¸ng Th¹ch hîp thµnh cÊp cao cã vÎ nguy hiÓm ®Êy!")
		return
	end

	if(not num) then  --Ê§°Ü£¬Ã»ÓĞÑ¡³öÈÎºÎ¶«Î÷
		Talk(1,"","<#> ThÊt b¹i råi µh! Liªn hÖ GM ®i! Ta còng kh«ng biÕt gi¶i quyÕt sao n÷a!")
		print("Error: the number of ore is non.")
		return
	end
	
	AddStackItem(num, 6, 1, 147, lvl2, 1, 1, 1)
	WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
					", sö dông"..worth.."Gi¸ trŞ "..lvl.." HuyÒn Tinh Kho¸ng Th¹ch, hîp thµnh ra"..
					num.."c¸i"..lvl2.." HuyÒn Tinh Kho¸ng Th¹ch, hÖ thèng nhËn ®­îc"..
					worth-worth2.."Gi¸ trŞ cßn thõa l¹i.")
	Talk(1, "", "B¹n ®· hîp thµnh ra <color=yellow>"..num.."<color> <color=yellow>"..lvl2.."<color> HuyÒn Tinh Kho¸ng Th¹ch ")
	Msg2Player("B¹n ®¹t ®­îc"..num.." viªn HuyÒn Tinh Kho¸ng Th¹ch")
	return
end

function ConvertWorth(worth, lvl)
	local lvlworth = tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	count = floor(worth / lvlworth)
	value = count * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	if ( random( lvlworth) < (worth - value) and (worth - value) ~= 0) then
		count = count + 1
	end
	return count, value
end


function main()
	Talk(1, "GiveUIForOre", "Hîp thµnh HuyÒn Tinh Kho¸ng Th¹ch cÊp cao: Mçi lÇn bá tèi ®a vµo <color=yellow>50<color> viªn <color=yellow>®¼ng cÊp gièng nhau<color>, th× cã thÓ hîp thµnh ra HuyÒn Tinh Kho¸ng Th¹ch cÊp cao h¬n. Nh­ng tèi ®a chØ hîp thµnh ra ®­îc HuyÒn Tinh Kho¸ng Th¹ch cÊp <color=yellow>5<color> th«i.")
	return
end

function onCancel()
end