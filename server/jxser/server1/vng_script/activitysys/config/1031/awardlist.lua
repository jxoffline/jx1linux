Include("\\vng_script\\activitysys\\config\\1031\\variables.lua")

tbAward_HopLDKeoQuan = {
	{szName="Lång ®Ìn kÐo qu©n", tbProp={6,1,30308,1,0,0},nCount=1,nExpiredTime=DATE_END}
}

tbAward_HopLDBuomBuom = {
	{szName="Lång ®Ìn b­¬m b­ím", tbProp={6,1,30307,1,0,0},nCount=5,nExpiredTime=DATE_END}
}

tbAward_ThaHoaDang = {
			{szName = "§iÓm Kinh NghiÖm", nExp=200000,nRate=95},
			{szName = "Tinh Hång B¶o Th¹ch", tbProp = {4, 353, 1, 1, 0, 0},nCount=1,nRate=1},
			{szName="ThiÕt La H¸n LÔ Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
			{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
			{szName="Thiªn C¬ LÖnh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
			{szName="Cöu Thiªn Linh D­îc",tbProp={6,1,4632,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
}
tbAwardExpLDKQ = {
	{szName = "§iÓm Kinh NghiÖm", nExp=50000,},
}
tbAward_Question = {	
			{szName="Lång ®Ìn èng", tbProp={6,1,30309,1,0,0},nCount=1,nExpiredTime=DATE_END},
			{szName="Lång ®Ìn trßn", tbProp={6,1,30310,1,0,0},nCount=1,nExpiredTime=DATE_END},
			{szName="Lång ®Ìn ng«i sao", tbProp={6,1,30311,1,0,0},nCount=1,nExpiredTime=DATE_END},	
}

tbAward_DebBu_HHD = {
	{szName="Hoa hång ®á", tbProp={6,1,30299,1,0,0},nCount=250,nExpiredTime=DATE_END,nBindState=-2},
}

tbAward_Use_MinhNguyet = {
			{szName = "§iÓm Kinh NghiÖm", nExp=15000,},
}

tbAward_Use_VienNguyet ={	
		{szName = "§iÓm Kinh NghiÖm", nExp=20000,nRate=50},
		{szName = "§iÓm Kinh NghiÖm", nExp=25000,nRate=30},
		{szName = "§iÓm Kinh NghiÖm", nExp=30000,nRate=19},
		{szName="B¸nh Trung Thu Hoµng NguyÖt", tbProp={6,1,30306,1,0,0},nCount=1,nRate=1,nExpiredTime=DATE_END},
}

--phan thuong moc  
tbAward_Limit_VienNguyet = {
	["500"]= {{szName = "§iÓm Kinh NghiÖm", nExp=10000000,},},
	["1000"]= {{szName = "§iÓm Kinh NghiÖm", nExp=15000000,},},	
}

tbAward_Limit_HoangNguyet = {
	["500"]= {{szName = "§iÓm Kinh NghiÖm", nExp=30000000,},},
	["1000"]= {
						{szName = "§iÓm Kinh NghiÖm", nExp=40000000,nRate=97.5},
						{szName="Phông NguyÖt Qu¶ Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="Cèng NguyÖt Phï Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,210},nCount=1,nRate=0.5,nQuality = 1,},
					},	
}

--Phan thuong server All
tbAward_Use_HoangNguyet = {	
	{szName="Tiªn Th¶o Lé ",tbProp={6,1,71,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="ThiÕt La H¸n LÔ Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=0.4,nExpiredTime=43200},
	{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="Thiªn C¬ LÖnh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=0.5,nExpiredTime=10080},
	{szName="Dao Quang LÖnh",tbProp={6,1,4626,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc Thanh Sa Tr­êng Sam",tbProp={0,159},nCount=1,nRate=0.2,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc ¤ Sa Ph¸t Qu¸n",tbProp={0,160},nCount=1,nRate=0.08,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",tbProp={0,161},nCount=1,nRate=0.3,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc Tö §»ng Hé uyÓn",tbProp={0,162},nCount=1,nRate=0.3,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc Ng©n Tµm Yªu ®¸i",tbProp={0,163},nCount=1,nRate=0.3,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,164},nCount=1,nRate=0.01,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",tbProp={0,165},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,166},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ",tbProp={0,167},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="Thiªn Niªn Linh D­îc",tbProp={6,1,4631,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
	{szName="Cöu Thiªn Linh D­îc",tbProp={6,1,4632,1,0,0},nCount=1,nRate=0.5,nExpiredTime=7*24*60},
	{szName="Lång ®Ìn kÐo qu©n",tbProp={6,1,30308,1,0,0},nCount=1,nRate=1,nExpiredTime=DATE_END},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=5,nRate=5},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=6,nRate=4},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=7,nRate=3},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=8,nRate=2},
	{szName="Hång ¶nh ThÈm Viªn UyÓn",tbProp={0,204},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Hång ¶nh KiÕm Bµi",tbProp={0,205},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Hång ¶nh Môc Tóc",tbProp={0,206},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Hång ¶nh Tô Chiªu",tbProp={0,207},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Cá t­¬i",tbProp={6,1,30567,1,0,0},nCount=1,nRate=0.004},
	{szName="BÉy ngùa",tbProp={6,1,30569,1,0,0},nCount=1,nRate=0.004},
	{szName="D©y thõng",tbProp={6,1,30570,1,0,0},nCount=1,nRate=0.004},
	{szName="Yªn c­¬ng",tbProp={6,1,30571,1,0,0},nCount=1,nRate=0.004},
	{szName="Roi ngùa",tbProp={6,1,30572,1,0,0},nCount=1,nRate=0.004},
	{szName = "§iÓm Kinh NghiÖm", nExp=70000,nRate=35},
	{szName = "§iÓm Kinh NghiÖm", nExp=100000,nRate=25},
	{szName = "§iÓm Kinh NghiÖm", nExp=150000,nRate=10},
	{szName = "§iÓm Kinh NghiÖm", nExp=200000,nRate=4},
	{szName = "§iÓm Kinh NghiÖm", nExp=300000,nRate=2.586},
}
