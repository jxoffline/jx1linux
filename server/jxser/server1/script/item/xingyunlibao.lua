--ĞÒÔËÀñ°ü
--by Ğ¡ÀË¶à¶à
--2007.04.13

TB_LIBAO = 
{
	1000000,--×Ü¸ÅÂÊ
	{0.00125,	{"Cöu VÜ B¹ch Hå trang",					0,2,9,10,2,}}, --¾ÅÎ²°×ºüôÃ[Ë®ÊôĞÔ]
	{0.00125,	{"Cöu VÜ B¹ch Hå trang",					0,2,9,10,3,}}, --¾ÅÎ²°×ºüôÃ[»ğÊôĞÔ]
	{0.00125,	{"TuyÒn Long bµo",							0,2,6,10,2,}}, --è¯ÁúÅÛ[Ë®ÊôĞÔ]
	{0.00125,	{"TuyÒn Long bµo",							0,2,6,10,3,}}, --è¯ÁúÅÛ[»ğÊôĞÔ]
	{0.00125,	{"Thiªn Tµm Yªu §¸i",						0,6,0,10,2,}}, --Ìì²ÏÑü´ø[Ë®ÊôĞÔ]
	{0.00125,	{"Thiªn Tµm Yªu §¸i",						0,6,0,10,3,}}, --Ìì²ÏÑü´ø[»ğÊôĞÔ]
	{0.00125,	{"B¹ch Kim Yªu §¸i",						0,6,1,10,2,}}, --°×½ğÑü´ø[Ë®ÊôĞÔ]
	{0.00125,	{"B¹ch Kim Yªu §¸i",						0,6,1,10,3,}}, --°×½ğÑü´ø[»ğÊôĞÔ]
	{0.15,		{"Tiªn Th¶o Lé ",							6,1,71,1,}},	 --ÏÉ²İÂ¶
	{0.1796,	{"QuÕ Hoa Töu",							6,1,125,1,}},	 --¹ğ»¨¾Æ
	{0.0001,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",		0,164,}},			 --°²°î ¨C ±ù¾§Ê¯ÏîÁ´
	{0.0001,	{"An Bang Cóc Hoa Th¹ch Giíi ChØ",		0,165,}}, 		 --°²°î ¨C ¾Õ»¨Ê¯½äÖ¸
	{0.0001,	{"An Bang Kª HuyÕt Th¹ch Giíi ChØ ",		0,167,}},			 --°²°î ¨C ¼¦ÑªÊ¯½äÖ¸
	{0.0001,	{"An Bang §iÒn Hoµng Th¹ch Ngäc Béi",		0,166,}}, 		 --°²°î ¨C Ìï»ÆÊ¯ÓñÅå
	{0.0004,	{"§Şnh Quèc ¤ Sa Ph¸t Qu¸n",			0,160,}}, 		 --¶¨¹ú ¨C ÎÙÉ°·¢¹Ú
	{0.0004,	{"§Şnh Quèc Thanh Sa Tr­êng Sam",			0,159,}}, 		 --¶¨¹ú ¨C ÇàÉ´³¤ÉÀ
	{0.0004,	{"§Şnh Quèc Tö §»ng Hé uyÓn",			0,162,}},			 --¶¨¹ú ¨C ×ÏÌÙ»¤Íó
	{0.0004,	{"§Şnh Quèc Ng©n Tµm Yªu ®¸i",			0,163,}},			 --¶¨¹ú ¨C Òø²ÏÑü´ø
	{0.0004,	{"§Şnh Quèc Xİch Quyªn NhuyÔn Ngoa",			0,161,}},			 --¶¨¹ú ¨C ³à¾îÈíÑ¥
	{0.0002,	{"ChiÕu D¹ Ngäc S­ Tö ",					0,10,5,10,}},	 --ÕÕÒ¹ÓñÊ¨×Ó80¼¶Âí
	{0.0002,	{"Xİch Thè ",								0,10,5,2,}},	 --³àÍÃ80¼¶Âí
	{0.0002,	{"Vâ L©m MËt TŞch",						6,1,26,1,}},	 --ÎäÁÖÃÜ¼®
	{0.0002,	{"TÈy Tñy Kinh",							6,1,22,1,}},	 --Ï´Ëè¾­
	{0.65,		{"B«ng hoa chiÕn c«ng",							6,1,1414,1,}}	 --Õ½¹¦»¨
}

function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070513) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("Ng­êi ch¬i cÊp 50 trë lªn ®· n¹p thÎ míi cã thÓ sö dông.");
		return 1;
	end;
	if ( CalcFreeItemCellCount() < 12 ) then
		Say("Xin s¾p xÕp l¹i hµnh trang ®Ó ®¶m b¶o cã 12 « trèng.",0);
	return 1;
	end
	local SumPe =  TB_LIBAO[1];
	local Rand = random(1,SumPe);
	local Sum = 0;
	for i=2,getn(TB_LIBAO) do
		local pnum = TB_LIBAO[i][1];
		local item = TB_LIBAO[i][2];
		Sum = Sum + pnum * SumPe;
		if Rand < Sum then
			award_item(item);
			break;
		end
	end
end

function award_item(item)
	local nidx ;
	if getn(item) == 3 then
		nidx = AddGoldItem(item[2], item[3]);
	elseif getn(item) == 5 then
		nidx = AddItem(item[2], item[3], item[4], item[5],0,0);
	elseif getn(item) == 6 then
		nidx = AddQualityItem(2,item[2], item[3], item[4], item[5],item[6],255,-1,-1,-1,-1,-1,-1)
	end
	Msg2Player("B¹n nhËn ®­îc mét"..item[1]);
	WriteLog(format("[xingyunlibao]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));

end