Include("\\script\\lib\\award.lua")
--award_give
function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70331) then
		Msg2Player("B¶o r­¬ng ®· rØ sĞt, kh«ng cßn sö dông ®­îc n÷a.");
		return 0;
	end;
	
	local tb_goldenbox = {
						{1,	{6,1,124,1,0,0,0},	1,	23860,	"Phóc Duyªn Lé (§¹i) ", 0},
						{1,	{6,1,71,1,0,0},	1,	17010,	"Tiªn Th¶o Lé ", 0},
						{1,	{6,1,26,1,0,0,0},	1,	100,	"Vâ L©m MËt TŞch", 0},
						{1,	{6,1,22,1,0,0,0},	1,	100,	"TÈy Tñy Kinh", 0},
						{1,	{6,1,147,1,0,0},	1,	38590,	"HuyÒn Tinh Kho¸ng Th¹ch cÊp 1", 0},
						{1,	{6,1,147,2,0,0},	1,	12280,	"HuyÒn Tinh Kho¸ng Th¹ch cÊp 2", 0},
						{1,	{6,1,147,3,0,0},	1,	2150,	"HuyÒn Tinh Kho¸ng Th¹ch cÊp 3 ", 0},
						{1,	{4,353,1,1,0,0},	1,	2830,	"Tinh Hång B¶o Th¹ch", 0},
						{1,	{4,238,1,1,0,0},	1,	2830,	"Lam Thñy Tinh", 0},
						{2,	{0,159},	1,	50,	"§Şnh Quèc Thanh Sa Tr­êng Sam", 1},
						{2,	{0,160},	1,	50,	"§Şnh Quèc ¤ Sa Ph¸t Qu¸n", 1},
						{2,	{0,161},	1,	50,	"§Şnh Quèc Xİch Quyªn NhuyÔn Ngoa", 1},
						{2,	{0,162},	1,	50,	"§Şnh Quèc Tö §»ng Hé uyÓn", 1},
						{2,	{0,163},	1,	50,	"§Şnh Quèc Ng©n Tµm Yªu ®¸i", 1},
		};
	local sum = 0;
	local nrand = random(100000);
	local strInfo=format("%s\t%s\tName:%s\tAccount:%s\t", 
								"[Ho¹t ®éng thu thËp m¶nh mËt ®å thÇn bİ]", 
								GetLocalDate("%Y-%m-%d %H:%M"),
								GetName(), GetAccount());	
	for i = 1, getn(tb_goldenbox) do
		sum = sum + tb_goldenbox[i][4]
		if (sum >= nrand) then
			award_give(tb_goldenbox[i]);
			Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc - %s",tb_goldenbox[i][5]));
			WriteLog(strInfo..format("Më R­¬ng b¹c nhËn ®­îc %s", tb_goldenbox[i][5]));
			if (tb_goldenbox[i][6] == 1) then
				AddGlobalNews(format("%s ®· tham gia ho¹t ®éng thu thËp mËt ®å thÇn bİ vµ nhËn ®­îc 1 bé trang bŞ Hoµng Kim!", GetName()));
			end;
			return 0;
		end;
	end;
	return 1;
end;