function GetDesc(nItem)
	return ""
end

function main(nItem)
	Say("Më Ngò Hµnh Phï sÏ nhËn ®­îc 4 tÊm phï lµm gi¶m n¨ng lùc phßng ngù <color=red> B¶o Khè Thñ Hé Gi¶ <color> Thiªn B¶o Khè", 6, 
		"NhËn ®­îc 4 TriÖt Kim Phï/get_chejinfu",
		"NhËn ®­îc 4 TriÖt Méc Phï/get_chemufu", 
		"NhËn ®­îc 4 TriÖt Thñy Phï/get_cheshuifu", 
		"NhËn ®­îc 4 TriÖt Háa Phï/get_chehuofu", 
		"NhËn ®­îc 4 TriÖt Thæ Phï/get_chetufu", 
		"§Ó ta suy nghÜ tr­íc ®·/no");
	return 1	
end

function get_chejinfu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h·y s¾p xÕp l¹i hµnh trang İt nhÊt cßn trèng 1 « råi h·y sö dông Ngò Hµnh Phï")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] sö dông Ngò Hµnh Phï nhËn ®­îc 4 TriÖt Kim Phï",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--¿Û³ıÎåĞĞ·û
	for i = 1, 4 do
		AddItem(6,1,2807,0,0,0)
	end;
end

function get_chemufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h·y s¾p xÕp l¹i hµnh trang İt nhÊt cßn trèng 1 « råi h·y sö dông Ngò Hµnh Phï")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] sö dông Ngò Hµnh Phï nhËn ®­îc 4 TriÖt Méc Phï",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--¿Û³ıÎåĞĞ·û
	for i = 1, 4 do
		AddItem(6,1,2808,0,0,0)
	end;
end

function get_cheshuifu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h·y s¾p xÕp l¹i hµnh trang İt nhÊt cßn trèng 1 « råi h·y sö dông Ngò Hµnh Phï")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] sö dông Ngò Hµnh Phï nhËn ®­îc 4 TriÖt Thñy Phï",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--¿Û³ıÎåĞĞ·û
	for i = 1, 4 do
		AddItem(6,1,2809,0,0,0)
	end;
end

function get_chehuofu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h·y s¾p xÕp l¹i hµnh trang İt nhÊt cßn trèng 1 « råi h·y sö dông Ngò Hµnh Phï")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] sö dông Ngò Hµnh Phï nhËn ®­îc 4 TriÖt Háa Phï",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--¿Û³ıÎåĞĞ·û
	for i = 1, 4 do
		AddItem(6,1,2810,0,0,0)
	end;
end

function get_chetufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h·y s¾p xÕp l¹i hµnh trang İt nhÊt cßn trèng 1 « råi h·y sö dông Ngò Hµnh Phï")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] sö dông Ngò Hµnh Phï nhËn ®­îc 4 TriÖt Thæ Phï",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--¿Û³ıÎåĞĞ·û
	for i = 1, 4 do
		AddItem(6,1,2811,0,0,0)
	end;
end

function no()
end
