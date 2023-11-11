\settings\global\exchangeshop\shop.txt
ËµÃ÷£ºÉÌµêÅäÖÃ±í
ÅäÖÃÒªµã£ºÅäÖÃÉÌµêID£¬ÅäÖÃÖ¸¶¨ÉÌµê³öÊÛÄÄĞ©ÉÌÆ·ID
ShopId£ºÉÌµêID£¬´Ó1¿ªÊ¼£¬ÒÀ´ÎµİÔö
Item1~Item20£ºÉÌÆ·ID£¨Ò»¸öÉÌµê³öÊÛÉÌÆ·×î¶àÊıÁ¿Îª20¸ö£¬ÉÌÆ·ID¹ØÁª\settings\global\exchangeshop\goods.txt£©

Ê¹ÓÃ·½·¨£º
?gm ds Include("\\script\\global\\exchangeshop\\main_s.lua")
?gm ds tbExchangeShopServer:OpenExchangeShop(nShopId) --´ò¿ªÖ¸¶¨µÄÉÌµê

\settings\global\exchangeshop\goods.txt
ËµÃ÷£ºÉÌÆ·ÅäÖÃ±í
ÅäÖÃÒªµã£ºÅäÖÃÉÌÆ·ID£¬¸ù¾İ¾ßÌå²ÎÊıÇé¿ö¾ßÌåÅäÖÃ
ItemId£ºÉÌÆ·ID£¬´Ó1¿ªÊ¼£¬ÒÀ´ÎµİÔö
ItemGenre£ºµÀ¾ß³£ÓÃ²ÎÊı£¬²Î¿¼magicscript.txt
ItemDetailType£ºµÀ¾ß³£ÓÃ²ÎÊı£¬²Î¿¼magicscript.txt
ParticularType£ºµÀ¾ß³£ÓÃ²ÎÊı£¬²Î¿¼magicscript.txt
Level£ºµÀ¾ß³£ÓÃ²ÎÊı£¬²Î¿¼magicscript.txt
nCount£º¸ÃÉÌÆ·µÃµ½µÄÊıÁ¿
SaleBeginDate£º³öÊÛ¿ªÊ¼ÈÕÆÚ£¬¿É²»ÌîĞ´
SaleEndDate£º³öÊÛ½áÊøÈÕÆÚ£¬¿É²»ÌîĞ´
ExpiredTime£ºÓĞĞ§ÆÚ£¬µ¥Î»·ÖÖÓ
tbCostId£ºÅäÖÃÏûºÄID£¨ÏûºÄID¹ØÁª\settings\global\exchangeshop\cost.txt£©£¬¿ÉÒÔÊ¹ÓÃÓ¢ÎÄ×ÖÄ¸¶ººÅ·Ö¸ô¶à¸öÏûºÄID£¬ÒâÎ¶×Å¸ÃÉÌÆ·ĞèÒª¶à¸öÏûºÄÌõ¼ş
nTaskid	nBitPos	nBitCount£¨ÈıÁĞÓÉ³ÌĞò¿ª·¢ÈËÔ±ÅäÖÃ£¬¼ÇÂ¼¹ºÂòĞÅÏ¢£©
nMaxGetNum£º×î¶àÊÛÂôµÄ´ÎÊı
nBind£ºÊÇ·ñ°ó¶¨
szComment£ºÉÌÆ·ÎÄ×ÖËµÃ÷

\settings\global\exchangeshop\cost.txt
ËµÃ÷£ºÏûºÄÅäÖÃ±í
CostId£ºÏûºÄID£¬´Ó1¿ªÊ¼£¬ÒÀ´ÎµİÔö
ParamKey£º¹Ì¶¨ÌîĞ´ "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE, ITEM, CUSTOM"ÖĞµÄÒ»¸ö£¬´ú±íÏûºÄÀàĞÍ¡°»õ±Ò£¬ ÎïÆ·´ú±Ò£¬ÈÎÎñ±äÁ¿´ú±Ò£¬magicscriptÎïÆ·£¬×Ô¶¨ÒåÀàĞÍ¡±
ParamDetail£º£¨¸ù¾İParamKeyµÄÌîĞ´£¬ÔÙ¾ßÌåÏ¸·ÖParamDetail£¬´ú±í²»Í¬º¬Òå£©£¬
Èç¹ûÊÇ ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE"µÄÖµ£¬Ôò ParamDetailµÄÖµÎªÒÔÏÂÖĞÒ»ÖÖ
ºÍ\swordonline\gameworld\include\GameDataDef.h¶¨ÒåµÄÃ¶¾ÙÖµÒ»ÖÂ
CURRENCYTYPE_MONEY			= 1,	// ½£ÏÀ±Ò
CURRENCYTYPE_FUYUAN			= 2,	// ¸£Ôµ
CURRENCYTYPE_COIN			= 3,	// Í­Ç®
CURRENCYTYPE_SCORE			= 4,	// »ı·Ö
CURRENCYTYPE_GOLDCOIN		= 5,	// ½ğ±Ò
CURRENCYTYPE_SLIVER			= 6,	//Òø±Ò£¨·ÏÆú£©
CURRENCYTYPE_TICKET			= 7,	//Æ±×Ó£¨·ÏÆú£©
CURRENCYTYPE_YUANBAO		= 8,	//Ôª±¦£¨·ÏÆú£©
CURRENCYTYPE_GOLDCOIN_NEW	= 9,	// ĞÂ½ğ±Ò£¬ÒÔÇø·ÖÓëÌ¨ÍåµÄ»õ±Ò
CURRENCYTYPE_CONTRIBUTION	= 10,	// ¹±Ï×¶È
CURRENCYTYPE_HONOUR			= 11,	// ÁªÈüÈÙÓşµãÊı
CURRENCYTYPE_GOLDCOIN_SCORE = 12,	// ½ğ±Ò»ı·Ö
CURRENCYTYPE_RESPECT		= 13,	// ÍşÍû
CURRENCYTYPE_REFINING		= 14,	// ¾«Á¶Ê¯
CURRENCYTYPE_ENERGY			= 15,	// ¾«Á¦
CURRENCYTYPE_ARENA_CREDITS	= 16,	// ¾º¼¼³¡ÈÙÓşÑ«ÕÂ
CURRENCYTYPE_ITEM_LONGLINGQI	= 17,	// ÁúÁîÆì	6,1,3056
CURRENCYTYPE_ITEM_LINLINGQI		= 18,	// ÷ëÁîÆì 6,1,3057
CURRENCYTYPE_ITEM_GUILINGQI		= 19,	// ¹êÁîÆì	6,1,3059
CURRENCYTYPE_ITEM_FENGLINGQI	= 20,	// ·ïÁîÆì	6,1,3058
CURRENCYTYPE_ITEM_WUXINGQISHI	= 21,	// ÎåĞĞÆæÊ¯	6,1,2125
CURRENCYTYPE_ITEM_XINGXIALING	= 22,	// ĞĞÏÀÁî	6,1,2566
CURRENCYTYPE_TASK_SJGX			= 23,	//Ğ¡ËÎ½ğ¹¦Ñ«  ÈÎÎñ±äÁ¿ID = 3450
CURRENCYTYPE_TASK_GUTA		= 24, //¹ÅËş»ı·Ö ÈÎÎñ±äÁ¿ID = 4164
CURRENCYTYPE_XINGYU			= 25,	// ĞÇÓñ ĞÇÓñµÀ¾ßÌØÊâ´¦Àí£¬Ô­±¾Ó¦¸ÃÊÇ¶¨ÒåÎª´ú±ÒµÄ 6,1,4546
CURRENCYTYPE_TASK_DIANQUAN	= 26,	//½õĞåµãÈ¯ ÈÎÎñ±äÁ¿ID = 4200

Param1£º
Èç¹û ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE"£¬ÔòÅäÖÃÎª¾ßÌåÏûºÄÖµ
Param1 == ÏûºÄÖµ

Èç¹û ParamKey == "ITEM", 
Param1 == GenreÖµ£¬
Param2 == nDetailÖµ£¬
Param3 == nParticularÖµ
Param4 == nLevelÖµ
Param5 == nCountÖµ£¬ÏûºÄÊıÁ¿

Èç¹ûParamKey == "CUSTOM",Ôò
Param1 == ÏûºÄÖµ
ParamDetail == ´Ó1¿ªÊ¼£¨×Ô¶¨ÒåµÄÖµ£¬Çø·ÖÃ¿Ò»¸ö×Ô¶¨µÄÏûºÄ£¬²»ÒªÖØ¸´£©
¶øÇÒĞèÒªÔÚ\script\global\exchangeshop\cost\costcustom.lua ×¢²á»ñÈ¡º¯Êı__GetValueºÍÏûºÄº¯Êı__CostValue£¬²Î¿¼°¸Àı
tbCostCustom:RegisterCostCustmonNode(ParamDetailKey, ParamDetailKeyName, __GetValue, __CostValue)
Param6£ºÔ¤Áô£¬ÔİÊ±ÎŞÓÃ

Comment£º¸Ã´ÎÏûºÄµ¥ÔªµÄËµÃ÷£¬ÓÃ×÷ÌáÊ¾

----------------------------------------------------------------------------------------------------------------------
File thiÕt lËp shop míi theo c¬ chÕ vËt ®æi vËt:
\settings\global\exchangeshop\shop.txt
ThuyÕt minh: ThiÕt lËp Shop
§iÓm quan träng cña thiÕt lËp: thiÕt lËp ID shop, thiÕt lËp ID nh÷ng vËt phÈm chØ ®Şnh sÏ ®­îc b¸n trong shop
ShopID: ID cña shop, b¾t ®Çu lµ 1, t¨ng dÇn
Item1~Item20 : ID vËt phÈm b¸n trong shop (mét shop chØ cã thÓ b¸n tèi ®a 20 vËt phÈm, ID vËt phÈm liªn quan ë \settings\global\exchangeshop\goods.txt )

Ph­¬ng ph¸p sö dông:
?gm ds Include("\\script\\global\\exchangeshop\\main_s.lua")
?gm ds tbExchangeShopServer:OpenExchangeShop(nShopId)
-- Më shop chØ ®Şnh

\settings\global\exchangeshop\goods.txt
ThuyÕt minh: B¶ng thiÕt lËp vËt phÈm b¸n trong shop
§iÓm quan träng cña thiÕt lËp: ThiÕt lËp ID vËt phÈm b¸n, dùa theo t×nh h×nh cô thÓ mµ thiÕt lËp
ItemID: ID vËt phÈm, b¾t ®Çu tõ 1, t¨ng dÇn
ItemGenre: Tham sè vËt phÈm th­êng dïng, tham kh¶o magicscript.txt
ItemDetailType: Tham sè vËt phÈm th­êng dïng, tham kh¶o magicscript.txt
ParticularType: Tham sè vËt phÈm th­êng dïng, tham kh¶o magicscript.txt
Level: Tham sè vËt phÈm th­êng dïng, tham kh¶o magicscript.txt
nCount: Sè l­îng ®¹t ®­îc cña vËt phÈm
SaleBeginDate: Ngµy b¾t ®Çu b¸n, cã thÓ kh«ng ®iÒn
SaleEndDate: Ngµy kÕt thóc b¸n, cã thÓ kh«ng ®iÒn
ExpiredTime: H¹n sö dông, tİnh b»ng phót
tbCostId: ThiÕt lËp ID ®¬n vŞ tiªu hao (ID tiªu hao liªn quan \settings\global\exchangeshop\cost.txt), cã thÓ dïng dÊu phÈy ®Ó ng¨n c¸ch nhiÒu ID ®¬n vŞ tiªu hao, ı lµ mua vËt phÈm cÇn tiªu hao nhiÒu lo¹i tµi nguyªn)
nTaskid	nBitPos	nBitCount (3 cét nµy do ng­êi dev thiÕt lËp, l­u log th«ng tin sè l­îng mua)
nTaskid: ID 32bit cña nhiÖm vô, tr­íc m¾t chØ dïng ®Ó dù phßng)
(4219, 4220, 4221, 4222, 4223, 4224, 4225, 4226, 4227, 4228)
nBitPos: VŞ trİ b¾t ®Çu
nBitCount : Sè l­îng
nMaxGetNum: Sè l­îng tèi ®a b¸n ra
nBind: Cã khãa hay kh«ng
szComment: ThuyÕt minh cña vËt phÈm ®­îc b¸n
Chó ı: Kh«ng hç trî c¬ chÕ lµm míi nhiÖm vô biÕn l­îng, nÕu cã nhu cÇu, cÇn ph¶i lµm míi thñ c«ng nhiÖm vô biÕn l­îng

\settings\global\exchangeshop\cost.txt
ThuyÕt minh:  B¶ng thiÕt lËp tiªu hao
CostID: ID tiªu hao, tõ 1, t¨ng dÇn
ParamKey: §iÒn cè ®Şnh
ViÕt 1 trong sè nh÷ng c¸i (CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE, ITEM, CUSTOM), t­¬ng øng víi lo¹i tiªu hao (tiÒn tÖ, vËt phÈm tiÒn tÖ, nhiÖm vô biÕn l­îng tiÒn tÖ, vËt phÈm magicscript, lo¹i tù ®Şnh nghÜa)

ParamDetail: (Dùa vµo ParamKey, sau ®ã tiÕp tôc ph©n chi tiÕt ParamDetail, sÏ mang ı nghÜa kh¸c nhau),
NÕu ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE", th× ParamDetail sÏ ®iÒn 1 trong sè nh÷ng lo¹i sau
Vµ \swordonline\gameworld\include\GameDataDef.h  ®Ó ®Şnh nghÜa gi¸ trŞ thèng nhÊt
CURRENCYTYPE_MONEY			= 1,	// tiÒn v¹n
CURRENCYTYPE_FUYUAN			= 2,	// phóc duyªn
CURRENCYTYPE_COIN			= 3,	// tiÒn ®ång
CURRENCYTYPE_SCORE			= 4,	// tİch ®iÓm
CURRENCYTYPE_GOLDCOIN		= 5,	// tiÒn vµng
CURRENCYTYPE_SLIVER			= 6,	// ng©n l­îng (phÕ bá)
CURRENCYTYPE_TICKET			= 7,	// phiÕu (phÕ bá)
CURRENCYTYPE_YUANBAO		= 8,	// nguyªn b¶o (phÕ bá)
CURRENCYTYPE_GOLDCOIN_NEW	= 9,	// tiÒn vµng míi, ®Ó ph©n biÖt víi tiÒn tÖ cña §µi Loan
CURRENCYTYPE_CONTRIBUTION	= 10,	// §é cèng hiÕn
CURRENCYTYPE_HONOUR			= 11,	// §iÓm vinh dù liªn ®Êu
CURRENCYTYPE_GOLDCOIN_SCORE = 12,	//  tiÒn vµng tİch lòy
CURRENCYTYPE_RESPECT		= 13,	// danh väng
CURRENCYTYPE_REFINING		= 14,	// tinh luyÖn th¹ch
CURRENCYTYPE_ENERGY			= 15,	// tinh lùc
CURRENCYTYPE_ARENA_CREDITS	= 16,	// hu©n ch­¬ng vinh dù c¶nh kü tr­êng
CURRENCYTYPE_ITEM_LONGLINGQI	= 17,	// long lÖnh kú 	6,1,3056
CURRENCYTYPE_ITEM_LINLINGQI		= 18,	// l©n lÖnh kú 6,1,3057
CURRENCYTYPE_ITEM_GUILINGQI		= 19,	//  quy lÖnh kú	6,1,3059
CURRENCYTYPE_ITEM_FENGLINGQI	= 20,	// phông lÖnh kú	6,1,3058
CURRENCYTYPE_ITEM_WUXINGQISHI	= 21,	// ngò hµnh kú th¹ch	6,1,2125
CURRENCYTYPE_ITEM_XINGXIALING	= 22,	// hµnh hiÖp lÖnh	6,1,2566
CURRENCYTYPE_TASK_SJGX			= 23,	//tiÓu hu©n ch­¬ng tèng kim    ID nhiÖm vô biÕn l­îng = 3450
CURRENCYTYPE_TASK_GUTA		= 24, //tİch ®iÓm cæ th¸p    ID nhiÖm vô biÕn l­îng = 4164
CURRENCYTYPE_XINGYU			= 25,	// Tinh ngäc  ®¹o cô tinh ngäc xö lİ ®Æc biÖt, vèn dÜ ®­îc ®Şnh nghÜa lµ tiÒn tÖ  6,1,4546
CURRENCYTYPE_TASK_DIANQUAN	= 26,	//CÈm tó ®iÓm quyÓn    ID nhiÖm vô biÕn l­îng = 4200

NÕu ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE" ®Ó thiÕt lËp vËt phÈm tiªu hao cô thÓ
Param1 == gi¸ trŞ tiªu hao

NÕu ParamKey == "ITEM",
Param1 == gi¸ trŞ Genre#
Param2 == gi¸ trŞ nDetail#
Param3 == gi¸ trŞ nParticular
Param4 == gi¸ trŞ nLevel
Param5 == gi¸ trŞ nCount#sè l­îng tiªu hao

NÕu ParamKey == "CUSTOM"
Param1 == gi¸ trŞ tiªu hao
ParamDetail == b¾t  ®Çu tõ 1 (gi¸ trŞ tù ®Şnh nghÜa, chia tõng lo¹i tiªu hao tù ®Şnh nghÜa ra, kh«ng nªn trïng lÆp)
Ngoµi ra, ë \script\global\exchangeshop\cost\costcustom.lua cÇn ph¶i ®¨ng kı nhËn tham sè __GetValue vµ __CostValue,
tham kh¶o tbCostCustom:RegisterCostCustmonNode(ParamDetailKey, ParamDetailKeyName, __GetValue, __CostValue)
Param6#§Ó dù phßng, t¹m thêi kh«ng dïng ®Õn
Comment: thuyÕt minh lo¹i tiÒn tÖ tiªu hao, dïng ®Ó hiÓn thŞ nh¾c nhë.

Tham kh¶o c¸ch sö dông shop bang héi - hÖ thèng bang héi míi t¹i:
\script\activitysys\config\52\extend.lua
Include("\\script\\global\\exchangeshop\\main_s.lua")
function pActivity:OpenShop()
    ...
    tbExchangeShopServer:OpenExchangeShop(1)
    ...
end