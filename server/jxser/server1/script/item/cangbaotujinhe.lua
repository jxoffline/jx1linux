-----------------------------------------------------
--文件名		：	cangbaotujinhe.lua
--创建者		：	子非魚
--创建时间		：	2008-01-17
--功能描述		：	右键点击使用后可获得12片藏宝图碎片
--物品编号		：	6,1,1651,1,0,0
------------------------------------------------------

function main()
	
	if (CalcFreeItemCellCount() < 12)  then		--背包空间判断，必须预留12格
		Say("Xin h穣 s緋 x誴 l筰 h祅h trang trc !");
		return 1;
	end;
	
	for i = 490, 501 do							--藏宝图碎片 编号
		AddEventItem(i);
	end;
	
	Msg2Player("Nh薾 頲 12 m秐h t祅g b秓 .");
	
	WriteLog(format("%s\t%s\tName:%s\tAccount:%s\t",
				"H閜 g蕀",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(),
				GetAccount(),
				"Nh薾 頲 12 m秐h t祅g b秓 ."));
end;