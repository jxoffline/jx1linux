--中原南区 武当派 紫霄殿前广场储物箱1

function main(sel)

OpenBox();		--弹出储物箱物品框和玩家物品框，以便于玩家进行物品和金钱的存取
if (GetFaction() == "wudang") then
SetRevPos(39);		--设置重生点
end
end;