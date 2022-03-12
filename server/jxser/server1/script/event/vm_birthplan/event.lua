function vm_BirthPlan()
	Say("<#> Chµo mõng 'Vâ L©m TruyÒn Kú' trßn mét tuæi, tõ 11/6/2006 ®Õn 18/6 c¸c hiÖp kh¸ch luyÖn c«ng sÏ nhËn ®­îc nhiÒu quµ th­ëng thó vŞ! H·y nhanh ch©n lªn!", 3,
	"<#> Lµm b¸nh sinh nhËt./vm_birth_wantcake1",
	"<#> Lµm b¸nh sinh nhËt th­îng h¹n./vm_birth_wantcake2",
	"<#> Ta chØ ®Õn ch¬i th«i!/OnCancel")
end

function vm_birth_wantcake1()
	Say("<#> Lµm b¸nh sinh nhËt cÇn <color=yellow>5 bét tinh vµ 5 ®­êng tinh<color>. Lµm ngay chø?", 2,
	"<#> §óng! Xin s­ phô træ tµi!/vm_birth_makecake1",
	"<#> L¸t n÷a sÏ quay l¹i!/OnCancel")
end

function vm_birth_makecake1()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and ConsumeEquiproomItem(5, 4, 976, 1, -1) == 1 and ConsumeEquiproomItem(5, 4, 977, 1, -1) == 1) then
		AddItem(6,1,1100,1,1,1)--ÉúÈÕµ°¸â
		Say("<#> B¸nh sinh nhËt ®· lµm xong! H·y mang ®i chung vui víi mäi ng­êi!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t sinh nhËt Vâ l©m TruyÒn Kú \t"..GetName().."\t"..GetAccount().."\t Lµm b¸nh sinh nhËt.")
	else
		Say("<#> Lµm b¸nh sinh nhËt cÇn <color=yellow>5 bét tinh vµ 5 ®­êng tinh<color>, cã ®ñ nguyªn liÖu l¹i ®Õn nhĞ!", 0)
	end
end

function vm_birth_wantcake2()
	Say("<#> Lµm b¸nh sinh nhËt th­îng h¹n cÇn <color=yellow>5 bét tinh, 5 ®­êng tinh, 2 s÷a t­¬i vµ 2 trøng gµ<color>. Lµm ngay chø?", 2,
	"<#> §óng! Xin s­ phô træ tµi!/vm_birth_makecake2",
	"<#> L¸t n÷a sÏ quay l¹i!/OnCancel")
end

function vm_birth_makecake2()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	local nCount_egg = CalcEquiproomItemCount(4, 978, 1, 1)
	local nCount_milk = CalcEquiproomItemCount(4, 975, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and nCount_egg >= 2 and nCount_milk >= 2) then
		ConsumeEquiproomItem(2, 4, 978, 1, -1)
		ConsumeEquiproomItem(2, 4, 975, 1, -1)
		ConsumeEquiproomItem(5, 4, 976, 1, -1)
		ConsumeEquiproomItem(5, 4, 977, 1, -1)
		AddItem(6,1,1101,1,1,1)--¸ß¼¶µ°¸â
		Say("<#> B¸nh sinh nhËt ®· lµm xong! H·y mang ®i chung vui víi mäi ng­êi!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t sinh nhËt Vâ l©m TruyÒn Kú \t"..GetName().."\t"..GetAccount().."\t Lµm b¸nh sinh nhËt th­îng h¹n")
	else
		Say("<#> Lµm b¸nh sinh nhËt th­îng h¹n cÇn <color=yellow>5 bét tinh, 5 ®­êng tinh, 2 s÷a t­¬i vµ 2 trøng gµ<color>, cã ®ñ nguyªn liÖu l¹i ®Õn nhĞ!", 0)
	end
end