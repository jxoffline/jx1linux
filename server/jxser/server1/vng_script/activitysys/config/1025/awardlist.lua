Include("\\vng_script\\activitysys\\config\\1025\\variables.lua")

tbAward_TuiNguyenLieu = {
	{szName="§­êng", tbProp={6,1,30260,1,0,0},nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
	{szName="Trøng", tbProp={6,1,30261,1,0,0}, nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
	{szName="Bét", tbProp={6,1,30262,1,0,0}, nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
	{szName="S÷a", tbProp={6,1,30263,1,0,0}, nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
}

tbAward_BanhSinhNhat = {
	{szName="Quµ Mõng Sinh NhËt", tbProp={6,1,30265,1,0,0},nRate=0.5,nBindState=-2,  nExpiredTime=DATE_END},
	{szName = "§iÓm Kinh NghiÖm", nExp=20000,nRate=50},
	{szName = "§iÓm Kinh NghiÖm", nExp=50000,nRate=30},
	{szName = "§iÓm Kinh NghiÖm", nExp=100000,nRate=15},
	{szName = "§iÓm Kinh NghiÖm", nExp=200000,nRate=4.5},	
}

--phan thuong su dung Tui Qua SN
tbAward_TuiQuaSinhNhat = {
	{szName="Tiªn Th¶o Lé ",tbProp={6,1,71,1,0,0},nCount=1,nRate=1.1,nExpiredTime=43200},
	{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="ThiÕt La H¸n LÔ Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="NÕn H¹nh Phóc",tbProp={6,1,1098,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="NÕn B¸t tr©n phóc nguyÖt",tbProp={6,1,1817,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName=" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",tbProp={0,165},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,166},nCount=1,nRate=0.07,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ",tbProp={0,167},nCount=1,nRate=0.05,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,164},nCount=1,nRate=0.006,nQuality = 1,},
	{szName="[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,210},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="[Hoµn Mü] An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,212},nCount=1,nRate=0.01,nQuality = 1,},
	{szName="[Hoµn Mü] An Bang Kª HuyÕt Th¹ch Giíi ChØ",tbProp={0,213},nCount=1,nRate=0.01,nQuality = 1,},
	{szName="[Hoµn Mü] An Bang Cóc Hoa Th¹ch ChØ Hoµn",tbProp={0,211},nCount=1,nRate=0.01,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc Ng©n Tµm Yªu ®¸i",tbProp={0,163},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc Tö §»ng Hé uyÓn",tbProp={0,162},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc ¤ Sa Ph¸t Qu¸n",tbProp={0,160},nCount=1,nRate=0.07,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",tbProp={0,161},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" §å phæ Hoµng Kim - §Þnh Quèc Thanh Sa Tr­êng Sam",tbProp={0,159},nCount=1,nRate=0.08,nQuality = 1,},
	{szName = "§iÓm Kinh NghiÖm", nExp=20000,nRate=45},
	{szName = "§iÓm Kinh NghiÖm", nExp=50000,nRate=20},
	{szName = "§iÓm Kinh NghiÖm", nExp=100000,nRate=17},
	{szName = "§iÓm Kinh NghiÖm", nExp=200000,nRate=10},
	{szName = "§iÓm Kinh NghiÖm", nExp=300000,nRate=4.793},	
}

tbAward_Limit = --Phan thuong co dinh dat moc
{
	["100"] 	= {{szName = "§iÓm Kinh NghiÖm", nExp=10000000,},},
	["800"] 	= {{szName = "§iÓm Kinh NghiÖm", nExp=30000000,},},
}
