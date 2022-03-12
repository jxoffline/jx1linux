-- •µÆæ´¡È∂‘ª∞Ω≈±æ£ª
Include([[\script\missions\tong\tong_disciple\head.lua]]);
ITEM_DROPRATE_TABLE = {
						{	{6,1,978,1,1,1,1},0.025, "Gia TËc hoµn"	},
						{	{6,1,981,1,1,1,1},0.025, "Huy‘n Hu©n H∑m T‹nh"	},
						{	{6,1,983,1,1,1,1},0.025, "S≠¨ng Gi∏ng H∑m T‹nh"	},
						{	{6,1,991,1,1,1,1},0.025, "Thi™n L´i Ng‰c"	},
						{	{6,1,994,1,1,1,1},0.025, "Hµn Phong Ng‰c"	},
						{	{6,1,987,1,1,1,1},0.025, "ßÈn ßﬁa phÔ "	},
						{	{6,1,989,1,1,1,1},0.018, "Kinh nghi÷m phÔ "	},
						{	{6,1,990,1,1,1,1},0.005, "L´i TËc hoµn"	},
						{	{6,1,982,1,1,1,1},0.005, "Huy“n Thi™n H∑m T‹nh"	},
						{	{6,1,984,1,1,1,1},0.005, "B®ng Phong H∑m T‹nh"	},
						{	{6,1,993,1,1,1,1},0.005, "L´i Th«n Ng‰c"	},
						{	{6,1,992,1,1,1,1},0.005, "Huy“n B®ng Ng‰c"	},
						{	{6,1,980,1,1,1,1},0.002, "Bπo L´i Hi÷u gi∏c"	},
						{	{6,1,979,1,1,1,1},0.002, "B®ng S≠¨ng Hi÷u gi∏c "	},
						{	{6,1,985,1,1,1,1},0.005, "Cµn Kh´n Na Di phÔ "	},
						{	{6,1,986,1,1,1,1},0.003, "Di H◊nh Ho∏n ∂nh phÔ "	},
						{	{6,1,988,1,1,1,1},0.005, "Kinh nghi÷m phÔ (cao c p) "	},
						{	500,0.08},
						{	1000,0.1},
						{	3000,0.12},
						{	5000,0.18},
						{	10000,0.12},
						{	30000,0.1},
						{	50000,0.05},
						{	100000,0.024},
						{	150000,0.01},
						{	300000,0.005},
						{	{6,1,402,1,1,1,1},0.001, "Th«n b› ßπi HÂng Bao"},
					}
					
					
function main()
	local nNpcIdx = GetLastDiagNpc();
	if (GetNpcParam(nNpcIdx, 4) == 0 ) then
		return
	end
	SetNpcParam(nNpcIdx,4,0)
	
	local nCount = GetTask(DIS_COUNT_ONETIME) + 1;
	SetTask(DIS_COUNT_ONETIME, nCount);
	DelNpc(nNpcIdx);
	
	add_dropitem()
	
	CastSkill(358, 1); --∑≈“ª∏ˆººƒ‹£ª
	
	Msg2Player("Bπn chi™u mÈ Æ≠Óc "..nCount.."c∏i"..DIS_MOUSENAME);
end;

function add_dropitem()
	local sum = 0
	for i = 1, getn(ITEM_DROPRATE_TABLE) do
		sum = sum + ITEM_DROPRATE_TABLE[i][2] * 1000
	end
	
	local nRandNum = random(sum)
	local nSum = 0
	for i =1, getn(ITEM_DROPRATE_TABLE) do
		nSum = nSum + ITEM_DROPRATE_TABLE[i][2] * 1000
		if (nSum >= nRandNum) then
			if (type( ITEM_DROPRATE_TABLE[i][1] ) == "table") then
				AddItem(ITEM_DROPRATE_TABLE[i][1][1], ITEM_DROPRATE_TABLE[i][1][2], ITEM_DROPRATE_TABLE[i][1][3], ITEM_DROPRATE_TABLE[i][1][4], ITEM_DROPRATE_TABLE[i][1][5], ITEM_DROPRATE_TABLE[i][1][6], ITEM_DROPRATE_TABLE[i][1][7])
				Msg2Player("Bπn Æ≠Óc 1 c∏i<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE[i][3])
			elseif (type( ITEM_DROPRATE_TABLE[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE[i][1] * get_exptimes();
				AddOwnExp(nExp);
				Msg2Player("Bπn nhÀn Æ≠Óc <color=0xB5FDD7>"..nExp.."Æi”m kinh nghi÷m.")
			end
			break
		end
	end
	
	
end