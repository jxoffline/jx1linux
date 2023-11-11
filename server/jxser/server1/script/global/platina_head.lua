IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINAEQ_GOLDEQ ={
--[°×½ðID] = {°×½ðID, »Æ½ðID,×°±¸Éý¼¶¼ÛÖµÁ¿ÏµÊý,×°±¸Ãû};
--[1] = {1, 1, 4, "ÃÎÁúÖ®Õý»ÆÉ®Ã±"},
}

function LoadPlatinaEquipSetting()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def.txt", "PlatinaData")
	if b1~=1 then
		print("T¶i tËp tin th¨ng cÊp trang bÞ B¹ch Kim thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaData", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaData", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaData", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaData", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaData", y, "EQUIPNAME");
		
		TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
	end	
end;

LoadPlatinaEquipSetting()

--°×½ð×°±¸¸÷µÈ¼¶Éý¼¶µÄ¼ÛÖµÁ¿
PLATINAEQ_UPGRADERATE_BASIC = 10000;
TB_PLATINAEQ_UPGRADERATE = {
	[0] = 2000*PLATINAEQ_UPGRADERATE_BASIC,
	[1] = 4000*PLATINAEQ_UPGRADERATE_BASIC,
	[2] = 6000*PLATINAEQ_UPGRADERATE_BASIC,
	[3] = 8000*PLATINAEQ_UPGRADERATE_BASIC,
	[4] = 10000*PLATINAEQ_UPGRADERATE_BASIC,
	[5] = 15000*PLATINAEQ_UPGRADERATE_BASIC,
	[6] = 30000*PLATINAEQ_UPGRADERATE_BASIC,
	[7] = 50000*PLATINAEQ_UPGRADERATE_BASIC,
	[8] = 80000*PLATINAEQ_UPGRADERATE_BASIC,
	[9] = 120000*PLATINAEQ_UPGRADERATE_BASIC,
};

-- °×½ðÉý¼¶µÄ±ØÐèµÄ²ÄÁÏ
tb_upgrade_material	=
{
	--[²ÄÁÏID] = {²ÄÁÏÃû£¬¼ÛÖµÁ¿£¬²ÄÁÏLevel£¬ËùÐèÊýÁ¿£¬Éý¼¶¼¸¼¶°×½ð}
	["6,1,1308"] 	= {szName = "Bæ Thiªn Th¹ch (tiÓu)", nValue = 20000000},
	["6,1,1309"] 	= {szName = "Bæ Thiªn Th¹ch (trung)", nValue = 100000000},
	["6,1,1310"]	= {szName = "Bæ Thiªn Th¹ch (®¹i)", nValue = 1000000000},
	["6,1,2127"]	= {szName = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 1)", nValue = 0, nCount = 1, nUpgradeLevel = 6},
	["6,1,2160"]	= {szName = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 2)", nValue = 0, nCount = 1, nUpgradeLevel = 7},
	["6,1,2161"]	= {szName = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 3)", nValue = 0, nCount = 1, nUpgradeLevel = 8},
	["6,1,2162"]	= {szName = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 4)", nValue = 0, nCount = 1, nUpgradeLevel = 9},
};

tb_gold2planita_material =
{
	["6,1,398"] 	= {szName = "ThÇn bÝ kho¸ng th¹ch", nCount = 1},
	["6,1,147"] 	= {szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 8", nItemLevel = 8, nCount = 1},
	["6,1,1309"]	= {szName = "Bæ Thiªn Th¹ch (trung)", nCount = 1},
};

tbUpGradeProcess = {
[1] = {
				tbUpItemList = tb_gold2planita_material,
				szErrorMsg = "<dec><npc>Ngoµi <color=yellow>trang bÞ B¹ch Kim<color>, ta cßn cÇn <color=yellow>ThÇn bÝ kho¸ng th¹ch<color>, color=yellow>HuyÒn Tinh Kho¸ng Th¹ch cÊp 8<color> vµ <color=yellow>m¶nh Bæ Thiªn Th¹ch (trung)<color>, xin h·y gi÷ l¹i nh÷ng thø kh¸c.",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = tb_upgradematerial,
				szErrorMsg = "<dec><npc>Ngoµi <color=yellow>trang bÞ B¹ch Kim<color>, ta cßn cÇn  <color=yellow>m¶nh Bæ Thiªn Th¹ch<color> n÷a, xin h·y gi÷ l¹i nh÷ng thø kh¸c.",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
}
