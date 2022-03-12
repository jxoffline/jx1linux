Include([[\script\missions\springfestival\head.lua]]);

ITEM_DROPRATE_TABLE = {
						{	{6,1,978,1,1,1,1},0.020, "Gia Tèc hoµn"	},
						{	{6,1,981,1,1,1,1},0.010, "HuyÔn Hu©n H·m TÜnh"	},
						{	{6,1,982,1,1,1,1},0.005, "HuyÒn Thiªn H·m TÜnh"	},
						{	{6,1,983,1,1,1,1},0.020, "S­¬ng Gi¸ng H·m TÜnh"	},
						{	{6,1,984,1,1,1,1},0.010, "B¨ng Phong H·m TÜnh"	},
						{	{6,1,994,1,1,1,1},0.016, "Hµn Phong Ngäc"	},
						{	{6,1,989,1,1,1,1},0.010, "Kinh nghiÖm phï "	},
						{	{6,1,988,1,1,1,1},0.005, "Kinh nghiÖm phï (cao cÊp) "	},
						{	{6,1,985,1,1,1,1},0.005, "Cµn Kh«n Na Di phï "	},
						{	{6,1,986,1,1,1,1},0.005, "Di H×nh Ho¸n ¶nh phï "	},
						{	{6,1,979,1,1,1,1},0.010, "B¨ng S­¬ng HiÖu gi¸c "	},
						{	1000,0.15},
						{	2000,0.15},
						{	5000,0.15},
						{	10000,0.15},
						{	20000,0.1189},
						{	50000,0.015},
						{	100000,0.0001},
						{	{6,1,71,1,1,1,1},0.030, "Tiªn Th¶o Lé "},
					}


function main()
    if (GetTask(TK_CO_GROUPID) <= CO_SMALLMAPCOUNT) then
        return
    end;
	local nNpcIdx = GetLastDiagNpc();
	if (GetNpcParam(nNpcIdx, 4) == 0 ) then
		return
	end
	SetNpcParam(nNpcIdx,4,0)
	
	local nCount = GetTask(TK_CO_COUNT_ONETIME) + 1;
	SetTask(TK_CO_COUNT_ONETIME, nCount);
	DelNpc(nNpcIdx);
	
	add_dropitem()
	
	CastSkill(358, 1); --·ÅÒ»¸ö¼¼ÄÜ£»
	
	Msg2Player("B¹n ®· chän tróng"..nCount.."c¸i"..CO_MOUSENAME);
end;

function add_dropitem()
	local nSum = 0
	local nRandNum = random(1, 10000)
	
	for i =1, getn(ITEM_DROPRATE_TABLE) do
		nSum = nSum + ITEM_DROPRATE_TABLE[i][2] * 10000
		if (nSum >= nRandNum) then
			if (type( ITEM_DROPRATE_TABLE[i][1] ) == "table") then
				AddItem(ITEM_DROPRATE_TABLE[i][1][1], ITEM_DROPRATE_TABLE[i][1][2], ITEM_DROPRATE_TABLE[i][1][3], ITEM_DROPRATE_TABLE[i][1][4], ITEM_DROPRATE_TABLE[i][1][5], ITEM_DROPRATE_TABLE[i][1][6], ITEM_DROPRATE_TABLE[i][1][7])
				Msg2Player("B¹n ®­îc 1 c¸i<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE[i][3]);
			elseif (type( ITEM_DROPRATE_TABLE[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE[i][1] * festival_get_exptimes();
				AddOwnExp(nExp);
				Msg2Player("B¹n nhËn ®­îc <color=0xB5FDD7>"..nExp.."®iÓm kinh nghiÖm.");
			end
			break
		end
	end
	
	
end