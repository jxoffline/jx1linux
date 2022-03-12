if (GetProductRegion() == "cn_ib") then
	QY_GOLDBOSS_DPOS_INFO = {
					--{"µ¥Ë¼ÄÏ", 746, 95, 341, 4, "½­ºş´«ÎÅÔø¾­ß³ßå·çÔÆµÄ µ¥Ë¼ÄÏ ÔÚÄ®±±²İÔ­³öÏÖ!ÊÆ±ØÏÆÆğÒ»³¡ĞÈ·çÑªÓê£¡", "\\settings\\maps\\¶«±±Çø\\Ä®±±²İÔ­\\shansinanboss.txt"},
					{"B¹ch Doanh Doanh", 742, 95, 336, 1, "Giang hå truyÒn r»ng B¹ch Doanh Doanh tõng danh trÊn giang hå ®· xuÊt hiÖn t¹i Phong L¨ng §é bê B¾c! Giang hå s¾p cã mét trËn ®Ém m¸u!", "\\settings\\maps\\ÖĞÔ­±±Çø\\·çÁê¶É±±°¶\\baiyingyingboss.txt"},
					--{"º«ÃÉ", 748, 95, 342, 1, "½­ºş´«ÎÅÔø¾­ß³ßå·çÔÆµÄ º«ÃÉ ÔÚÎ÷É½Óì³öÏÖ!ÊÆ±ØÏÆÆğÒ»³¡ĞÈ·çÑªÓê£¡", "\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\hanmengboss.txt"}
	}
else
	QY_GOLDBOSS_DPOS_INFO = {
--					{"µ¥Ë¼ÄÏ", 746, 95, 341, 4, "½­ºş´«ÎÅÔø¾­ß³ßå·çÔÆµÄ µ¥Ë¼ÄÏ ÔÚÄ®±±²İÔ­³öÏÖ!ÊÆ±ØÏÆÆğÒ»³¡ĞÈ·çÑªÓê£¡", "\\settings\\maps\\¶«±±Çø\\Ä®±±²İÔ­\\shansinanboss.txt"},
					{"B¹ch Doanh Doanh", 742, 95, 336, 1, "Giang hå truyÒn r»ng B¹ch Doanh Doanh tõng danh trÊn giang hå ®· xuÊt hiÖn t¹i Phong L¨ng §é bê B¾c! Giang hå s¾p cã mét trËn ®Ém m¸u!", "\\settings\\maps\\ÖĞÔ­±±Çø\\·çÁê¶É±±°¶\\baiyingyingboss.txt"},
--					{"º«ÃÉ", 748, 95, 342, 1, "½­ºş´«ÎÅÔø¾­ß³ßå·çÔÆµÄ º«ÃÉ ÔÚÎ÷É½Óì³öÏÖ!ÊÆ±ØÏÆÆğÒ»³¡ĞÈ·çÑªÓê£¡", "\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\hanmengboss.txt"}
					{"V­¬ng T¸ ", 739, 95, 341, 0, "Giang hå truyÒn r»ng V­¬ng T¸ tõng danh trÊn giang hå ®· xuÊt hiÖn t¹i M¹c B¾c th¶o nguyªn! Giang hå s¾p cã mét trËn ®Ém m¸u!", "\\settings\\maps\\¶«±±Çø\\Ä®±±²İÔ­\\wangzuoboss.txt"},
					{"§oan Méc DuÖ ", 565, 95, 227, 3,"Cã kÎ nh×n thÊy §oan Méc DuÖ bİ mËt xuÊt hiÖn t¹i Mª Cung Sa m¹c §«n Hoµng.", "\\settings\\maps\\Î÷±±±±Çø\\É³Ä®ÃÔ¹¬\\duanmuruiboss.txt"},
					{"Lam Y Y", 582, 95, 181, 1, "Con g¸i Lam Y Y cña H¾c DiÖn Lang Qu©n ®ang luyÖn c«ng ë L­ìng Thñy ®éng.", "\\settings\\maps\\½­ÄÏÇø\\Á½Ë®¶´ÃÔ¹¬\\lanyiyiboss.txt"},
					{"§­êng Phi YÕn", 1366, 95, 342, 1, "NhiÒu ng­êi ®ån r»ng §­êng Phi YÕn ®· xuÊt hiÖn t¹i Vi S¬n ®¶o! Giang hå tõ ®©y l¹i thªm mét phen sãng giã!", "\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
	}
end

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "MAKE GOLDBOSS 21:00" );
	TaskInterval( 1440 );
	TaskTime( 21, 0 );
	TaskCountLimit( 0 );
	-- Êä³öÆô¶¯ÏûÏ¢
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  21:00" );
end

function TaskContent()
TAB_CITY_EMPTY = {}
	qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
