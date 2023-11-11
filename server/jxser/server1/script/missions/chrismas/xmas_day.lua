-- Created by Danielsun 2006-12-07
-- Ê¥µ®½Ú»î¶¯
-- xmas_entry()
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\basic.lua")

TB_SnowMan = {
	-- 1.[³É¹¦]Ñ©ÈËÃû 2.[³É¹¦]Ñ©ÈËID 3.[³É¹¦]¼¸ÂÊ 4.[Ê§°Ü]Ñ©ÈËÃû 5.[Ê§°Ü]Ñ©ÈËID 6.[Ê§°Ü]¼¸ÂÊ 7,½ðÇ® 8,»»È¡ÀñÆ·Ãû 9,»»È¡ÀñÆ·ID
	{"Ng­êi tuyÕt choµng kh¨n xanh (®Æc biÖt)",  1319,   60,   "Ng­êi tuyÕt choµng kh¨n xanh (th­êng)",    1322,  40,	1000,	"B¸nh bÝ ®á", 1325},
	{"Ng­êi tuyÕt choµng kh¨n ®á (®Æc biÖt)",  1320,   60,   "Ng­êi tuyÕt choµng kh¨n ®á (th­êng)",    1323,  40,	3000,	"B¸nh kem",	1326},
	{"Ng­êi tuyÕt ®Æc biÖt",  					1321,   80,   					 "Ng­êi tuyÕt th­êng",    1324,  20,	5000,			"Gµ l«i", 1327},
}

TB_Material = {
 --1.ÎïÆ·Ãû	2.ÊýÁ¿
 [1319] ={
	["6,1,1312"] = {"Hoa TuyÕt ",			10	},
	["6,1,1313"] =	{"Cµ rèt",		1	},
	["6,1,1314"] =	{"Cµnh th«ng",	2	},
	["6,1,1315"] =	{"Nãn gi¸ng sinh",		1	},
	["6,1,1316"] =	{"Kh¨n choµng xanh",	1	},
	},
 [1320] ={
	["6,1,1312"] = {"Hoa TuyÕt ",			10	},
	["6,1,1313"] =	{"Cµ rèt",		1	},
	["6,1,1314"] =	{"Cµnh th«ng",	2	},
	["6,1,1315"] =	{"Nãn gi¸ng sinh",		1	},
	["6,1,1317"] =	{"Kh¨n choµng ®á",	1	},
	},
 [1321] ={
	["6,1,1312"] = {"Hoa TuyÕt ",			10	},
	["6,1,1313"] =	{"Cµ rèt",		1	},
	["6,1,1314"] =	{"Cµnh th«ng",	2	},
	["6,1,1315"] =	{"Nãn gi¸ng sinh",		1	},
	["6,1,1318"] =	{"C©y th«ng ",		1	},
	},
}

TB_Message = {
	-- ÖÆ×÷ÃèÊö
	"Lµm ng­êi tuyÕt choµng kh¨n xanh (®Æc biÖt) cÇn 10 b«ng tuyÕt, 1 cµ rèt, 2 cµnh th«ng, 1 nãn, 1 kh¨n choµng ®á vµ 1000 l­îng.",
	"Lµm ng­êi tuyÕt choµng kh¨n ®á (®Æc biÖt) cÇn 10 b«ng tuyÕt, 1 cµ rèt, 2 cµnh th«ng, 1 nãn, 1 kh¨n choµng xanh vµ 3000 l­îng.",
	"Lµm ng­êi tuyÕt (®Æc biÖt) cÇn 10 b«ng tuyÕt, 1 cµ rèt, 2 cµnh th«ng, 1 nãn, 1 c©y th«ng vµ 5000 l­îng.",
}

GiftMsg = {
	-- »»È¡ÀñÎïÃèÊö
	"§æi b¸nh bÝ ®á cÇn mét ng­êi tuyÕt choµng kh¨n ®á (®Æc biÖt)",
	"§æi b¸nh kem cÇn mét ng­êi tuyÕt choµng kh¨n xanh (®Æc biÖt)",
	"§æi gµ l«i cÇn mét ng­êi tuyÕt ®Æc biÖt",
}

TSKTMP_ITEM_NUMC = 20;

function xmas_entry()
	aryDescribe = {
		"<dec><npc>§æi quµ gi¸ng sinh",
		"Lµm ng­êi tuyÕt/want_snowman",
		"§æi quµ/want_gift",
		"Ta cã viÖc, khi kh¸c quay l¹i/cancel",
		}
	CreateTaskSay(aryDescribe)
end
	
function want_snowman()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>Ho¹t ®éng ®· kÕt thóc.", "Ta biÕt råi/cancel"});
		return 
	end;
	aryDescribe = {
		"<dec><npc>Cã nhiÒu lo¹i ng­êi tuyÕt, nguyªn liÖu mçi lo¹i sÏ kh¸c nhau, ng­¬i muèn lµm lo¹i nµo?",
		"T¹o ng­êi tuyÕt choµng kh¨n xanh (®Æc biÖt)/#do_snowman(1)",
		"T¹o ng­êi tuyÕt choµng kh¨n ®á (®Æc biÖt)/#do_snowman(2)",
		"T¹o ng­êi tuyÕt ®Æc biÖt/#do_snowman(3)",
		"Ta cã viÖc, khi kh¸c quay l¹i/cancel",
	}
	CreateTaskSay(aryDescribe)
end

function do_snowman(snown)
	SetTaskTemp(TSKTMP_ITEM_NUMC, snown);
	aryDescribe = TB_Message[snown]
	GiveItemUI("Lµm ng­êi tuyÕt",aryDescribe,"do_snow_process","cancel",1)
end

function do_snow_process(nItemCount)
	local nItemNumC = GetTaskTemp(TSKTMP_ITEM_NUMC);
	local nItemPart = TB_SnowMan[nItemNumC][2]
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material[nItemPart] do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	
	--¼ì²âÎïÆ·Æ¥Åä
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		if(GetCash() < TB_SnowMan[nItemNumC][7]) then
			aryDescribe = {
				"<dec><npc>Lµm ng­êi tuyÕt cÇn ph¶i cã"..TB_SnowMan[nItemNumC][7].."tiÒn , tiÒn trªn ng­êi ng­¬i kh«ng ®ñ",
				"BiÕt råi/cancel"
				}
			CreateTaskSay(aryDescribe)
			return
		end
		
		if (TB_Material[nItemPart][szItemKey] == nil) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", c¸i nµy"..GetItemName(nCurItemIdx)..", ta kh«ng cÇn c¸i nµy, ng­¬i h·y nhËn l¹i ®i",
												"§Ó ta lµm l¹i!/#do_snowman("..nItemNumC..")",
												"Ta sÏ quay l¹i sau./cancel"	}	);
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		tb_enhanceitem_count[szItemKey][2] = nCurItemName;
		if(tb_enhanceitem_count[szItemKey][1] > TB_Material[nItemPart][szItemKey][2] ) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", nh­ng ta kh«ng cÇn nhiÒu ®Õn thÕ <color=yellow>"..nCurItemName.."<color>Vui lßng bá nh÷ng mãn kh«ng cÇn thiÕt ra ngoµi.",
													"§Ó ta lµm l¹i!/#do_snowman("..nItemNumC..")",
													"Ta sÏ quay l¹i sau./cancel"	}	);
				return
		end
	end
	
	for szkey, tb_item in TB_Material[nItemPart] do
			if (tb_enhanceitem_count[szkey][1] ~= TB_Material[nItemPart][szkey][2]) then
				CreateTaskSay( { "<dec><npc> Ng­¬i quªn bá nguyªn liÖu vµo råi <color=yellow>"..tb_enhanceitem_count[szkey][2].."<color> kh«ng ®ñ. Kh«ng ®ñ nguyªn liÖu, ta kh«ng lµm ®­îc.",
			"§Ó ta lµm l¹i!/#do_snowman("..nItemNumC..")",
			"Ta sÏ quay l¹i sau./cancel"	}	);
				return
			end
	end
		
	--É¾²ÄÁÏ
	for i=1, nItemCount do
		local nIdx = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog("[T¹o ng­êi tuyÕt]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t Xãa vËt phÈm thÊt b¹i\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	Pay(TB_SnowMan[nItemNumC][7])
	
	 --¸øÎïÆ·
	 local str = "";
	 PItem = random() * 100;
	if(PItem < TB_SnowMan[nItemNumC][3]) then
	 
		str = "ChÕ t¹o thµnh c«ng <color=yellow>"..TB_SnowMan[nItemNumC][1].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][2],1,0,0)
	else
		str = "ChÕ t¹o thµnh c«ng <color=yellow>"..TB_SnowMan[nItemNumC][4].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][5],1,0,0)
	end
	Msg2Player(str)
	WriteLog("[T¹o ng­êi tuyÕt]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str);
end

function want_gift()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>Ho¹t ®éng ®· kÕt thóc.", "Ta biÕt råi/cancel"});
		return 
	end;
	aryDescribe = {"<dec><npc>§æi c¸c mãn quµ t­¬ng øng sau:\n Ng­êi tuyÕt th¾t kh¨n xanh---B¸nh bÝ ®á\n Ng­êi tuyÕt th¾t kh¨n ®á---B¸nh kem\n Ng­êi tuyÕt ®Æc biÖt---Gµ l«i \n Lùa chän ®æi quµ.",
								 "B¸nh bÝ ®á/#do_gift(1)",
								 "B¸nh kem/#do_gift(2)",
								 "Gµ l«i/#do_gift(3)",
								 "T¹m thêi kh«ng ®æi/cancel",
		}
		CreateTaskSay(aryDescribe)
end

function do_gift(ngift)
		local Gcount = CalcEquiproomItemCount(6,1,TB_SnowMan[ngift][2],1)
		if(Gcount == 0) then
			Talk(1,"","Trªn ng­êi ng­¬i kh«ng cã"..TB_SnowMan[ngift][1]..". Kh«ng thÓ ®æi quµ"..TB_SnowMan[ngift][8]..".")
		else  
			ConsumeEquiproomItem(1,6,1,TB_SnowMan[ngift][2],1)
			AddItem(6,1,TB_SnowMan[ngift][9],1,0,0)
			Msg = "B¹n ®· ®æi thµnh c«ng"..TB_SnowMan[ngift][8]
			Msg2Player(Msg)
			WriteLog("[T¹o ng­êi tuyÕt]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t exchange "..GetItemName(GetGiveItemUnit(i)).." for "..TB_SnowMan[ngift][8]);
		end
end


function pack(...)
	return arg
end

function cancel()
	SetTaskTemp(TSKTMP_ITEM_NUMC, 0);
end