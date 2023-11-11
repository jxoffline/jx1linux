MAXNUM_GIFT = 10

function main()
	Talk(1, "GiveUIForShenmi_Ore", "Hîp thµnh Kho¸ng th¹ch thÇn bÝ: Mçi lÇn ®Æt vµo <color=yellow>10<color> viªn <color=yellow>cÊp 10<color> LÔ vËt n¨m DËu, th× cã thÓ hîp thµnh mét kho¸ng th¹ch thÇn bÝ.")
	return
end

function GiveUIForShenmi_Ore()
		GiveItemUI("Hîp thµnh Kho¸ng th¹ch thÇn bÝ ","T¹i thanh vËt phÈm phÝa d­íi ®Æt vµo 10 c¸i LÔ vËt n¨m DËu cÊp 10 th× cã thÓ hîp thµnh mét kho¸ng th¹ch thÇn bÝ.", "Covert_ShenmiOre", "onCancel" );
end

function Covert_ShenmiOre(nCount)
	local q = 0
	local d = 0
	local num = 0
	local maxCount = 0
	if (nCount == 0) then
		Talk(1, "GiveUIForShenmi_Ore", "<#> C¸i g× còng kh«ng ®­a, ng­¬i muèn lµm g× ®©y!")
		return 
	end
	if (nCount >10 ) then
		Talk(1, "GiveUIForShenmi_Ore", "<#> Sè l­îng vËt phÈm ng­¬i ®Æt vµo h×nh nh­ kh«ng ®óng, kiÓm tra l¹i ®i!")
		return l
	end
	
	for i = 1, nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d ~= 518) then
			Talk(1, "GiveUIForShenmi_Ore","<#> Ng­¬i ®­a ta c¸i qu¸i g× thÕ nµy?" )
			return 
		end
			function checkGiftCount(idx,count)  --¼ì²âÉñÃØµÀ¾ßµÄÊýÁ¿
				local num = GetItemStackCount(idx)
				if(count + num > MAXNUM_GIFT) then -- ÊýÁ¿Ì«¶à
					Talk(1, "GiveUIForShenmi_Ore", "<#> Ng­¬i ®Æt vµo nhiÒu qu¸! Ta kh«ng biÕt ph¶i lµm sao!")
					return nil
				end
				return num
			end
		num = checkGiftCount(itemIdx,maxCount)
		if (not num) then
			return 
		else
			maxCount = maxCount + num
		end
	end
	if (maxCount ~= 10) then
		Talk(1, "GiveUIForShenmi_Ore", "<#> Sè l­îng LÔ vËt n¨m DËu ng­¬i ®­a kh«ng ®ñ råi!")
		return 
	else
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit( i ))
		end
		AddItem(6, 1, 398, 1, 1, 1, 1)
		Talk(1, "", "Chóc mõng b¹n hîp thµnh ®­îc mét kho¸ng th¹ch thÇn bÝ!")
		Msg2Player("B¹n nhËn ®­îc mét kho¸ng th¹ch thÇn bÝ ")
		return
	end
end

function onCancel()
end