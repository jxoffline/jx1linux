Include("\\vng_script\\activitysys\\config\\1027\\variables.lua")

tbAward_Use_Hop_QuaGiangsSinh = {
	{szName="Hoa tuyÕt", tbProp={6,1,30371,1,0,0},nCount=1,nRate=33,nExpiredTime=DATE_END},
	{szName="Chu«ng gi¸ng sinh", tbProp={6,1,30373,1,0,0},nCount=1,nRate=33, nExpiredTime=DATE_END},
	{szName="Sao gi¸ng sinh", tbProp={6,1,30374,1,0,0},nCount=1,nRate=34,nExpiredTime=DATE_END},	
}

--phan thuong moc  
tbAward_Limit_NguoiTuyetVang = {
	["1000"]= {{szName = "§iÓm Kinh NghiÖm", nExp=15000000,},},
	["2000"]= {{szName = "§iÓm Kinh NghiÖm", nExp=20000000,},},	
}

tbAward_Limit_NguoiTuyetDo = {
	["500"]= {{szName = "§iÓm Kinh NghiÖm", nExp=40000000,},},
	["1000"]= {					
						{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=97.5},
						{szName="Phông NguyÖt Qu¶ Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="Cèng NguyÖt Phï Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,210},nCount=1,nRate=0.5,nQuality = 1,},
					},
}
--Phan thuong server All
tbAward_Tree ={
	[ID_THONG_TT] =  {szName = "§iÓm Kinh NghiÖm", nExp=30000,},
	[ID_THONG_HK] =  {	
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
					{szName="Thiªn Niªn Linh D­îc",tbProp={6,1,4631,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
					{szName="Cöu Thiªn Linh D­îc",tbProp={6,1,4632,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
					{szName="§éng S¸t B¹ch Kim §iªu Long Giíi",tbProp={0,143},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="§éng S¸t B¹ch Ngäc Cµn Kh«n Béi",tbProp={0,144},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="§éng S¸t B¹ch Kim Tó Phông Giíi",tbProp={0,145},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn",tbProp={0,146},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="Hång ¶nh ThÈm Viªn UyÓn",tbProp={0,204},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="Hång ¶nh KiÕm Bµi",tbProp={0,205},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="Hång ¶nh Môc Tóc",tbProp={0,206},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="Hång ¶nh Tô Chiªu",tbProp={0,207},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="Cá t­¬i",tbProp={6,1,30567,1,0,0},nCount=1,nRate=0.002},
					{szName="BÉy ngùa",tbProp={6,1,30569,1,0,0},nCount=1,nRate=0.002},
					{szName="D©y thõng",tbProp={6,1,30570,1,0,0},nCount=1,nRate=0.002},
					{szName="Yªn c­¬ng",tbProp={6,1,30571,1,0,0},nCount=1,nRate=0.002},
					{szName="Roi ngùa",tbProp={6,1,30572,1,0,0},nCount=1,nRate=0.002},
					{szName = "§iÓm Kinh NghiÖm", nExp=70000,nRate=37},
					{szName = "§iÓm Kinh NghiÖm", nExp=100000,nRate=28},
					{szName = "§iÓm Kinh NghiÖm", nExp=150000,nRate=13},
					{szName = "§iÓm Kinh NghiÖm", nExp=200000,nRate=8},
					{szName = "§iÓm Kinh NghiÖm", nExp=300000,nRate=5.593},		
			 },
}

local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("Chóc mõng ®¹i hiÖp <color=cyan>%s<color> nhËn th­ëng Top 5 ng­êi ®Çu tiªn server sö dông ®¹t mèc 1000 Ng­êi tuyÕt ®á vµ Ng­êi tuyÕt nhËn ®­îc: <color=cyan>%s<color>", GetName(), GetItemName(nItemIndex)))
end
tbAward_Top5 = {
	[1]={
				{szName="ThiÕu l©m Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="§­êng m«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Nga my Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Vâ ®ang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="C¸i bang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
	},
	[2]={
				{szName="Thiªn V­¬ng Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4547,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Ngò §éc Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4548,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Thóy Yªn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4549,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="C«n l«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4550,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Thiªn nhÉn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4551,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="ThiÕu l©m Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="§­êng m«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Nga my Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Vâ ®ang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="C¸i bang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
	},
}