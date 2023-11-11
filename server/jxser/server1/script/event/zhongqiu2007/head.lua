--2007ÖÐÇï½Ú»î¶¯
--by Ð¡ÀË¶à¶à
--2007-09-06

DA_ZHONGQIU2007_START = 0709220000	--¿ªÊ¼Ê±¼ä
DA_ZHONGQIU2007_END 	= 0710142400	--½áÊøÊ±¼ä
NZHONGQIU2007_LIHE_MAX = 400000000	--ÀñºÐ¾­ÑéÉÏÏÞ
NZHONGQIU2007_MAX = 400000000				--ÔÂ±ý¾­ÑéÉÏÏÞ
TSK_ZHONGQIU2007_LIHE = 1844				--ÀñºÐ¾­ÑéÉÏÏÞ±äÁ¿
TSK_ZHONGQIU2007 = 1843							--ÔÂ±ý¾­ÑéÉÏÏÞ±äÁ¿
ZHONGQIU_LEVEL = 50		--µÈ¼¶ÏÞÖÆ
SZYUEBING = ""				--´æÈ¡Àà±ðÃû
TSK_TEMP = 51					--Àà±ðÁÙÊ±±äÁ¿

tb_content =
{
	sztalk1 = "Thî lµm b¸nh: ThËt tho¶i m¸i, ta ®ang nghØ ng¬i vµi ngµy.",
	sztalk2 = "Thî lµm b¸nh: L¹i ®Õn Trung Thu n÷a råi, tay nghÒ lµm b¸nh cña ta ai còng biÕt ®Õn, mçi n¨m cã kh«ng Ýt nh©n sü ®Õn t×m ta gióp lµm b¸nh, kh¸ch quan cÇn g× ¹?",
	szgetlvdou = "Ta muèn lµm 1 c¸i b¸nh ®Ëu xanh/#makeyuebing(1)",
	szgetlianzi = "Ta muèn lµm 1 c¸i b¸nh h¹t sen/#makeyuebing(2)",
	szgetkaoji = "Ta muèn lµm 1 c¸i b¸nh Trung Thu gµ n­íng/#makeyuebing(3)",
	szkaozhu = "Ta muèn lµm 1 c¸i b¸nh Trung Thu heo quay/#makeyuebing(4)",
	szlihe = "Ta muèn lµm 1 hép b¸nh Trung Thu/#makeyuebing(5)",
	szno = "Nh©n tiÖn ghÐ qua th«i/NoChoice",
	szmakeItemUI = "§óng vËy, ta muèn lµm b¸nh Trung Thu/makeItemUI",
	szlevel = "ThËt ®¸ng tiÕc, ®¼ng cÊp kh«ng ®ñ 50, kh«ng thÓ tham gia ho¹t ®éng nµy.",
	szmoney = "ThËt ®¸ng tiÕc, ng©n l­îng mang theo kh«ng ®ñ.",
	szpay = "ThËt ®¸ng tiÕc, ng­êi ch¬i ch­a n¹p thÎ, kh«ng thÓ dïng b¸nh Trung Thu.",
	szremake = "Trë l¹i/main",
	
}

--ÀñºÐ»ñµÃ²ÄÁÏºÍ¼¸ÂÊ
tb_Mareial_LIHE = 	
{
	100000,
	{
		{G=6,D=1,P=1207,nrate=0.0125	,szname="M¶nh tranh V©n Du"},
		{G=6,D=1,P=1208,nrate=0.0125	,szname="M¶nh tranh V©n Du"},
		{G=6,D=1,P=1209,nrate=0.0125	,szname="M¶nh tranh V©n Du"},
		{G=6,D=1,P=1210,nrate=0.0125	,szname="M¶nh tranh V©n Du"},
		{G=6,D=1,P=1211,nrate=0.0125	,szname="M¶nh tranh V©n Du"},
		{G=6,D=1,P=1212,nrate=0.0125	,szname="M¶nh tranh V©n Du"},
		{G=6,D=1,P=1213,nrate=0.0125	,szname="M¶nh tranh Tiªn Vò"},
		{G=6,D=1,P=1214,nrate=0.0125	,szname="M¶nh tranh Tiªn Vò"},
		{G=6,D=1,P=1215,nrate=0.0125	,szname="M¶nh tranh Tiªn Vò"},
		{G=6,D=1,P=1216,nrate=0.0125	,szname="M¶nh tranh Tiªn Vò"},
		{G=6,D=1,P=1217,nrate=0.0125	,szname="M¶nh tranh Tiªn Vò"},
		{G=6,D=1,P=1218,nrate=0.0125	,szname="M¶nh tranh Tiªn Vò"}
	}
}

--ÔÂ±ýÖÆ×÷ÐèÒª²ÄÁÏ
tb_Mareial =
{
	szlvdou = {
		{G=6,D=1,P=1510,szname="B¸nh ®Ëu xanh",num=1,nMoney=50000},
		{G=6,D=1,P=1503,szname="Tói bét",num=2},
		{G=6,D=1,P=1504,szname="Tói ®­êng",num=2},
		{G=6,D=1,P=1505,szname="Tói trøng",num=2},
		{G=6,D=1,P=1506,szname="Tói ®Ëu xanh",num=1},
		},
	szlianzi = {
		{G=6,D=1,P=1511,szname="B¸nh h¹t sen",num=1,nMoney=100000},
		{G=6,D=1,P=1503,szname="Tói bét",num=2},
		{G=6,D=1,P=1504,szname="Tói ®­êng",num=2},
		{G=6,D=1,P=1505,szname="Tói trøng",num=2},
		{G=6,D=1,P=1507,szname="Tói h¹t sen",num=1},
		},
	szkaoji = {
		{G=6,D=1,P=1512,szname="B¸nh Trung Thu gµ n­íng",num=1,nMoney=150000},
		{G=6,D=1,P=1503,szname="Tói bét",num=3},
		{G=6,D=1,P=1504,szname="Tói ®­êng",num=3},
		{G=6,D=1,P=1505,szname="Tói trøng",num=3},
		{G=6,D=1,P=1508,szname="Tói thÞt gµ",num=1},
		},
	szkaozhu = {
		{G=6,D=1,P=1513,szname="B¸nh Trung Thu heo quay",num=1,nMoney=200000},
		{G=6,D=1,P=1503,szname="Tói bét",num=4},
		{G=6,D=1,P=1504,szname="Tói ®­êng",num=4},
		{G=6,D=1,P=1505,szname="Tói trøng",num=4},
		{G=6,D=1,P=1509,szname="Tói thÞt heo",num=1},
		},
	szlihe = {
		{G=6,D=1,P=1514,szname="Hép b¸nh Trung Thu",num=1,nMoney=300000},
		{G=6,D=1,P=1510,szname="B¸nh ®Ëu xanh",num=1},
		{G=6,D=1,P=1511,szname="B¸nh h¹t sen",num=1},
		{G=6,D=1,P=1512,szname="B¸nh Trung Thu gµ n­íng",num=1},
		{G=6,D=1,P=1513,szname="B¸nh Trung Thu heo quay",num=1},
		},		
}

function funmsg()
		SZYUEBING = getTaskItemName()
		szmsg = format("Chóc mõng b¹n ®· nhËn ®­îc %d <color=yellow>%s<color>.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"])
		return szmsg
end

function funtalkmake()
		SZYUEBING = getTaskItemName()
		sztalkmake = format("Thî lµm b¸nh: Muèn lµm %d c¸i <color=red>%s<color> cÇn %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> vµ %d l­îng, ng­¬i ®ång ý kh«ng?",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmake
end

function funtalkmlimit()
		SZYUEBING = getTaskItemName()
		sztalkmlimit= format("Thî lµm b¸nh: Nguyªn liÖu mang theo kh«ng ®ñ, lµm %d <color=red>%s<color> cÇn %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> vµ %d l­îng.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmlimit
end

function fungiveitemui()
		SZYUEBING = getTaskItemName()
		szgiveitemui= format("Thî lµm b¸nh: Muèn lµm %d %s cÇn %d %s, %d %s, %d %s, %d %s vµ %d l­îng.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return szgiveitemui
end

function check_zhongqiu2007_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > DA_ZHONGQIU2007_START ) and ( ndate < DA_ZHONGQIU2007_END ) ) then
		return 1
	end
	return 0
end

function check_item(szItemKey)	--ÅÐ¶ÏÎïÆ·ÊÇ·ñ´æÔÚ
	SZYUEBING = getTaskItemName()
	for nkey, tb_item in tb_Mareial[SZYUEBING] do
			local szkey = tb_item["G"]..","..tb_item["D"]..","..tb_item["P"]
			if nkey ~= 1 then
					if szkey == szItemKey then
						return 1
					end
			end
	end
	return 0
end
function check_level()		--ÅÐ¶ÏµÈ¼¶
	if GetLevel() < ZHONGQIU_LEVEL then
		return 0
	end 
	return 1
end

function check_money()		--ÅÐ¶ÏÇ®
	SZYUEBING = getTaskItemName()
	if GetCash() < tb_Mareial[SZYUEBING][1]["nMoney"]then
		return 0
	end
	return 1
end

function check_pay()		--ÅÐ¶Ï³äÖµÓÃ»§
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function pack(...)
	return arg
end

function getTaskItemName()		--»ñµÃtbÀà±ðÃû
	if GetTaskTemp(TSK_TEMP) == 1 then
		return "szlvdou"
	end
	if GetTaskTemp(TSK_TEMP) == 2 then
		return "szlianzi"
	end
	if GetTaskTemp(TSK_TEMP) == 3 then
		return "szkaoji"
	end
	if GetTaskTemp(TSK_TEMP) == 4 then
		return "szkaozhu"
	end
	if GetTaskTemp(TSK_TEMP) == 5 then
		return "szlihe"
	end
	return "szlvdou"
end

