CHUNBING_MAX_EXP = 300000000
TAB_EXPVALUE = {10000,15000,20000}
TSK_XIANGJIAO = 1310
function main()
	local eatexp = GetTask(TSK_XIANGJIAO)
	if (eatexp >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> B¹n ®· ¨n qu¸ nhiÒu b¸nh råi! Kh«ng thÓ ¨n thªm ®­îc n÷a!")
		return 1
	end
	
	local ran_exp = TAB_EXPVALUE[ random(getn(TAB_EXPVALUE)) ]
	if ( ran_exp + eatexp > CHUNBING_MAX_EXP ) then
		ran_exp = CHUNBING_MAX_EXP - eatexp
	end
	AddOwnExp(ran_exp)
	Msg2Player("<#> B¹n nhËn ®­îc "..ran_exp.."®iÓm kinh nghiÖm.")
	SetTask(TSK_XIANGJIAO, eatexp + ran_exp)
	
	if(GetTask(TSK_XIANGJIAO) >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> B¹n ®· ¨n qu¸ nhiÒu b¸nh råi! Kh«ng thÓ ¨n thªm ®­îc n÷a!")
	else
		Msg2Player("<#> B¹n cßn cã thÓ ¨n thªm b¸nh ®Ó bæ sung "..(CHUNBING_MAX_EXP-GetTask(TSK_XIANGJIAO)).."®iÓm kinh nghiÖm.")
	end
end