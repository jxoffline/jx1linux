Include("\\vng_script\\activitysys\\config\\1030\\variables.lua")

tbAward_Use_HOP_VANNIEN_TL= {
	{szName="V¹n Niªn Tr©n Lé", tbProp={6,1,30415,1,0,0},nCount=100,nExpiredTime=DATE_END},
}

tbAward_Use_BACHNIEN_TL = {
	{szName = "§iÓm Kinh NghiÖm: 30000", nExp=30000,},
}

tbAward_Use_THIENNIEN_TL ={	
		{szName = "§iÓm Kinh NghiÖm", nExp=30000,nRate=50},
		{szName = "§iÓm Kinh NghiÖm", nExp=40000,nRate=30},
		{szName = "§iÓm Kinh NghiÖm", nExp=50000,nRate=20 },		
}

--phan thuong moc
tbAward_Limit_ThienNienTL = {
	["1000"]= {{szName = "§iÓm Kinh NghiÖm", nExp=20000000,},},
	["1500"]= {{szName = "§iÓm Kinh NghiÖm", nExp=25000000,},},	
}

tbAward_Limit_VanNienTL = {
	["500"]= {{szName = "§iÓm Kinh NghiÖm", nExp=40000000,},},
	["1000"]= {	
						{						
							{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=97.5},
							{szName="Phông NguyÖt Qu¶ Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
							{szName="Cèng NguyÖt Phï Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
							{szName="[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,210},nCount=1,nRate=0.5,nQuality = 1,},											
						},
						{
							{szName="§¸ V« Cùc",tbProp={6,1,30550,1,0,0},nCount=1,nExpiredTime=7*24*60},
						},
	},
	["2000"]= {						
						{szName = "§iÓm Kinh NghiÖm", nExp=100000000,},						
						{szName="§¸ V« Cùc",tbProp={6,1,30550,1,0,0},nCount=1,nExpiredTime=7*24*60},
					},
	["3000"]= {						
						{szName = "§iÓm Kinh NghiÖm", nExp=150000000,},			
						{szName="§¸ V« Cùc",tbProp={6,1,30550,1,0,0},nCount=1,nExpiredTime=7*24*60},
					},
}

--Phan thuong server All
tbAward_Use_VanNienTL = {	
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
	{szName=" §å phæ Hoµng Kim - An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,164},nCount=1,nRate=0.005,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",tbProp={0,165},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,166},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ",tbProp={0,167},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="HuyÒn Kim Th¹ch",tbProp={6,1,30361,1,0,0},nCount=1,nRate=3.5,nExpiredTime=DATE_END,},
	{szName="Hoµng Kim Th¹ch",tbProp={6,1,30362,1,0,0},nCount=1,nRate=0.2,nExpiredTime=DATE_END,},
	{szName="Kim Quang th¹ch",tbProp={6,1,30386,1,0,0},nCount=1,nRate=3.5,nExpiredTime=DATE_END,},
	{szName="§¸ V« Cùc",tbProp={6,1,30550,1,0,0},nCount=1,nRate=0.001,nExpiredTime=10080},
	{szName="Thiªn Niªn Linh D­îc",tbProp={6,1,4631,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="Cöu Thiªn Linh D­îc",tbProp={6,1,4632,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=5,nRate=4},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=6,nRate=3},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=7,nRate=2},
	{szName="Ngäc Lôc B¶o",tbProp={6,1,30566,1,0,0},nCount=8,nRate=1},
	{szName="§éng S¸t B¹ch Kim §iªu Long Giíi",tbProp={0,143},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="§éng S¸t B¹ch Ngäc Cµn Kh«n Béi",tbProp={0,144},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="§éng S¸t B¹ch Kim Tó Phông Giíi",tbProp={0,145},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn",tbProp={0,146},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="Hång ¶nh ThÈm Viªn UyÓn",tbProp={0,204},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Hång ¶nh KiÕm Bµi",tbProp={0,205},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Hång ¶nh Môc Tóc",tbProp={0,206},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Hång ¶nh Tô Chiªu",tbProp={0,207},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="Cá t­¬i",tbProp={6,1,30567,1,0,0},nCount=1,nRate=0.004},
	{szName="BÉy ngùa",tbProp={6,1,30569,1,0,0},nCount=1,nRate=0.004},
	{szName="D©y thõng",tbProp={6,1,30570,1,0,0},nCount=1,nRate=0.004},
	{szName="Yªn c­¬ng",tbProp={6,1,30571,1,0,0},nCount=1,nRate=0.004},
	{szName="Roi ngùa",tbProp={6,1,30572,1,0,0},nCount=1,nRate=0.004},
	{szName = "§iÓm Kinh NghiÖm", nExp=70000,nRate=34},
	{szName = "§iÓm Kinh NghiÖm", nExp=100000,nRate=25},
	{szName = "§iÓm Kinh NghiÖm", nExp=150000,nRate=9},
	{szName = "§iÓm Kinh NghiÖm", nExp=200000,nRate=4},
	{szName = "§iÓm Kinh NghiÖm", nExp=300000,nRate=2.37},
}
