Include("\\script\\activitysys\\config\\18\\awardlist.lua")
EVENT_LOG_TITLE		= "EVENT_THANG3_2013"
MIN_LEVEL		= 150

END_DATE = 20130401

ITEM_ROSE_BAG		= {szName="Tói Hoa Hång", tbProp={6,1,3474,1,0,0}, nExpiredTime=END_DATE}

ITEM_RED_ROSE = {szName="Hoa Hång §á", tbProp={6,1,3469,1,0,0}, nExpiredTime=END_DATE}
ITEM_YELLOW_ROSE = {szName="Hoa Hång Vµng", tbProp={6,1,3472,1,0,0}, nExpiredTime=END_DATE}
ITEM_GREEN_ROSE = {szName="Hoa Hång Lôc", tbProp={6,1,3471,1,0,0}, nExpiredTime=END_DATE}
ITEM_WHITE_ROSE		= {szName="Hoa Hång Tr¾ng", tbProp={6,1,3470,1,0,0}, nExpiredTime=END_DATE}

ITEM_BLUE_ROSE = {szName="Hoa Hång Lam", tbProp={6,1,3473,1,0,0}, nExpiredTime=END_DATE}

ITEM_YELLOW_ROSE_BAG		= {szName="Tói H­¬ng Hoa Hång Vµng", tbProp={6,1,3475,1,0,0}, nExpiredTime=END_DATE}
ITEM_GREEN_ROSE_BAG		= {szName="Tói H­¬ng Hoa Hång Xanh", tbProp={6,1,3477,1,0,0}, nExpiredTime=END_DATE}
ITEM_RED_ROSE_BAG		= {szName="Tói H­¬ng Hoa Hång §á", tbProp={6,1,3476,1,0,0}, nExpiredTime=END_DATE}

ITEM_YELLOW_ROSE_BAG_ADV		= {szName="Tói H­¬ng Hoa Hång Vµng Cao CÊp", tbProp={6,1,3478,1,0,0}, nExpiredTime=END_DATE}
ITEM_GREEN_ROSE_BAG_ADV		= {szName="Tói H­¬ng Hoa Hång Xanh Cao CÊp", tbProp={6,1,3480,1,0,0}, nExpiredTime=END_DATE}
ITEM_RED_ROSE_BAG_ADV		= {szName="Tói H­¬ng Hoa Hång §á Cao CÊp", tbProp={6,1,3479,1,0,0}, nExpiredTime=END_DATE}

TSK_YELLOW_BAG = 1
TSK_GREEN_BAG = 2
TSK_RED_BAG = 3

TSK_YELLOW_BAG_ADV = 4
TSK_GREEN_BAG_ADV = 5
TSK_RED_BAG_ADV = 6 

TSK_USE_YELLOW_BAG = 7
TSK_USE_GREEN_BAG = 8
TSK_USE_RED_BAG = 9

TSK_USE_YELLOW_BAG_ADV = 10
TSK_USE_GREEN_BAG_ADV = 11
TSK_USE_RED_BAG_ADV = 12

--MAX_YELLOW = {MAN, WOMAN}
MAX_YELLOW = {400, 480}
MAX_GREEN = {300, 360}
MAX_RED = {200, 240}

MAX_YELLOW_ADV = {800, 800}
MAX_GREEN_ADV = {400, 400}
MAX_RED_ADV = {400, 400}

MAX_EXCHANGE_YELLOW = {1200, 1280}
MAX_EXCHANGE_GREEN = {700, 760}
MAX_EXCHANGE_RED = {600, 640}

MAX_EXCHANGE_YELLOW_ADV = {800, 800}
MAX_EXCHANGE_GREEN_ADV = {400, 400}
MAX_EXCHANGE_RED_ADV = {400, 400}

TEXT_DLG_TITLE_1		= "Ngµy Quèc TÕ Phô N÷ l¹i ®Õn råi, ®ång ®¹o nhanh tay thu thËp Hoa Hång ®Ó ®æi Tói Hoa Hång ®i"
TEXT_ACTIVITY_NPC_NAME		= "§¹i sø ho¹t ®éng"
TEXT_DLG_OPT_ACT_INFO		= "Giíi thiÖu ho¹t ®éng"
TEXT_DLG_OPT_ITEM_SOURCE		= "VËt phÈm sinh ra"
TEXT_DLG_OPT_AWARD		= "§æi thµnh phÇn th­ëng"
TEXT_DLG_TITLE_ACT_INFO		= "Thêi gian ho¹t ®éng: sau khi b¶o tr× ngµy 03/03/2013 ®Õn 24:00h ngµy 31/03/2013<enter>Giíi h¹n ho¹t ®éng: cÊp 150 trë lªn, kh«ng giíi h¹n cÊp trïng sinh<enter>Gi¶i thÝch ho¹t ®éng: trong thêi gian ho¹t ®éng, ng­êi ch¬i th«ng qua tham gia c¸c hÖ thèng cña game cã thÓ nhËn ®­îc Tói Hoa Hång, më Tói Hoa Hång ra nhËn ngÉu nhiªn mµu Hoa Hång. T¹i n¬i c¸c ®¹i sø ho¹t ®éng (<color=red>thµnh §¹i Lý (202/198),Thµnh §« thµnh (393/316), L©m An (180/204)<color>) cã thÓ sö dông nhãm Hoa Hång kh¸c nhau ®æi phÇn th­ëng kh¸c nhau. Chi tiÕt Tói Hoa Hång sinh ra mêi xem vËt phÈm sinh ra, <color=red> §¹i HiÖp ph¶i dù tr÷ kh«ng gian tói ®å nhÐ<enter><color>"
TEXT_DLG_TITLE_ITEM_SOURCE		= "VËt phÈm sinh ra: c¸c vÞ §¹i HiÖp tham gia ho¹t ®éng h»ng ngµy cña hÖ thèng ®Òu cã thÓ nhËn ®­îc Tói Hoa Hång, vÝ dô: Tèng Kim, v­ît ¶i, Phong L¨ng §é, Viªm §Õ…Hoa Hång Lam quý b¸u sÏ b¸n ë K× Tr©n C¸c nhÐ"
TEXT_EHCANGE_ROSE_BAG_DIRECTLY		= "§æi trùc tiÕp"
TEXT_EXCHANGE_ADV_BAG_YELLOW		= format("§æi %s", ITEM_YELLOW_ROSE_BAG_ADV.szName)
TEXT_EXCHANGE_ADV_BAG_GREEN		= format("§æi %s", ITEM_GREEN_ROSE_BAG_ADV.szName)
TEXT_EXCHANGE_ADV_BAG_RED		= format("§æi %s", ITEM_RED_ROSE_BAG_ADV.szName)
TEXT_NO_ENOUGH_ITEM_CELL = "Do tói cña ng­¬i ®· ®Çy kh«ng thÓ nhËn phÇn th­ëng. LÇn sau tham gia nhí chó ý ®Ó trèng tói"
TEXT_ACT_NOT_START = "Ho¹t ®éng vÉn ch­a b¾t ®Çu"
TEXT_ACT_END = "Ho¹t ®éng ®· kÕt thóc"
TEXT_ROSE_CANT_USE_MORE = "Sè lÇn sö dông lo¹i Tói Hoa Hång nµy ®· ®¹t ®Õn giíi h¹n"
TEXT_ROSE_CANT_EXCHANGE_MORE = "Sè lÇn ®æi lo¹i Tói Hoa Hång nµy ®· ®¹t ®Õn giíi h¹n, ®æi c¸i kh¸c ®i"
TEXT_ROSE_SELECT_WAY = "Lùa chän ph­¬ng thøc ®æi:"
TEXT_DLG_EXCHANGED_TITLE = "Tói H­¬ng ng­¬i ®· ®æi nh­ sau:"

LOG_FORMAT = {
	["6,1,3475"] = {
		nTaskId = TSK_YELLOW_BAG,
		szAll = "TuiHuongHoaHongVang",
		Sex = {"NhanVatNamNop%dTuiHuongHoaHongVang","NhanVatNuNop%dTuiHuongHoaHongVang"},
		[100] = 1,
		[200] = 1,
		[300] = 1,
		[400] = 1,
		[480] = 1,
	},
	["6,1,3476"] = {
		nTaskId = TSK_RED_BAG,
		szAll = "TuiHuongHoaHongDo",
		Sex = {"NhanVatNamNop%dTuiHuongHoaHongDo","NhanVatNuNop%dTuiHuongHoaHongDo"},
		[100] = 1,
		[200] = 1,
		[240] = 1,
	},
	["6,1,3477"] = {
		nTaskId = TSK_GREEN_BAG,
		szAll = "TuiHuongHoaHongXanh",
		Sex = {"NhanVatNamNop%dTuiHuongHoaHongXanh","NhanVatNuNop%dTuiHuongHoaHongXanh"},
		[100] = 1,
		[200] = 1,
		[300] = 1,
		[360] = 1,
	},
	["6,1,3478"] = {
		nTaskId = TSK_YELLOW_BAG_ADV,
		szAll = "TuiHuongHoaHongVangCaoCap",
		Sex = {"Nop%dTuiHuongHoaHongVangCaoCap","Nop%dTuiHuongHoaHongVangCaoCap"},
		[100] = 1,
		[200] = 1,
		[300] = 1,
	},
	["6,1,3479"] = {
		nTaskId = TSK_RED_BAG_ADV,
		szAll = "TuiHuongHoaHongDoCaoCap",
		Sex = {"Nop%dTuiHuongHoaHongDoCaoCap","Nop%dTuiHuongHoaHongDoCaoCap"},
		[100] = 1,
	},
	["6,1,3480"] = {
		nTaskId = TSK_GREEN_BAG_ADV,
		szAll = "TuiHuongHoaHongXanhCaoCap",
		Sex = {"Nop%dTuiHuongHoaHongXanhCaoCap","Nop%dTuiHuongHoaHongXanhCaoCap"},
		[100] = 1,
		[200] = 1,
	},
}

ROSE_BAG_AWARD = {
	{szName=ITEM_YELLOW_ROSE.szName, tbProp=ITEM_YELLOW_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
	{szName=ITEM_GREEN_ROSE.szName, tbProp=ITEM_GREEN_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
	{szName=ITEM_WHITE_ROSE.szName, tbProp=ITEM_WHITE_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
	{szName=ITEM_RED_ROSE.szName, tbProp=ITEM_RED_ROSE.tbProp, nExpiredTime=END_DATE, nRate=25},
}

YELLOW_ROSE_BAG_AWARD = {szName = "§iÓm kinh nghiÖm", nExp = 1e6 }

GREEN_ROSE_BAG_AWARD = {szName = "§iÓm kinh nghiÖm", nExp = 2e6, }

RED_ROSE_BAG_AWARD = {
 	[1] = tbAward_C,
 	[2] = {
				{szName = "§iÓm kinh nghiÖm", nExp = 2e6, nRate = 50},
				{szName = "§iÓm kinh nghiÖm", nExp = 3e6, nRate = 35},
				{szName = "§iÓm kinh nghiÖm", nExp = 4e6, nRate = 15},
			}
 }

YELLOW_ROSE_BAG_ADV_AWARD = {
	{szName = "§iÓm kinh nghiÖm", nExp = 5e6, nRate = 50},
	{szName = "§iÓm kinh nghiÖm", nExp = 6e6, nRate = 30},
	{szName = "§iÓm kinh nghiÖm", nExp = 7e6, nRate = 20},
}

GREEN_ROSE_BAG_ADV_AWARD = {
	{szName = "§iÓm kinh nghiÖm", nExp = 5e6, nRate = 50},
	{szName = "§iÓm kinh nghiÖm", nExp = 6e6, nRate = 30},
	{szName = "§iÓm kinh nghiÖm", nExp = 7e6, nRate = 20},
}

RED_ROSE_BAG_ADV_AWARD = {
	{szName = "§iÓm kinh nghiÖm", nExp = 8e6, nRate = 50},
	{szName = "§iÓm kinh nghiÖm", nExp = 9e6, nRate = 30},
	{szName = "§iÓm kinh nghiÖm", nExp = 10e6, nRate = 20},
}
