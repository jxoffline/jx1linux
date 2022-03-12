IncludeLib("ITEM");
--huihuangzhiguo_level
MX_LANTERN_COUNT = 2;
GOLDFRUIT_MX_COUNT = 365;
TASKIDDAY = 2321;
TASKMAXEAT = 2314;
TASKEATCOUNT = 2322;
GOLDENSEED100_MAXCOUNT = 100;

function main(ItemIndex)
	if (GetLevel() < 120) then
		Say("<#> §é rÌn luyÖn cña ng­¬i ch­a ®ñ ®Ó ¨n qu¶ nµy.", 0)
		return 1
	end
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(TASKIDDAY) ~= nDate ) then
		SetTask(TASKIDDAY, nDate)
		SetTask(TASKEATCOUNT, 0);
	end
	
	if ( GetTask(TASKIDDAY) == nDate and MX_LANTERN_COUNT <= GetTask(TASKEATCOUNT)) then
		local szMsg = format("<#>H«m nay b¹n ®· ¨n %d qu¶ Hoµng Kim, vâ c«ng th¨ng tiÕn qu¸ nhanh dÔ g©y t¸c dông ph¶n nghÞch, ngµy mai h·y tiÕp tôc vËy.",MX_LANTERN_COUNT)
		Say(szMsg, 0)
		Msg2Player(szMsg)
		return 1
	end
	
	local n_param = tonumber(GetItemParam(ItemIndex,1)) + 1
	local itemname = "<color=yellow>"..GetItemName(ItemIndex).."<color>"
	SetSpecItemParam(ItemIndex,1,n_param)
	SyncItem(ItemIndex)
	if (n_param >= GOLDENSEED100_MAXCOUNT) then
		RemoveItemByIndex(ItemIndex)
		Msg2Player("<#> "..itemname.."<#> ®· sö dông"..GOLDENSEED100_MAXCOUNT.."<#> lÇn, kh«ng thÓ dïng ®­îc n÷a!")
	else
		Msg2Player("<#> "..itemname.."<#> cßn cã thÓ sö dông"..(GOLDENSEED100_MAXCOUNT - n_param).."<#> lÇn")
	end
	
	SetTask(TASKMAXEAT, GetTask(TASKMAXEAT) + 1)	--ÈçºÎ±£Ö¤´Ó1¿ªÊ¼¼ÆÊýÄØ£¿£¿
	SetTask(TASKEATCOUNT, GetTask(TASKEATCOUNT) + 1)
	local award_exp = 50000000
	AddOwnExp(award_exp)
	return 1
end


function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	szDesc = szDesc..format("\nCã thÓ sö dông<color=yellow>%d<color>lÇn", (GOLDENSEED100_MAXCOUNT - n_param));
	return szDesc;
end