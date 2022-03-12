function CheckPromotionDate()
 	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if ((20090619 <= nDate)  and (nDate <= 20090719)) then
		return 1
	else
		return 0
	end
end

-- Coin rate table
TBL_COIN_RATE = {
	{1, 50},
	{3, 30},
	{5, 20},
}

function VNG_GetPromotionCoin()
	local nSeed = random(1, 100);
	local nSum = 0;
	for i = 1, getn(TBL_COIN_RATE) do
		nSum = nSum + TBL_COIN_RATE[i][2];
		if (nSeed <= nSum) then
			local nAdd = TBL_COIN_RATE[i][1]
			return nAdd
		end
	end
end
