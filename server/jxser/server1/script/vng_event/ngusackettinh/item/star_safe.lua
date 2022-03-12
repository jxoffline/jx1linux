Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

tbNSKT_star_safe = {}

function main(itemidx)
	--kiem tra dieu kien su dung vat pham
	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 vµ ®·  n¹p thÎ.")
		return 1
	end
	--  kiem tra han su dung
	if (tbNSKT_Item_Star:isExpired(itemidx) == 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	-- su dung vat pham thanh cong, xoa item
	if (tbNSKT_star_safe:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "§¹i hiÖp ®·  ®¹t tèi ®a sö dông vËt phÈm nµy!")
		return 1 -- khong delete item	
	end
end

function tbNSKT_star_safe:UseItem()
	if (tbNSKT_Item_Star and tbNSKT_Item_Star:isMaxItemUse() == 0 ) then
		--khong set task duoc, khong tang thuong, xoa vat pham
		if (tbNSKT_Item_Star:setUseCount() ~= 1)then
			return 1;
		end
		local tbAwardExp = {nExp = 20e6} --20 trieu exp
		tbNSKT_Item_Star:giveAward(tbAwardExp, "PhÇn th­ëng EXP ng«i sao an lµnh");		
		return 1;
	end
	return 0; --sö dông max, kh«ng cho sö dông, kh«ng xãa v¹t phÈm
end