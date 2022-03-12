Include([[\script\missions\tong\collectgoods\head.lua]]);

ITEM_DROPRATE_TABLE828 = {
--						{	{4,970,1,1,1,1,1},0, "ºìÔæ"	},
--						{	{4,971,1,1,1,1,1},0, "°åÀõ"	},
--						{	{4,974,1,1,1,1,1},0, "ÆÕÍ¨µÄÈâ"	},
--						{	{4,972,1,1,1,1,1},0, "ôÕÒ¶"	},
--						{	{4,973,1,1,1,1,1},0, "µ¾Ã×"	},
						{	{6,1,978,1,1,1,1},0.025, "Gia Tèc hoµn"	},
						{	{6,1,981,1,1,1,1},0.025, "HuyÔn Hu©n H·m TÜnh"	},
						{	{6,1,983,1,1,1,1},0.025, "S­¬ng Gi¸ng H·m TÜnh"	},
						{	{6,1,991,1,1,1,1},0.025, "Thiªn L«i Ngäc"	},
						{	{6,1,994,1,1,1,1},0.025, "Hµn Phong Ngäc"	},
						{	{6,1,987,1,1,1,1},0.025, "§én §Þa phï "	},
						{	{6,1,1009,1,1,1,1},0.018, "Ma Tóy HiÖu gi¸c"	},
						{	{6,1,990,1,1,1,1},0.005, "L«i Tèc hoµn"	},
						{	{6,1,982,1,1,1,1},0.005, "HuyÒn Thiªn H·m TÜnh"	},
						{	{6,1,984,1,1,1,1},0.005, "B¨ng Phong H·m TÜnh"	},
						{	{6,1,993,1,1,1,1},0.005, "L«i ThÇn Ngäc"	},
						{	{6,1,992,1,1,1,1},0.005, "HuyÒn B¨ng Ngäc"	},
						{	{6,1,1010,1,1,1,1},0.005, "CÊp §«ng HiÖu gi¸c"	},
						{	{6,1,980,1,1,1,1},0.002, "B¹o L«i HiÖu gi¸c"	},
						{	{6,1,979,1,1,1,1},0.002, "B¨ng S­¬ng HiÖu gi¸c "	},
						{	{6,1,986,1,1,1,1},0.003, "Di H×nh Ho¸n ¶nh phï "	},
						{	{6,1,985,1,1,1,1},0.002, "Cµn Kh«n Na Di phï "	},
						{	1000,0.08},
						{	2000,0.10},
						{	5000,0.10},
						{	10000,0.20},
						{	20000,0.138},
						{	50000,0.11},
						{	100000,0.06},
						{	{6,1,402,1,1,1,1},0.005, "ThÇn bÝ §¹i Hång Bao"},
					}


function gift_true828()
	SetTask(COLLG_COUNT_ONETIME, GetTask(COLLG_COUNT_ONETIME) + 1);
	Msg2Player("B¹n t×m ®­îc <color=red>1<color> tói hµng hãa.");
	add_dropitem828()
	
	CastSkill(358, 1); --·ÅÒ»¸ö¼¼ÄÜ£»
	Msg2Player("B¹n t×m ®­îc tÊt c¶ <color=yellow>"..GetTask(COLLG_COUNT_ONETIME).."<color> tói hµng hãa.");
end;

function add_dropitem828()
	local sum = 0
	for i = 1, getn(ITEM_DROPRATE_TABLE828) do
		sum = sum + ITEM_DROPRATE_TABLE828[i][2] * 1000
	end
	
	local nRandNum = random(sum)
	local nSum = 0
	for i =1, getn(ITEM_DROPRATE_TABLE828) do
		nSum = nSum + ITEM_DROPRATE_TABLE828[i][2] * 1000
		if (nSum >= nRandNum) then
			if (type( ITEM_DROPRATE_TABLE828[i][1] ) == "table") then
				AddItem(ITEM_DROPRATE_TABLE828[i][1][1], ITEM_DROPRATE_TABLE828[i][1][2], ITEM_DROPRATE_TABLE828[i][1][3], ITEM_DROPRATE_TABLE828[i][1][4], ITEM_DROPRATE_TABLE828[i][1][5], ITEM_DROPRATE_TABLE828[i][1][6], ITEM_DROPRATE_TABLE828[i][1][7])
				Msg2Player("B¹n ®­îc 1 c¸i<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE828[i][3]);
			elseif (type( ITEM_DROPRATE_TABLE828[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE828[i][1];
				AddOwnExp(nExp);
				Msg2Player("B¹n nhËn ®­îc <color=0xB5FDD7>"..nExp.."®iÓm kinh nghiÖm.");
			end
			break
		end
	end
	
	
end

function IsPickable828( nItemIndex, nPlayerIndex )
    if (0 == GetItemParam(nItemIndex, 2)) then
       return 1;
    end
    
	if (GetTask(TK_GROUPID) > COLLG_SMALLMAPCOUNT) then
        return 0;
    else
        return 1;
    end;
end

function PickUp828( nItemIndex, nPlayerIndex )
    SetSpecItemParam(nItemIndex, 2, 0);
    gift_true828(nPlayerIndex);
    return 0;
end
