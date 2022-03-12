IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

TB_PLATINAEQ_GOLDEQ ={
--[°×½ðID] = {»Æ½ðID,×°±¸Éý¼¶¼ÛÖµÁ¿ÏµÊý,×°±¸Ãû, ÊÇ·ñÐèÒª»ìãç¶¦};
--[1] = {1, 1, 4, "ÃÎÁúÖ®Õý»ÆÉ®Ã±",bhunduding},
}

function LoadPlatinaEquipSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataTmp")
	if b1~=1 then
		print("T¶i tËp tin th¨ng cÊp trang bÞ B¹ch Kim thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaDataTmp", y, "EQUIPNAME");
		local bhundunding = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "HUNDUNDING"));
		
		if (bhundunding ~= nil and bhundunding == 1) then
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name, bhundunding};
		else
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
		end
	end	
end;

LoadPlatinaEquipSettingTmp()

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

--²¹ÌìÊ¯ËéÆ¬µÄ¼ÛÖµÁ¿
TB_UPGRADEITEM_VALUE ={
	["6,1,1308"] = {20000000, "Bæ Thiªn Th¹ch (tiÓu)", -1},
	["6,1,1309"] = {100000000, "Bæ Thiªn Th¹ch (trung)", -1},
	["6,1,1310"] = {1000000000, "Bæ Thiªn Th¹ch (®¹i)", -1},
	["6,1,1380"] = {3333333333, "Bæ Thiªn Th¹ch (®¹i)", -1},
	["6,1,2127"] = {1, "B¾c ®Èu luyÖn kim thuËt (QuyÓn 1)", -1, 6},
	["6,1,2160"] = {1, "B¾c ®Èu luyÖn kim thuËt (QuyÓn 2)", -1, 7},
	["6,1,2161"] = {1, "B¾c ®Èu luyÖn kim thuËt (QuyÓn 3)", -1, 8},
	["6,1,2162"] = {1, "B¾c ®Èu luyÖn kim thuËt (QuyÓn 4)", -1, 9},
}

TB_GOLD2PLANITA_ITEM = {
	["6,1,1473"] = {1, "L«i Tr¹ch Chïy", -1},
}
TB_GOLD2PLANITA_ITEM_SP1	= {
	["6,1,1473"] = {1, "L«i Tr¹ch Chïy", -1},
	["6,1,1740"] = {1, "Hçn ®én ®Ünh", -1},
}

tbUpGradeProcess = {
[1] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM,
				szErrorMsg = "<dec><npc>Ngo¹i trõ <color=yellow>trang bÞ hoµng kim<color>, chØ cã <color=yellow>L«i Tr¹ch Chïy<color> lµ thø nguyªn liÖu ta cÇn, xin mêi h·y lÊy nh÷ng thø nguyªn liÖu kh¸c ra!",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = TB_UPGRADEITEM_VALUE,
				szErrorMsg = "<dec><npc>Ngoµi <color=yellow>trang bÞ B¹ch Kim<color>, ta cßn cÇn  <color=yellow>m¶nh Bæ Thiªn Th¹ch<color> n÷a, xin h·y gi÷ l¹i nh÷ng thø kh¸c.",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
[4] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM_SP1,
				szErrorMsg = "<dec><npc>Ngo¹i trõ <color=yellow>trang bÞ hoµng kim<color>, chØ cã <color=yellow>L«i Tr¹ch Chïy vµ Hçn §én §Ønh<color> lµ nh÷ng nguyªn liÖu ta cÇn, xin mêi h·y bá nh÷ng nguyªn liÖu kh¸c ra.",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
}

function writeRecoinLog(szTitle, szLog)
	WriteLog(format("  %s\t%s\tNAME:%s\tACCOUNT:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"), szTitle,GetName(),GetAccount()));
	WriteLog(format("  %s\t%s", GetLocalDate("%Y-%m-%d %H:%M:%S"), szLog));
end;
