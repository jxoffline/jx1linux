-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - ¶à´Î×ªÉúÍ·ÎÄ¼ş
-- ÎÄ¼şÃû¡¡£ºtask_head.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-02-04 16:21:20

-- ======================================================
--print(10e6)
IncludeLib("FILESYS")

TB_LEVEL_REMAIN_PROP = {
		--[µÈ¼¶level] = { {magicpoint, prop, resist}<,{}>};
			}

NTRANSLIFE_MAX = 8  -- ×ªÉú´ÎÊıÉÏÏŞ			

function Load_TransLifeSetting()
	local b1 = TabFile_Load("\\settings\\task\\metempsychosis\\translife.txt", "TransLifeSetting")
	if b1~=1 then
		print("Load TransLifeSetting Failed!")
		return
	end
	local nRowCount = TabFile_GetRowCount("TransLifeSetting", "LEVEL")
	
	for y = 2, nRowCount do
		local n_level = tonumber(TabFile_GetCell("TransLifeSetting", y, "LEVEL"));
		
		local tb = {};
		
		for z = 1, NTRANSLIFE_MAX do
			
			local n_magicpoint = tonumber(TabFile_GetCell("TransLifeSetting", y, "MAGICPOINT"..z));
			local n_prop = tonumber(TabFile_GetCell("TransLifeSetting", y, "PROP"..z));
			local n_resist = tonumber(TabFile_GetCell("TransLifeSetting", y, "RESIST"..z));
			local n_addskilll = tonumber(TabFile_GetCell("TransLifeSetting", y, "SKILLLIMIT"..z));
			
			if (n_magicpoint) then
				tb[z] = {n_magicpoint, n_prop, n_resist, n_addskilll};
			end
			
		end
		
		if (n_level ~= nil) then
			TB_LEVEL_REMAIN_PROP[n_level] = tb;
		end
	end	
end

Load_TransLifeSetting()

TB_LEVEL_LIMIT = {160, 170, 180, 200, 200, 200, 200, 200};
TB_TRANSTIME_LIMIT = {0, 0, 0, 0, 0, 0, 0, 0}; --translife time delta limit
-- 4×ªĞèÒªµÄÆäËûµÀ¾ß
TBITEMNEED_4 = {
	[1] = {szName = "Tİch LŞch ®¬n", tbProb = {6,1,2973}, nCount = 999},	-- Åùö¨µ¯
	[2] = {szName = "<B¾c §Èu Tr­êng Sinh ThuËt—§¹i Thõa T©m Ph¸p>", tbProb = {6,1,2974}, nCount = 1},  -- ±±¶·³¤ÉúÊõ¡ª´ó³ËĞÄ·¨
	}

-- ÎåĞĞÈËÎïµÄÌìÉúÊôĞÔÖµ
TB_BASE_STRG = {35,20,25,30,20};
TB_BASE_DEX = {25,35,25,20,15};
TB_BASE_VIT = {25,20,25,30,25};
TB_BASE_ENG = {15,25,25,20,40};

ZHUANSHENG_DESC		= "METEMPSYCHOSIS";
ZHUANSHENG_TUITION	= 100000000;	-- ×ªÉúËùĞèJXB
ZHUANSHENG_XIANDAN_MINEXP	= 2*10e8;	-- ±±¶·ÏÉµ¤ÖÁÉÙÒª20ÒÚ
ZHUANSHENG_XIANDAN_BASEEXP		= 10e6;	-- ±±¶·ÏÉµ¤µ¥Î»ÊÇ 1000w
ZHUANSHENG_ITEM_BEGIN	= 20090420---20090420;		-- ÖÆ×÷ÏÉµ¤¿ªÊ¼Ê±¼ä 0µã
ZHUANSHENG_ITEM_ENDLE	= 20090503;		-- ÖÆ×÷ÏÉµ¤½áÊøÊ±¼ä 24µã
ZHUANSHENG_ITEM_EXTIME	= 20090601;		-- ÏÉµ¤ÓĞĞ§Ê¹ÓÃÊ±¼ä

LG_SHITULEAGUE = 1;				-- Ê¦Í½Õ½¶Ó
LG_WLLSLEAGUE = 5;				-- ÎäÁÖÁªÈüÕ½¶Ó

TSK_ZHUANSHENG_FLAG = 2547;
TSK_ZHUANSHENG_1 = 2548;	-- ×ªÉú ÓÃÀ´±£´æ×î´ó¿¹ĞÔµÄÈÎÎñ±äÁ¿£¬´ÓµÍ×Ö½Ú¿ªÊ¼ÒÀ´Î±£´æ»ğ¡¢±ù¡¢¶¾¡¢µçµÄ×î´ó¿¹ĞÔ
TSK_ZHUANSHENG_2 = 2549;			-- ×ªÉú ÓÃÀ´±£´æ×î´ó¿¹ĞÔµÄÈÎÎñ±äÁ¿£¬×îµÍ×Ö½Ú±£´æ×î´óÎïÀí¿¹ĞÔ£¬ÆäÓà×Ö½ÚÎ´Ê¹ÓÃ
TSK_ZHUANSHENG_XIANDAN	= 2581;		-- ÖÆ×÷±±¶·ÏÉµ¤
TSK_ZHUANSHENG_AWARD	= 2582;		-- byte1:3×ªÇ°10ÃûÁìÈ¡·­Óğ;1:Î´Áì,255:ÒÑÁìÈ¡


TSK_KILLER_ID = 1082;
TSK_MESSENGER_FENG = 1201;
TSK_MESSENGER_SHAN = 1202;
TSK_MESSENGER_QIAN = 1203;
TSK_TASKLINK_STATE = 1028;
TSK_TASKLINK_CancelTaskLevel = 2571;
TSK_TASKLINK_CancelTaskExp1 = 2570;
TSK_TASKLINK_CancelTaskExp2 = 2575;

TSK_ZHUANSHENG_GRE = {2577, 2578, 2579, 4107}	-- Ã¿´Î×ªÉúËùÑ¡µÈ¼¶ºÍ¿¹ĞÔ
TSK_ZHUANSHENG_LASTTIME = 2580;			-- ±£´æ×îºó´Î×ªÉúµÄServerTime ÒÔÃë¼Ç£¨Ïà¶Ô1700-0-0µ½Ä¿Ç°µÄÃèÊö£©
TSKM_ZHUANSHENG_RESISTID = 199;			-- ÁÙÊ±´æ·ÅÑ¡ÔñÔö¼ÓµÄ¿¹ĞÔ
--¿¹ĞÔ±àºÅ£¬0£º»ğ£¬1£º±ù£¬2:¶¾£¬3:µç£¬4:ÎïÀí
TB_BASE_RESIST = {
	[0] = "Phßng löa",
	[1] = "Phßng b¨ng",
	[2] = "Phßng ®éc",
	[3] = "Phßng sÊm",
	[4] = "Phßng Thñ VËt Lı",
	}

TSK_TRANSLIFE_4 = 2908		-- ±£´æÊÇ·ñ½ÓÊÜÁË4×ªÈÎÎñ	
TSK_LEAVE_SKILL_POINT_4 = 2909		-- ±£´æÊ£ÓàµÄ4×ª¼¼ÄÜµÄÊ£Óà¼¼ÄÜµã	
TSK_USED_SKILL_POINT_4 = 2899		-- ±£´æÒÑ¾­Ê¹ÓÃÁË¶àÉÙ¼¼ÄÜµã
TSK_LAST_UP_LEVEL_4 = 2910		-- ±£´æ×îºóÒ»´Î¸üĞÂ4×ª¼¼ÄÜµÄÊ£Óà¼¼ÄÜµãµÄµÈ¼¶ 
ZHUANSHENG_TUITION_4	= 100000000;	-- µÚ4´Î×ªÉúËùĞèJXB
CLEAR_SKILL_4_PRICE = 10000000	-- 4×ª¼¼ÄÜµãÏ´µãµÄ¼Û¸ñ
--TB_SKILL_4 = {{1123,0},{1124,0},{1125,0},{1126,0},{1127,0},{1128,0},{1129,0},{1130,0}}		-- ±£´æ4×ª¼¼ÄÜµÄÏà¹Øid
--TB_SKILL_6 = {{}}
TB_SKILL_4 = {{1123, 10, "Vò Uy ThuËt"},{1124, 10, "Nh­îc Thñy ThuËt"},{1125, 10, "TrÊn Nh¹c ThuËt"},{1126, 10, "Yªn Ba ThuËt"},{1127, 0, "Tr­êng Sinh ThuËt"},{1128, 20, "Bét H¶i ThuËt"},{1129, 20, "ThÇn TuÖ ThuËt"},{1130, 20, "Truy ¶nh ThuËt"}}
TB_SKILL_6 = {{1336, 10, "Vò Uy ThuËt (trïng sinh 6)"},{1337, 10, "Nh­îc Thñy ThuËt (trïng sinh 6)"},{1338, 10, "TrÊn S¬n ThuËt (trïng sinh 6)"},{1339, 10, "Yªn Ba ThuËt (trïng sinh 6)"},{1340, 0, "Tr­êng Sinh ThuËt (trïng sinh 6)"},{1341, 20, "B¸ H¶i ThuËt (trïng sinh 6)"},{1342, 20, "ThÇn TuÖ ThuËt(trïng sinh 6)"},{1343, 20, "Truy C¶nh ThuËt (trïng sinh 6)"}}

NSTARTLEVEL_4 = 105		-- 4×ª¼¼ÄÜ´Ó105¼¶¿ªÊ¼»ñµÃ¼¼ÄÜµã
NPERPOINTNEEDLEVEL = 5  -- Ã¿5¼¶»ñµÃÒ»¸ö¼¼ÄÜµã

BEIDOU_TRANSFER_MAX = 5

-- 5×ª
TSK_TRANSLIFE_5 = 4017		   -- ±£´æÊÇ·ñ½ÓÊÜÁË5×ªÈÎÎñ
N_TRANSLIFE_TREE_MIN = 40   -- 5×ªÖÖÊ÷ÒªÇó

-- 5×ªĞèÒªµÄÆäËûµÀ¾ß
TBITEMNEED_5 = {
	--[1] = {szName = "ÎŞ¼«ÏÉµ¤", tbProb = {6,1,3277}, nCount = 400},	
	--[2] = {szName = "ºÚÁúÏÉµ¤", tbProb = {6,1,3278}, nCount = 50},	
	[1] = {szName = "Chuy# sinh thu#(c# 5)", tbProb = {6,1,30246}, nCount = 2},
	}
	
TB_TRANSLIFE_ERRORMSG = {
	[1] = "<dec><npc>Tu luyÖn B¾c §Èu Tr­êng Sinh ThuËt cÇn ph¶i cëi bá tÊt c¶  trang bŞ trªn ng­êi!",
	[2] = "<dec><npc>H×nh nh­ tiÒn vÉn ch­a ®ñ <color=red>100000000<color>.",
	[3] = "<dec><npc>Tu luyÖn B¾c §Èu Tr­êng Sinh ThuËt cÇn ph¶i bá quan hÖ S­ §å",
	[4] = "<dec><npc>VŞ thiÕu hiÖp nµy vÉn ch­a häc <B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>, vËt nµy ë Kú Tr©n C¸c cã b¸n.",
	[5] = "<dec><npc>VŞ ®¹i hiÖp nµy, cÊp ®é cña ng­¬i vÉn ch­a ®ñ, ng­¬i h·y ®i rÌn luyÖn thªm ®i.",
	[6] = "<dec><npc>CÇn hñy bá quan hÖ chiÕn h÷u Vâ L©m Liªn §Êu míi cã thÓ tiÕn hµnh trïng sinh.",
	[7] = "<dec><npc> HiÖn t¹i sè lÇn Trïng sinh ®· ®Õn giíi h¹n",
	[8] = "<dec><npc>NhiÖm vô s¸t thñ vÉn ch­a hoµn thµnh! H·y hoµn tÊt nhiÖm vô råi quay l¹i nhĞ.",
	[9] = "<dec><npc>NhiÖm vô tİn sø vÉn ch­a hoµn thµnh! H·y hoµn tÊt nhiÖm vô råi quay l¹i nhĞ.",
	[10]= "<dec><npc>NhiÖm vô d· tÈu vÉn ch­a hoµn thµnh! H·y hoµn tÊt nhiÖm vô råi quay l¹i nhĞ.",
	[11]= "<dec><npc>D· tÈu thu ®­îc c¬ héi hñy bá nhiÖm vô! H·y hoµn tÊt nhiÖm vô nµy råi quay l¹i nhĞ.",
	[12]= "<dec><npc>Kho¶ng c¸ch 2 lÇn trïng sinh ph¶i lµ %d ngµy.",
	[13]= "<dec><npc>ChuyÓn sinh 4 cÇn cã <color=red> 200 v¹n <color> l­îng, xin h·y chuÈn bŞ ®ñ råi ®Õn ®©y.",
	[14]= "<dec><npc>ChuyÓn sinh 4 cÇn cã <color=red> 999 <color> c¸i Tİch LŞch §¬n, xin h·y chuÈn bŞ ®ñ råi ®Õn ®©y.",
	[15]= "<dec><npc>ChuyÓn sinh 4 cÇn cã <color=red> «B¾c §Èu Tr­êng Sinh ThuËt—§¹i Thõa T©m Ph¸p»<color>, xin h·y chuÈn bŞ ®ñ råi ®Õn ®©y.",
	[16]= format("<dec><npc>Trïng sinh 5 cÇn cã<color=red>%d<color> c¸i %s, Xin h·y chuÈn bŞ ®ñ råi ®Õn ®©y.", TBITEMNEED_5[1].nCount, TBITEMNEED_5[1].szName),
--	[17]= format("<dec><npc>5´Î×ªÉúĞèÒª<color=red>%d<color>¸ö%s£¬Çë×¼±¸ºÃÁËÔÙÀ´°É¡£", TBITEMNEED_5[2].nCount, TBITEMNEED_5[2].szName),
--	[18]= format("<dec><npc>5´Î×ªÉúĞèÒª<color=red>%s<color>£¬Çë×¼±¸ºÃÁËÔÙÀ´°É¡£", TBITEMNEED_5[3].szName),
	[17]= "",
	[18]= "",
	[19]= format("<dec><npc>Trïng sinh 5 cÇn ph¶i trång<color=red>%d<color>C©y Trïng Sinh, h·y chuÈn bŞ ®ñ råi ®Õn ®©y.", N_TRANSLIFE_TREE_MIN), 
	[20] = "<dec><npc>VŞ ®¹i hiÖp nµy, ®iÓm kinh nghiÖm hiÖn t¹i cña ng­¬i ®· ©m, ng­¬i h·y xö lı hoµn tÊt hÕt ®iÓm ®iÓm ©m råi ®Õn ®©y.",
}