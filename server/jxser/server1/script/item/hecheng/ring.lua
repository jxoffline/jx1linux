/*
if not RING then
	RING = 1
end

if not SHOSHI then
	Include ("\\script\\item\\hecheng\\shoushihecheng.lua")
end
*/
--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºComputeJewelWorth(nCount)
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
function ComputeRingWorth(nCount)
	local worth = 0	--ÀñÎï¼ÛÖµÁ¿
	local maxCount = 0	--ÀñÎïµÄ×ÜÊı
	local wnum = 0
	if(nCount == 0) then
		Talk(1,"GiveUIForThing","<#> C¸i g× còng kh«ng ®­a, ng­¬i muèn lµm g× ®©y!")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g, d, p, l, f = GetItemProp(itemIdx)
		if((g ~= 4 or (d < 508 or d > 518)) and (g ~= 0 or (d~=0 and d~=1 ))) then --´íÎóµÀ¾ß  --and d~=2 and d~=5 and d~=6 and d~=7
			Talk(1,"GiveUIForThing","<#> Ng­¬i ®­a cho ta c¸i qu¸i g× thÕ nµy?")
			return nil
		end
		if(g == 0) then -- ÎäÆ÷
			wnum = wnum + 1
			if (wnum > 1) then	--Ö»ÄÜ·ÅÒ»¼ş×°±¸
				Talk(1, "GiveUIForThing", "<#> NhiÒu trang bŞ qu¸ sao ta lµm kŞp ®©y?……")
				return nil
			end
			det = d
			par = p
			lvl = l
			five = f
		else --ÉñÃØÀñÎï
			function checkGiftCount(idx,count)  --¼ì²âÉñÃØµÀ¾ßµÄÊıÁ¿
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- ÊıÁ¿Ì«¶à
					Talk(1,"GiveUIForRing","<#> Ng­¬i ®­a nhiÒu thø nh­ vËy, nh×n thÊy cho¸ng……")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local ll = d - 508
				if(ll ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,ll)
				end
			end
		end
	end
	if(worth ==0) then
		Talk(1,"GiveUIForThing","<#> Xin lçi! İt nhÊt cÇn mét LÔ vËt n¨m DËu.")
		return nil
	end
	if (wnum == 0) then
		Talk(1,"GiveUIForThing","<#> Xin lçi! CÇn ph¶i cã mét mãn vò khİ.")
		return nil
	end
	return worth, det, par, lvl, five
end

--========º¯Êı¶¨Òå==================================--
--º¯ÊıÔ­ĞÎ£ºConvertRing(nCount)
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
function ConvertRing(nCount)
	local worth, d, p, lvl, five = ComputeRingWorth(nCount)
	if(not worth) then return end
	--ÒÑ¾­µÃµ½ºÏÀíµÄ¼ÛÖµÁ¿£¬É¾³ıËùÓĞÎïÆ·£¬Ñ¡Ôñ¶ÔÓ¦µÄ½±Àø
	local idx = Convert:convertring(worth, five)
	if(not idx) then --Ê§°Ü£¬Ã»ÓĞÑ¡³öÈÎºÎ¶«Î÷
		Talk(1,"GiveUIForThing", "<#> Sao l¹i thÊt b¹i? Kh«ng thÓ nµo! Lµm l¹i ®i")
		return
	end
		for i=1,nCount do  --¿Û³ıËùÓĞµÀ¾ß
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		return PayRing(idx, lvl, five)
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
function PayRing(ringIdx, level, five)
	local num = tonumber(Convert.__ringtabfile:getCell(TF_BONUS_SEED, ringIdx))
	local _nSeed = SetRandSeed(num)
	AddItem(0, 3, 0, level, five,
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P1,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P2,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P3,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P4,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P5,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P6,ringIdx)),
						tonumber(Convert.__ringtabfile:getCell(TF_BONUS_P7,ringIdx)))
	SetRandSeed(_nSeed)
	WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..
			", ®æi ®­îc"..ringmsg[level]..", gi¸ trŞ lµ:"..
			Convert.__ringtabfile:getCell(TF_BONUS_WORTH,ringIdx))
	Talk(1, "", "B¹n hîp thµnh ®­îc 1 "..ringmsg[level])
	Msg2Player("B¹n nhËn ®­îc 1 "..ringmsg[level])
	return
end
