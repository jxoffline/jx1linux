Include([[\script\missions\tong\tong_springfestival\head.lua]]);

ITEM_DROPRATE_TABLE = {
						{	{6,1,978,1,1,1,1},0.020, "Gia TËc hoµn"	},
						{	{6,1,981,1,1,1,1},0.010, "Huy‘n Hu©n H∑m T‹nh"	},
						{	{6,1,983,1,1,1,1},0.020, "S≠¨ng Gi∏ng H∑m T‹nh"	},
						{	{6,1,994,1,1,1,1},0.016, "Hµn Phong Ng‰c"	},
						{	{6,1,989,1,1,1,1},0.010, "Kinh nghi÷m phÔ "	},
						{	{6,1,982,1,1,1,1},0.005, "Huy“n Thi™n H∑m T‹nh"	},
						{	{6,1,984,1,1,1,1},0.010, "B®ng Phong H∑m T‹nh"	},
						{	{6,1,979,1,1,1,1},0.002, "B®ng S≠¨ng Hi÷u gi∏c "	},
						{	{6,1,985,1,1,1,1},0.005, "Cµn Kh´n Na Di phÔ "	},
						{	{6,1,986,1,1,1,1},0.001, "Di H◊nh Ho∏n ∂nh phÔ "	},
						{	{6,1,988,1,1,1,1},0.005, "Kinh nghi÷m phÔ (cao c p) "	},
						{	1000,0.12},
						{	2000,0.12},
						{	5000,0.15},
						{	10000,0.15},
						{	20000,0.12},
						{	50000,0.1},
						{	100000,0.015},
						{	200000,0.006},
						{	300000,0.0025},
						{	500000,0.0005},
						{	{6,1,71,1,1,1,1},0.030, "Ti™n Th∂o LÈ "},
						{	{6,1,122,1,1,1,1},0.010, "PhÛc Duy™n (ti”u) "},
						{	{6,1,123,1,1,1,1},0.005, "PhÛc Duy™n (trung) "},
						{	{6,1,124,1,1,1,1},0.003, "PhÛc Duy™n (Æπi) "},
						{	{6,1,402,1,1,1,1},0.002, "Th«n b› ßπi HÂng Bao"},
						{	{6,0,1,1,1,1,1},0.005, "Tr≠Íng M÷nh hoµn"},
						{	{6,0,2,1,1,1,1},0.005, "Gia Bµo hoµn"},
						{	{6,0,3,1,1,1,1},0.005, "ßπi L˘c hoµn"},
						{	{6,0,4,1,1,1,1},0.005, "Cao Thi”m hoµn"},
						{	{6,0,5,1,1,1,1},0.005, "Cao Trung hoµn"},
						{	{6,0,6,1,1,1,1},0.005, "Phi TËc hoµn"},
						{	{6,0,7,1,1,1,1},0.005, "B®ng Phﬂng hoµn"},
						{	{6,0,8,1,1,1,1},0.005, "L´i Phﬂng hoµn"},
						{	{6,0,9,1,1,1,1},0.005, "H·a Phﬂng hoµn"},
						{	{6,0,10,1,1,1,1},0.005, "ßÈc Phﬂng hoµn"},
					}


function gift_true()
	
	add_dropitem()
	
	CastSkill(358, 1); --∑≈“ª∏ˆººƒ‹£ª
	
	Msg2Player("Bπn nhÀn Æ≠Óc 1 "..SF_GIFTNAME);
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
				Msg2Player("Bπn Æ≠Óc 1 c∏i<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE[i][3]);
			elseif (type( ITEM_DROPRATE_TABLE[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE[i][1] * festival_get_exptimes();
				AddOwnExp(nExp);
				Msg2Player("Bπn nhÀn Æ≠Óc <color=0xB5FDD7>"..nExp.."Æi”m kinh nghi÷m.");
			end
			break
		end
	end
	
	
end

function IsPickable( nItemIndex, nPlayerIndex )
    if (0 == GetItemParam(nItemIndex, 2)) then
       return 1;
    end
	if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
        return 0;
    else
        return 1;
    end;
end

function PickUp( nItemIndex, nPlayerIndex )
    SetSpecItemParam(nItemIndex, 2, 0);
    local bFaked = GetItemParam(nItemIndex, 1);
    if (1 == bFaked) then
        gift_true(nPlayerIndex);
    elseif(2 == bFaked) then
        gift_fake(nPlayerIndex);
    end;
    return 0;
end

function gift_fake(nPlayerIndex)    --ºŸµƒ¿Ò∫–
    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
        return
    end;
    AddSkillState(673, 20, 0, 15 * 18)
	Msg2Player("Bπn ch‰n nh«m l‘ vÀt gi∂ cÒa Qu∏i thÛ, <color=yellow> bﬁ cho∏ng 15 gi©y<color>!");
end;
