-- 客户端客户端购买处理
Include("\\script\\lib\\common.lua");


local tbProcessRequest =
{
	
};



-- 客户端购买
function BuyItem(nShopIdx, nSelItemIndex, nCurrencyType, nScale)

	local tbProcesser = %tbProcessRequest[nShopIdx];
	if (tbProcesser == nil) then
		print("Error: DynamicShop Client BuyItem Process!");
		return
	end
	
	-- 交付处理函数处理
	DynamicExecute(tbProcesser[1], tbProcesser[2], PlayerIndex, nShopIdx, nSelItemIndex, nCurrencyType, nScale);
end

