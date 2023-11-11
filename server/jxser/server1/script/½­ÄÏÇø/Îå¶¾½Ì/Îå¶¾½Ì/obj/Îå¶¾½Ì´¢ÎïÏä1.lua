--西南南区 五毒教 储物箱1

function main(sel)
	OpenBox();		--弹出储物箱物品框和玩家物品框，以便于玩家进行物品和金钱的存取
	if (GetFaction() == "wudu") then
		SetRevPos(70);		--设置重生点
	end
end;
