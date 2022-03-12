function main()
	local a = "ThuyÒn rång nhá = 1 ®Çu rång + 1 ®u«i rång + 1 th©n rång + 1s­ên rång + 4 m¸i chÌo + 1 b¸nh l¸i + 1 trèng";
	local b = "<enter>ThuyÒn rång truyÒn thèng = 1 ThuyÒn rång nhá + 4 m¸i chÌo";
	local c = "<enter>M· ®Çu thuyÒn rång = 1 ThuyÒn rång nhá + 1 ThuyÒn rång truyÒn thèng + 1 ®Çu rång";
	Say(a..b..c, 2, "Trang kÕ /nextpage", "§ãng/no");
	return 1;
end

function nextpage()
	local d = " ThuyÒn rång ®Çu phông = 1 ThuyÒn rång ®Çu ngùa + 1 ThuyÒn rång truyÒn thèng + 1 ®Çu rång";
	local e = "<enter>ThuyÒn rång h×nh thó = 1 ThuyÒn rång ®Çu phông + 1 ThuyÒn rång ®Çu ngùa + 1 ®Çu rång";
	local f = "<enter>ThuyÒn rång lo¹i lín = 1 ThuyÒn rång h×nh thó + 1 ThuyÒn rång ®Çu phông + 1 ThuyÒn rång ®Çu ngùa";
	Say(d..e..f, 2, "Trang tr­íc/main", "§ãng/no");
end

function no()
end