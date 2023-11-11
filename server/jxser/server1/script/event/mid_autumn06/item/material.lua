--by 廖志山 [2006-09-12]
--2006中秋活动：材料函数
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

tab_material = {
{	"Gi蕐 ki課g v祅g (V藅 li謚 l祄 l錸g n)"	,	1221	,	2635	}	,
{	"Gi蕐 ki課g  (V藅 li謚 l祄 l錸g n)"	,	1224	,	50	}	,
{	"Gi蕐 ki課g l鬰 (V藅 li謚 l祄 l錸g n)"	,	1223	,	300	}	,
{	"Gi蕐 ki課g cam (V藅 li謚 l祄 l錸g n)"	,	1225	,	15	}	,
{	"Gi蕐 ki課g lam (V藅 li謚 l祄 l錸g n)"	,	1222	,	1000	}	,
{	"Thanh tre (V藅 li謚 l祄 l錸g n)"	,	1226	,	2000	}	,
{	"D﹜ c鉯 (V藅 li謚 l祄 l錸g n)"	,	1227	,	2000	}	,
{	"N課"	,	1228	,	2000	}	,
}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(tab_material) do
		nSum = nSum + tab_material[i][3];
		if (nSeed < nSum) then
			AddItem(6, 1, tab_material[i][2], 1, 0, 0, 0);
			Msg2Player("B筺 nh薾 頲 <color=yellow>"..tab_material[i][1]..". <color>");
			return 0;
		end;
	end;
	AddItem(6, 1, tab_material[1][2], 1, 0, 0, 0);
	Msg2Player("B筺 nh薾 頲 <color=yellow>"..tab_material[1][1]..". <color>");
    return 0;
end
