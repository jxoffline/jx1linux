--¹úÇìÀñºÐ
--by Ð¡ÀË¶à¶à
--2007.08.08

TB_LIBAO = 
{
	1000000,--×Ü¸ÅÂÊ
	{0.968,	{"Huy ch­¬ng Quèc Kh¸nh",	6,1,1496,1,}},--¹úÇì»ÕÕÂ
	{0.003,	{"M¶nh Tµng B¶o §å 1",	4,490,1,1,}}, --µØÍ¼ËéÆ¬1
	{0.001,	{"M¶nh Tµng B¶o §å 2",	4,491,1,1,}}, --µØÍ¼ËéÆ¬2
	{0.003,	{"M¶nh Tµng B¶o §å 3",	4,492,1,1,}}, --µØÍ¼ËéÆ¬3
	{0.003,	{"M¶nh Tµng B¶o §å 4",	4,493,1,1,}}, --µØÍ¼ËéÆ¬4
	{0.003,	{"M¶nh Tµng B¶o §å 5",	4,494,1,1,}}, --µØÍ¼ËéÆ¬5
	{0.003,	{"M¶nh Tµng B¶o §å 6",	4,495,1,1,}}, --µØÍ¼ËéÆ¬6
	{0.003,	{"M¶nh Tµng B¶o §å 7",	4,496,1,1,}}, --µØÍ¼ËéÆ¬7
	{0.003,	{"M¶nh Tµng B¶o §å 8",	4,497,1,1,}},	--µØÍ¼ËéÆ¬8
	{0.001,	{"M¶nh Tµng B¶o §å 9",	4,498,1,1,}},	--µØÍ¼ËéÆ¬9
	{0.003,	{"M¶nh Tµng B¶o §å 10",4,499,1,1,}},	--µØÍ¼ËéÆ¬10
	{0.003,	{"M¶nh Tµng B¶o §å 11",4,500,1,1,}},	--µØÍ¼ËéÆ¬11
	{0.003,	{"M¶nh Tµng B¶o §å 12",4,501,1,1,}},	--µØÍ¼ËéÆ¬12
}
GUOQINGLIHE_DATE_END = 070924	--ÀñºÐ×îºóÊ¹ÓÃÊ±¼ä
function main(sel)
	local nData = tonumber(GetLocalDate("%y%m%d"))
	if nData >= GUOQINGLIHE_DATE_END then
		Talk(1,"","ThËt ®¸ng tiÕc, vËt phÈm nµy ®· qu¸ h¹n sö dông.")
		return 0 
	end
	if ( CalcFreeItemCellCount() < 5 ) then
		Talk(1,"","Kh«ng ®ñ chç trèng, h·y s¾p xÕp l¹i hµnh trang.")
		return 1
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
	Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",item[1]));
	WriteLog(format("[GuoQingLiHe]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));

end