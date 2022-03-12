QY_GOLDBOSS_APOS_INFO = {
					{"Cæ B¸ch", 566, 95, 0, {"Phï Dung ®éng","S¬n B¶o §éng","city"}}, -- Ãû×Ö,ĞÎÏó,µÈ¼¶,ÎåĞĞ,{¿ÉÄÜ³öÏÖµÄµØÍ¼}
					{"HuyÒn Gi¸c §¹i S­ ", 740, 95, 0, {"Nh¹n Th¹ch §éng","Thanh khª ®éng","city"}},
					{"§­êng Phi YÕn", 1366, 95, 1, {"Phong L¨ng §é Nam","Kháa Long ®éng","city"}},
					{"Lam Y Y", 582, 95, 1, {"Vò L¨ng ®éng","Phi Thiªn ®éng","city"}},
					{"Hµ Linh Phiªu", 568, 95, 2, {"Tr­êng B¹ch s¬n B¾c","V« Danh ®éng","city"}},
					{"Yªn HiÓu Tr¸i", 744, 95, 2, {"Sa M¹c 1","Sa M¹c 3","city"}},
					{"M¹nh Th­¬ng L­¬ng", 583, 95, 3, {"Sa m¹c ®Şa biÓu","Sa M¹c 2","city"}},
					{"Gia LuËt TŞ Ly", 563, 95, 3, {"L­ìng Thñy §éng","D­¬ng Trung ®éng","city"}},
					{"§¹o Thanh Ch©n Nh©n", 562, 95, 4, {"Tr­êng B¹ch s¬n Nam ","M¹c Cao QuËt","city"}},
					{"TuyÒn C¬ Tö ", 747, 95, 4, {"Phi Thiªn ®éng","city"}},
					
				--{"ÍêÑÕÑ©ÒÂ", 564, 95, 3, 227, 1504, 3144, "ÌıËµ½ğ¹úÆß¹«Ö÷ÍêÑÕÑ©ÒÂ×·Ëæ¶ËÄ¾î£È¥µ½Î÷ÏÄ¹ú¶Ø»ÍÉ³Ä®ÃÔ¹¬¡£"},
}

QY_GOLDBOSS_DPOS_INFO = {
					{"Thanh TuyÖt S­ Th¸i", 743, 95, 341, 2, "Giang hå truyÒn r»ng Thanh TuyÖt S­ Th¸i tõng danh trÊn giang hå ®· xuÊt hiÖn t¹i M¹c B¾c Th¶o Nguyªn! Giang hå s¾p cã mét trËn ®Ém m¸u!", "\\settings\\maps\\¶«±±Çø\\Ä®±±²İÔ­\\qingxiaoshitaiboss.txt"},
					{"Yªn HiÓu Tr¸i", 744, 95, 336, 2, "Nghe nãi Thñy Tiªn sø gi¶ Yªn HiÓu Tr¸i ®· xuÊt hiÖn t¹i Phong L¨ng §é B¾c! Giang hå s¾p cã mét trËn ®Ém m¸u!", "\\settings\\maps\\ÖĞÔ­±±Çø\\·çÁê¶É±±°¶\\yanxiaoqianboss.txt"},
					{"Hµ Nh©n Ng· ", 745, 95, 321, 3, "Giang hå t­¬ng truyÒn Hµ Nh©n Ng· ®· xuÊt hiÖn t¹i Tr­êng B¹ch S¬n! SÏ cã mét trËn huyÕt chiÕn x¶y ra!", "\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjiziboss.txt"},
					{"HuyÒn Gi¸c §¹i S­ ", 740, 95, 322, 0, "Giang hå truyÒn r»ng HuyÒn Gi¸c §¹i S­ tõng danh trÊn giang hå xuÊt hiÖn t¹i Tr­êng B¹ch S¬n! Giang hå s¾p cã mét trËn ®Ém m¸u!", "\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjuedashiboss.txt"},
					{"TuyÒn C¬ Tö ", 747, 95, 340, 4, "Giang hå ®ån ®¹i Toµn C¬ Tö Èn tİch bÊy l©u ®ét nhiªn xuÊt hiÖn t¹i M¹c Cao QuËt. HuyÕt chiÕn sÏ l¹i x¶y ra!", "\\settings\\maps\\Î÷±±±±Çø\\Äª¸ß¿ß\\tangburanboss.txt"},
					{"Tõ §¹i Nh¹c", 1367, 95, 342,4, "NhiÒu ng­êi ®ån r»ng Tõ §¹i Nh¹c ®· xuÊt hiÖn t¹i Vi S¬n ®¶o! Giang hå tõ ®©y l¹i thªm mét phen sãng giã!", "\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
}
Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "MAKE GOLDBOSS 19:30" );
	TaskInterval( 1440 );
	TaskTime( 19, 30 );
	TaskCountLimit( 0 );
	-- Êä³öÆô¶¯ÏûÏ¢
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  19:30" );
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		qy_makeboss_fixure(1)
		return 0;
	end;
	BigBoss.gold_boss_count = 0;
TAB_CITY_EMPTY = {}
	qy_makeboss_onlyone_pos()
	--qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
