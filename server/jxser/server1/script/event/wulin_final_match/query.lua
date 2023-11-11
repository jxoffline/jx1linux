IncludeLib("LEAGUE")
function query()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "Tin tøc thi ®Êu cña m×nh/selfmatch", "Tin tøc thi ®Êu cña khu vùc m×nh/owntong", "Tin tøc thi ®Êu cña khu vùc kh¸c/whichtong", "Nh©n tiÖn ghÐ qua th«i/no");
end

function owntong()
	Say("Ng­¬i muèn xem tin tøc h¹ng môc thi ®Êu nµo?", 7, "Danh s¸ch m«n ph¸i thi ®Êu/owntong_SINGLE", "Song ®Êu/owntong_DOUBLE", "Ngò hµnh ®Êu/owntong_FIVE", "ThËp ph¸i ®Êu/owntong_TEN", "ThËp lôc ®Êu/owntong_SIXTEEN", "Trang tr­íc/query", "§ãng/no");
end

function owntong_SINGLE()
	Say("Ng­¬i muèn xem tin tøc ®¬n ®Êu cña m«n ph¸i nµo?", 12, "ThiÕu L©m/owntong_sl", "Thiªn V­¬ng/owntong_tw", "§­êng M«n/owntong_tm", "Ngò §éc/owntong_wu", "Nga Mi/owntong_em", "Thóy Yªn/owntong_cy", "C¸i Bang/owntong_gb", "Thiªn NhÉn/owntong_tr", "Vâ §ang/owntong_wd", "C«n L«n/owntong_kl", "Trang tr­íc/owntong", "§ãng/no");
end

function owntong_sl()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 1_";
	Say("Ng­¬i muèn xem tin tøc ThiÕu L©m ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(1,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(1,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(1,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(1,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(1,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_tw()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 2_";
	Say("Ng­¬i muèn xem tin tøc Thiªn V­¬ng ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(2,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(2,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(2,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(2,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(2,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_tm()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 3_";
	Say("Ng­¬i muèn xem tin tøc §­êng M«n ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(3,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(3,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(3,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(3,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(3,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_wu()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 4_";
	Say("Ng­¬i muèn xem tin tøc Ngò §éc ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(4,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(4,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(4,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(4,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(4,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_em()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 5_";
	Say("Ng­¬i muèn xem tin tøc Nga My ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(5,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(5,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(5,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(5,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(5,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_cy()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 6_";
	Say("Ng­¬i muèn xem tin tøc Thóy Yªn ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(6,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(6,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(6,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(6,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(6,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_gb()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 7_";
	Say("Ng­¬i muèn xem tin tøc C¸i Bang ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(7,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(7,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(7,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(7,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(7,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_tr()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 8_";
	Say("Ng­¬i muèn xem tin tøc Thiªn NhÉn ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(8,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(8,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(8,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(8,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(8,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_wd()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 9_";
	Say("Ng­¬i muèn xem tin tøc Vâ §ang ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(9,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(9,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(9,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(9,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(9,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_kl()
	local owntongteamname = getowntongname().."M«n ph¸i ®¬n ®Êu 10_";
	Say("Ng­¬i muèn xem tin tøc C«n L«n ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(10,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(10,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(10,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(10,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(10,'"..owntongteamname.."5')", "Trang tr­íc/owntong_SINGLE", "§ãng/no");
end

function owntong_DOUBLE()
	local owntongteamname = getowntongname().."Song ®Êu";
	Say("Ng­¬i muèn xem tin tøc Song Nh©n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(11,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(11,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(11,'"..owntongteamname.."3')", "Nhãm thø 4".."/#tonginfo(11,'"..owntongteamname.."4')", "Nhãm thø 5".."/#tonginfo(11,'"..owntongteamname.."5')", "Trang tr­íc/owntong", "§ãng/no");
end

function owntong_FIVE()
	local owntongteamname = getowntongname().."Ngò hµnh ®Êu";
	Say("Ng­¬i muèn xem tin tøc Ngò hµnh ®Êu cña chiÕn ®éi nµo?", 5, "Nhãm thø 1".."/#tonginfo(12,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(12,'"..owntongteamname.."2')", "Nhãm thø 3".."/#tonginfo(12,'"..owntongteamname.."3')", "Trang tr­íc/owntong", "§ãng/no");
end

function owntong_TEN()
	local owntongteamname = getowntongname().."ThËp toµn ®Êu";
	Say("Ng­¬i muèn xem tin tøc ThËp toµn ®Êu cña chiÕn ®éi nµo?", 4, "Nhãm thø 1".."/#tonginfo(13,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(13,'"..owntongteamname.."2')", "Trang tr­íc/owntong", "§ãng/no");
end

function owntong_SIXTEEN()
	local owntongteamname = getowntongname().."ThËp lôc ®Êu";
	Say("Ng­¬i muèn xem tin tøc ThËp lôc ®Êu cña chiÕn ®éi nµo?", 4, "Nhãm thø 1".."/#tonginfo(14,'"..owntongteamname.."1')", "Nhãm thø 2".."/#tonginfo(14,'"..owntongteamname.."2')", "Trang tr­íc/owntong", "§ãng/no");
end

function whichtong()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 6, "Khu 1 ~   Khu 5/tong_1to5", "Khu 6 ~ Khu10/tong_6to10", "Khu 11 ~ Khu15/tong_11to15", "Khu 16 ~ Khu 22/tong_16to22", "Trang tr­íc/query", "§ãng/no");
end

function tong_1to5()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 7, "Khu 1/tong_1", "Khu 2/tong_2", "Khu 3/tong_3", "Khu 4/tong_4", "Khu 5/tong_5", "Trang tr­íc/whichtong", "§ãng/no");
end

function tong_6to10()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 7, "Khu 6/tong_6", "Khu 7/tong_7", "Khu 8/tong_8", "Khu 9/tong_9", "Khu 10/tong_10", "Trang tr­íc/whichtong", "§ãng/no");
end

function tong_11to15()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 7, "Khu 11/tong_11", "Khu 12/tong_12", "Khu 13/tong_13", "Khu 14/tong_14", "Khu 15/tong_15", "Trang tr­íc/whichtong", "§ãng/no");
end

function tong_16to22()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 8, "Khu 16/tong_16", "Khu 17/tong_17", "Khu 18/tong_18", "Khu 19/tong_19", "Khu 20/tong_20", "Khu 22/tong_22", "Trang tr­íc/whichtong", "§ãng/no");
end

function tong_1()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 5, "1-1/#othertong('1-1')", "1-2/#othertong('1-2')", "1-3/#othertong('1-3')", "Trang tr­íc/tong_1to5", "§ãng/no");
end

function tong_2()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 5, "2-1/#othertong('2-1')", "2-2/#othertong('2-2')", "2-3/#othertong('2-3')", "Trang tr­íc/tong_1to5", "§ãng/no");
end

function tong_3()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 5, "3-1/#othertong('3-1')", "3-2/#othertong('3-2')", "3-3/#othertong('3-3')", "Trang tr­íc/tong_1to5", "§ãng/no");
end

function tong_4()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 5, "4-1/#othertong('4-1')", "4-2/#othertong('4-2')", "4-3/#othertong('4-3')", "Trang tr­íc/tong_1to5", "§ãng/no");
end

function tong_5()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "5-1/#othertong('5-1')", "5-2/#othertong('5-2')", "Trang tr­íc/tong_1to5", "§ãng/no");
end

function tong_6()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 5, "6-1/#othertong('6-1')", "6-2/#othertong('6-2')", "6-3/#othertong('6-3')", "Trang tr­íc/tong_6to10", "§ãng/no");
end

function tong_7()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 5, "7-1/#othertong('7-1')", "7-2/#othertong('7-2')", "7-3/#othertong('7-3')", "Trang tr­íc/tong_6to10", "§ãng/no");
end

function tong_8()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "8-1/#othertong('8-1')", "8-2/#othertong('8-2')", "Trang tr­íc/tong_6to10", "§ãng/no");
end

function tong_9()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "9-1/#othertong('9-1')", "9-2/#othertong('9-2')", "Trang tr­íc/tong_6to10", "§ãng/no");
end

function tong_10()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "10-1/#othertong('10-1')", "10-2/#othertong('10-2')", "Trang tr­íc/tong_6to10", "§ãng/no");
end

function tong_11()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 5, "11-1/#othertong('11-1')", "11-2/#othertong('11-2')", "11-3/#othertong('11-3')", "Trang tr­íc/tong_11to15", "§ãng/no");
end

function tong_12()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "12-1/#othertong('12-1')", "12-2/#othertong('12-2')", "Trang tr­íc/tong_11to15", "§ãng/no");
end

function tong_13()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "13-1/#othertong('13-1')", "13-2/#othertong('13-2')", "Trang tr­íc/tong_11to15", "§ãng/no");
end

function tong_14()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 3, "14-1/#othertong('14-1')", "Trang tr­íc/tong_11to15", "§ãng/no");
end

function tong_15()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 3, "15-1/#othertong('15-1')", "Trang tr­íc/tong_11to15", "§ãng/no");
end

function tong_16()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 3, "16-1/#othertong('16-1')", "Trang tr­íc/tong_16to22", "§ãng/no");
end

function tong_17()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 3, "17-1/#othertong('17-1')", "Trang tr­íc/tong_16to22", "§ãng/no");
end

function tong_18()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 3, "18-1/#othertong('18-1')", "Trang tr­íc/tong_16to22", "§ãng/no");
end

function tong_19()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 3, "19-1/#othertong('19-1')", "Trang tr­íc/tong_16to22", "§ãng/no");
end

function tong_20()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 4, "20-1/#othertong('20-1')", "20-2/#othertong('20-2')", "Trang tr­íc/tong_16to20", "§ãng/no");
end

function tong_22()
	Say("Ng­¬i muèn xem tin tøc thi ®Êu cña khu vùc nµo?", 3, "22-1/#othertong('22-1')", "Trang tr­íc/tong_16to20", "§ãng/no");
end

function othertong(tongname)
	Say("Ng­¬i muèn xem tin tøc h¹ng môc thi ®Êu nµo?", 7, "Danh s¸ch m«n ph¸i thi ®Êu/#othertong_SINGLE('"..tongname.."')", "Song ®Êu/#othertong_DOUBLE('"..tongname.."')", "Ngò hµnh ®Êu/#othertong_FIVE('"..tongname.."')", "ThËp ph¸i ®Êu/#othertong_TEN('"..tongname.."')", "ThËp lôc ®Êu/#othertong_SIXTEEN('"..tongname.."')", "Trang tr­íc/whichtong", "§ãng/no");
end

function othertong_SINGLE(tongname)
	Say("Ng­¬i muèn xem tin tøc ®¬n ®Êu cña m«n ph¸i nµo?", 12, "ThiÕu L©m/#othertong_sl('"..tongname.."')", "Thiªn V­¬ng/#othertong_tw('"..tongname.."')", "§­êng M«n/#othertong_tm('"..tongname.."')", "Ngò §éc/#othertong_wu('"..tongname.."')", "Nga Mi/#othertong_em('"..tongname.."')", "Thóy Yªn/#othertong_cy('"..tongname.."')", "C¸i Bang/#othertong_gb('"..tongname.."')", "Thiªn NhÉn/#othertong_tr('"..tongname.."')", "Vâ §ang/#othertong_wd('"..tongname.."')", "C«n L«n/#othertong_kl('"..tongname.."')", "Trang tr­íc/#othertong('"..tongname.."')", "§ãng/no");
end

function othertong_sl(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 1_";
	Say("Ng­¬i muèn xem tin tøc ThiÕu L©m ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(1,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(1,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(1,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(1,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(1,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_tw(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 2_";
	Say("Ng­¬i muèn xem tin tøc Thiªn V­¬ng ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(2,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(2,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(2,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(2,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(2,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_tm(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 3_";
	Say("Ng­¬i muèn xem tin tøc §­êng M«n ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(3,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(3,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(3,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(3,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(3,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_wu(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 4_";
	Say("Ng­¬i muèn xem tin tøc Ngò §éc ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(4,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(4,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(4,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(4,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(4,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_em(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 5_";
	Say("Ng­¬i muèn xem tin tøc Nga My ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(5,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(5,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(5,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(5,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(5,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_cy(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 6_";
	Say("Ng­¬i muèn xem tin tøc Thóy Yªn ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(6,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(6,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(6,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(6,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(6,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_gb(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 7_";
	Say("Ng­¬i muèn xem tin tøc C¸i Bang ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(7,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(7,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(7,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(7,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(7,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_tr(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 8_";
	Say("Ng­¬i muèn xem tin tøc Thiªn NhÉn ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(8,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(8,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(8,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(8,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(8,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_wd(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 9_";
	Say("Ng­¬i muèn xem tin tøc Vâ §ang ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(9,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(9,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(9,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(9,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(9,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_kl(tongname)
	local othertongteamname = tongname.."M«n ph¸i ®¬n ®Êu 10_";
	Say("Ng­¬i muèn xem tin tøc C«n L«n ®¬n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(10,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(10,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(10,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(10,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(10,'"..othertongteamname.."5')", "Trang tr­íc/#othertong_SINGLE('"..tongname.."')", "§ãng/no");
end

function othertong_DOUBLE(tongname)
	local othertongteamname = tongname.."Song ®Êu";
	Say("Ng­¬i muèn xem tin tøc Song Nh©n ®Êu cña chiÕn ®éi nµo?", 7, "Nhãm thø 1".."/#tonginfo(11,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(11,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(11,'"..othertongteamname.."3')", "Nhãm thø 4".."/#tonginfo(11,'"..othertongteamname.."4')", "Nhãm thø 5".."/#tonginfo(11,'"..othertongteamname.."5')", "Trang tr­íc/#othertong('"..tongname.."')", "§ãng/no");
end

function othertong_FIVE(tongname)
	local othertongteamname = tongname.."Ngò hµnh ®Êu";
	Say("Ng­¬i muèn xem tin tøc Ngò hµnh ®Êu cña chiÕn ®éi nµo?", 5, "Nhãm thø 1".."/#tonginfo(12,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(12,'"..othertongteamname.."2')", "Nhãm thø 3".."/#tonginfo(12,'"..othertongteamname.."3')", "Trang tr­íc/#othertong('"..tongname.."')", "§ãng/no");
end

function othertong_TEN(tongname)
	local othertongteamname = tongname.."ThËp toµn ®Êu";
	Say("Ng­¬i muèn xem tin tøc ThËp toµn ®Êu cña chiÕn ®éi nµo?", 4, "Nhãm thø 1".."/#tonginfo(13,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(13,'"..othertongteamname.."2')", "Trang tr­íc/#othertong('"..tongname.."')", "§ãng/no");
end

function othertong_SIXTEEN(tongname)
	local othertongteamname = tongname.."ThËp lôc ®Êu";
	Say("Ng­¬i muèn xem tin tøc ThËp lôc ®Êu cña chiÕn ®éi nµo?", 4, "Nhãm thø 1".."/#tonginfo(14,'"..othertongteamname.."1')", "Nhãm thø 2".."/#tonginfo(14,'"..othertongteamname.."2')", "Trang tr­íc/#othertong('"..tongname.."')", "§ãng/no");
end

function getowntongname()
	return GetTong();
end

function tonginfo(matchtype, tongname)
	leagueid = matchtype + 10
	print("getinfo-"..leagueid..":"..tongname)
	local lid = LG_GetLeagueObj(leagueid, tongname)
	if(FALSE(lid)) then
		print("§éi nhãm kh«ng tån t¹i");
		Say("§éi ng­¬i muèn xem kh«ng tån t¹i.", 0);
		return 0
	end
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name
		end
		local opp = selfinfo2next( lid, 0 )
		Say("Tªn cña chiÕn ®éi nµy lµ [<color=red>"..tongname.."<color>], ®éi tr­ëng lµ <color=red>"..captain.."<color> hiÖn ®ang trong giai ®o¹n dù tuyÓn thi ®Êu, ®iÓm tÝch lòy lµ <color=red>"..mark.."<color>. §· qua <color=red>"..matchcount.."<color> trËn ®Êu, th¾ng <color=red>"..wincount.."<color> trËn, hßa <color=red>"..drawcount.."<color> trËn, b¹i <color=red>"..losecount.."<color> trËn. Thµnh viªn gåm"..num.."ng­êi, danh s¸ch nh­ sau:",getn(opp),opp );
	else
		leaugeid = matchtype + 30;
		local lid = LG_GetLeagueObj(leaugeid, tongname)
		local loldid = LG_GetLeagueObj(matchtype + 10,  tongname)
		if(FALSE(loldid)) then
			print("§éi nhãm kh«ng tån t¹i");
			Say("§éi ng­¬i muèn xem kh«ng tån t¹i.", 0);
			return 0
		end
		if(FALSE(lid)) then
			print("§éi nhãm kh«ng tån t¹i");
			Say("§éi ng­¬i muèn xem kh«ng tån t¹i.", 0);
			return 0
		end
		local num = LG_GetMemberCount(loldid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(loldid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( loldid, 0 )
		if ( position == 32 ) then
			positioninfo = "32 ®éi m¹nh nhÊt";
		elseif ( position == 16 ) then
			positioninfo = "16 ®éi m¹nh nhÊt";
		elseif ( position == 8 ) then
			positioninfo = "8 ®éi m¹nh nhÊt";
		elseif ( position == 4 ) then
			positioninfo = "4 ®éi m¹nh nhÊt";
		elseif ( position == 2 ) then
			positioninfo = "QuyÕt ®Þnh cuèi cïng";
		else
			print("Giai ®o¹n thi ®Êu kh«ng ®óng");
		end
		Say("Tªn cña chiÕn ®éi nµy lµ [ "..tongname.." ], ®éi tr­ëng lµ "..captain..", hiÖn ®ang ë <color=red>"..positioninfo.."<color>. Thµnh viªn gåm"..num..", danh s¸ch nh­ sau:", getn(opp), opp);
	end
end

function selfmatch()
	local tab = {};
	faction = GetLastFactionNumber()+1
	playername = GetName()
	local lid = LG_GetLeagueObjByRole(faction + 10, playername)
	if (not FALSE(lid)) then
		tab[getn(tab) + 1] = "Danh s¸ch m«n ph¸i thi ®Êu/#selfinfo("..faction..")"
	end
	for i = 11, 15 do 
		local lid = LG_GetLeagueObjByRole(i + 10, playername)
		if (not FALSE(lid)) then
			local l_leaguename = LG_GetLeagueInfo(lid)
			tab[getn(tab) + 1] = "chiÕn ®éi ["..l_leaguename.."] ®· gia nhËp.".."/#selfinfo("..i..")"
		end
	end
	if ( getn( tab ) == 0 ) then
		Say("   HiÖn ng­¬i ch­a tham gia trËn ®Êu nµo!", 0)
		return
	end
	tab[getn(tab) + 1] = "Kh«ng cÇn/OnCancel"
	--Say("ÎäÁÖ´ó»á¹ÙÔ±£ºÄãÒª²éÑ¯×Ô¼ºµÄÄÄÏî±ÈÈüÄØ£¿", 7, "ÃÅÅÉµ¥ÏîÈü/#selfinfo(10)", "Ë«ÈËÈü/#selfinfo(11)", "ÎåÐÐÍÅ¶ÓÈü/#selfinfo(12)", "Ê®È«ÍÅ¶ÓÈü/#selfinfo(13)", "16ÈËÍÅ¶ÓÈü/#selfinfo(14)", "ÉÏÒ»Ò³/query", "¹Ø±Õ/no");
	Say("   Ng­¬i muèn xem môc thi ®Êu nµo cña m×nh?", getn(tab),tab);
end

function selfinfo(teamtpye)
	local playername = GetName();
	local lid = LG_GetLeagueObjByRole(teamtpye + 10,playername);
	if(FALSE(lid)) then
		print("§éi nhãm kh«ng tån t¹i");
		Say("   Ng­¬i kh«ng tham gia môc thi ®Êu nµy", 0);
		return 0
	end
	local leaguename = LG_GetLeagueInfo(lid)
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lid, 0 )
		
		Say("Tªn ®éi cña ng­¬i lµ [<color=red>"..leaguename.."<color>], ®éi tr­ëng lµ <color=red>"..captain.."<color> hiÖn ®ang trong giai ®o¹n dù tuyÓn thi ®Êu, ®iÓm tÝch lòy lµ <color=red>"..mark.."<color>. §· qua <color=red>"..matchcount.."<color> trËn ®Êu, th¾ng <color=red>"..wincount.."<color> trËn, hßa <color=red>"..drawcount.."<color> trËn, b¹i <color=red>"..losecount.."<color> trËn. Thµnh viªn gåm"..num.."ng­êi, danh s¸ch nh­ sau:",getn(opp),opp );
	else
		leaugeid = teamtpye + 30;
		local lcirleid = LG_GetLeagueObjByRole(teamtpye + 10,playername);	--Ñ­»·ÈüµÄlid
		local szleaguename = LG_GetLeagueInfo(lcirleid)
		local lid = LG_GetLeagueObj(leaugeid,szleaguename);	--ÌÔÌ­ÈüµÄlid
		if(FALSE(lcirleid)) then
			print("§éi nhãm kh«ng tån t¹i");
			Say("§éi ng­¬i muèn xem kh«ng tån t¹i.", 0);
			return 0
		end
		
		if(FALSE(lid)) then
			print("§éi nhãm kh«ng tån t¹i");
			Say("§éi ng­¬i muèn xem kh«ng tån t¹i.", 0);
			return 0
		end
		local num = LG_GetMemberCount(lcirleid);
		local membername = {}
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lcirleid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lcirleid, 0 )
		if ( position == 32 ) then
			positioninfo = "32 ®éi m¹nh nhÊt";
		elseif ( position == 16 ) then
			positioninfo = "16 ®éi m¹nh nhÊt";
		elseif ( position == 8 ) then
			positioninfo = "8 ®éi m¹nh nhÊt";
		elseif ( position == 4 ) then
			positioninfo = "4 ®éi m¹nh nhÊt";
		elseif ( position == 2 ) then
			positioninfo = "QuyÕt ®Þnh cuèi cïng";
		else
			print("Giai ®o¹n thi ®Êu kh«ng ®óng");
		end
		Say("Tªn ®éi cña ng­¬i lµ [ "..leaguename.." ], ®éi tr­ëng lµ "..captain..", hiÖn ®ang ë <color=red>"..positioninfo.."<color>. Thµnh viªn gåm"..num..", danh s¸ch nh­ sau:", getn(opp), opp);
	end
end

function no()
end

function FALSE(value)
	if (value == nil or value == 0) then
		return 1
	end
	return nil
end

function selfinfo2next( lid, num )
	local count = LG_GetMemberCount(lid);
	local membername = {};
	local opp = {}
	local captain = ""
	for i = 0, count -1 do
		local name,job = LG_GetMemberInfo(lid, i);
		if ( job == 1 ) then
			captain = name
		end
		membername[i + 1] = name;
	end
	if ( getn(membername) - num > 10 ) then
		for i = num+1, num+10 do
			opp[ getn(opp) + 1 ] = membername[i].."/#selfinfo2next("..lid..","..(num+10)..")"
		end
		opp[getn(opp)+1] = "Trang kÕ /#selfinfo2next("..lid..","..(num+10)..")"
	else
		for i = num+1, getn( membername ) do
			opp[getn(opp) + 1] = membername[i]
		end
	end
	opp[getn(opp)+1] = "§ãng/no"
	if( num == 0 ) then
		return opp
	end
	Say("Quan viªn Vâ l©m kiÖt xuÊt:", getn(opp), opp)
end