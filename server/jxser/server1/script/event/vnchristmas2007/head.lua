xmas2007_findgirl_taskID = 1859		--Ñ°ÕÒÉñÃØÉÙÅ®ÈÎÎñ±äÁ¿
xmas2007_findgirl_limit_taskID = 1862		--Ñ°ÕÒÉñÃØÉÙÅ®³¡´Î
xmas2007_findgirl_gblvalue_taskID = 1245 --È«¾Ö¿ªÆô±äÁ¿
xmas2007_findgirl_exp = 10000000	--Ñ°ÕÒÉñÃØÉÙÅ®»ñµÃ¾­Ñé

tb_xmas2007_findgirl_item = --Ñ°ÕÒÉñÃØÉÙÅ®½±Àø
{
	100000,--×Ü¸ÅÂÊ
	{0.00625,{0,143},"§éng S¸t B¹ch Kim §iªu Long Giíi"},
	{0.00625,{0,144},"§éng S¸t B¹ch Ngäc Cµn Kh«n Béi"},
	{0.00625,{0,145},"§éng S¸t B¹ch Kim Tó Phông Giíi"},
	{0.00625,{0,146},"§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn"},
}

tb_xmas2007_bossmap = 	--Ëæ»úµØÍ¼×ø±êµã
{
	[1]=		--·ïÏè
	{--x,y×ø±ê(ÉñÃØÊ¥µ®Ê÷,°¢É½,°¢ĞÛ)
		{1420, 3275},
		{1800, 3069},
		{1810, 3384},
	},
	[37]=		--µí¾©
	{
		{2021,2821},
		{1600,2817},
		{1801,3411},
	},
	[80]=		--ÑïÖİ
	{
		{1629, 2868},
		{1549, 3369},
		{1630, 2869},
	},
	[11]=		--³É¶¼
	{
		{2964, 4809},
		{2999, 5258},
		{3339, 5157},
	},
	[78]=		-- ÏåÑô
	{
		{1719, 3355},
		{1690, 3550},
		{1391, 3052},
	},
	[176]=	-- ÁÙ°²
	{
		{1231,3348},
		{1203,3059},
		{1130,2693},
	},
	[162]=	-- ´óÀí
	{
		{1805,3322},
		{1784,2991},
		{1326,3134},
	},
	[321]=	-- ³¤°×É½ÄÏ
	{
		{1019,2698},
		{1195,2759},
		{1321,2492},
		{1431,3011},
		{1540,2290},
		{1450,3133},
	},
	[322]=  -- ³¤°×É½±±
	{
		{1609,4101},
		{1603,3509},
		{1705,3541},
		{1795,4054},
		{1831,3411},
		{1976,3586},
		{2049,3598},
	},
}
tb_xmas_city = 		--Ëæ»úµØÍ¼
{
	[1] 	= "Ph­îng T­êng",
	[37] 	= "BiÖn Kinh",
	[80]  = "D­¬ng Ch©u",
	[11]  = "Thµnh §«",
	[78]  = "T­¬ng D­¬ng",
	[176] = "L©m An",
	[162]	="§¹i Lı",
	[321]	="Tr­êng B¹ch S¬n Nam",
	[322]	="Tr­êng B¹ch S¬n B¾c",
}
tb_xmas_girl = 	--ÉñÃØÉÙÅ®
{
	--bossID,µÈ¼¶,ÎåĞĞ(-1ÎªËæ»ú)
	{1326,95,-1,"§«ng Nhi"},
	{1327,95,-1,"B¹ch Nhi"},
	{1328,95,-1,"TuyÕt Nhi"},
}

tb_xmas_boss = 	--ÕÙ»½»Æ½ğboss
{
	--bossID,µÈ¼¶,ÎåĞĞ(-1ÎªËæ»ú)
	{1322,95,-1,"C©y gi¸ng sinh thÇn bİ"},
	{1324,95,-1,"A S¬n"},
	{1323,95,-1,"A Hïng"},
}

tbxmas2007_callboss_item =		--ÕÙ»½»Æ½ğbossµôÂä±í
{
	100,--×Ü¸ÅÂÊ,µ¥¼ş¼ÆËã
	--¸ÅÂÊ,{ÎïÆ·ID},ÊıÁ¿,Ãû³Æ
	{100,{4,239,1},1,"Tö Thñy Tinh"},
	{100,{4,240,1},1,"Lôc Thñy Tinh"},
	{100,{4,238,1},1,"Lam Thñy Tinh"},
	{100,{4,353,1},6,"Tinh Hång B¶o Th¹ch"},
	{100,{6,1,1007},1,"H¹t Thñy Tinh"},
	{5,{0,142},1,"§éng s¸t b¹ch kim ®iªu long giíi"},
	{5,{0,143},1,"§éng s¸t b¹ch ngäc cµn long béi"},
	{5,{0,144},1,"§éng s¸t b¹ch kim tó phông giíi"},
	{5,{0,145},1,"§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn"},
}

function xmas2007_sdl_writeLog(sztitle,szevent)	--¼ÇÂ¼,sztitle=ÊÂ¼şÃû,szevent=ÊÂ¼şÄÚÈİ
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end

function xmas2007_findgirl_returndate()
	local nmin = tonumber(GetLocalDate("%M"))
	local ntasknim = 0
	if nmin >=0 and nmin < 20 then
		ntasknim = 0
	elseif nmin >=20 and nmin < 40 then
		ntasknim = 20
	elseif nmin >=40 and nmin < 60 then
		ntasknim = 40	
	end	
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	local ntaskdate = ndate * 100 + ntasknim
	return ntaskdate
end
