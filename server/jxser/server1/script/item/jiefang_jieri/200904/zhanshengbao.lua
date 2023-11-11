-- Õ½Ê¤°ü½Å±¾ by bel at 20090408 10£º24

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

local tb_zhanshengbao_award	=
{
	{szName="Bao g¹o",	tbProp={6, 1, 2010, 1, 0, 0},	nRate = 35, nExpiredTime = jf0904_item_expiredtime},
	{szName="N­íc tinh khiÕt",	tbProp={6, 1, 2011, 1, 0, 0},	nRate = 50, nExpiredTime = jf0904_item_expiredtime},
	{szName="Men r­îu",		tbProp={6, 1, 2012, 1, 0, 0},	nRate = 15, nExpiredTime = jf0904_item_expiredtime},
};

function main()
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("Hµnh trang kh«ng ®ñ chç, xin h·y ®Ó trèng ra Ýt nhÊt 1 «.",0);
		return 1;
	end
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_item_expiredtime) then
		Msg2Player("VËt phÈm nµy ®· qu¸ h¹n.");
		return 0;
	end
	
	tbAwardTemplet:GiveAwardByList(%tb_zhanshengbao_award, "Tói mõng chiÕn th¾ng");
end

function IsPickable(nItemIndex, nPlayerIndex)
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (ndate >= jf0904_item_expiredtime) then
		return 
	end
	
	ITEM_SetExpiredTime(nItemIndex, jf0904_item_expiredtime);
	SyncItem(nItemIndex);
	return 1;
end
