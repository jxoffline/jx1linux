Include("\\script\\lib\\composeex.lua")

if not tbVngUpgradeABDQ then
	tbVngUpgradeABDQ ={}	
	tbVngUpgradeABDQ = tbActivityCompose:new()	
end


tbVngUpgradeABDQ.EVENT_LOG_TITLE = "LOGEVENT_FEATURE_CTC_CheTaoABDQ"

--nRoomType : 10 - Room UI bo item vao
tbVngUpgradeABDQ.nRoomType = 10 

tbVngUpgradeABDQ.tbGoldIndexMaterial = {
	[1] = {164,165,166,167,210,211,212,213},
	[2] = {159,160,161,162,163},
}
tbVngUpgradeABDQ.tbEquip_Release = {
	[1] = {
		{szName=" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",tbProp={0,165},nCount=1,nQuality = 1,},
		{szName=" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,166},nCount=1,nQuality = 1,},
		{szName=" §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ",tbProp={0,167},nCount=1,nQuality = 1,},
		{szName=" §å phæ Hoµng Kim - An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,164},nCount=1,nQuality = 1,},
	},
	[2] = {	
		{szName=" §å phæ Hoµng Kim - §Þnh Quèc Ng©n Tµm Yªu ®¸i",tbProp={0,163},nCount=1,nQuality = 1,},
		{szName=" §å phæ Hoµng Kim - §Þnh Quèc Tö §»ng Hé uyÓn",tbProp={0,162},nCount=1,nQuality = 1,},
		{szName=" §å phæ Hoµng Kim - §Þnh Quèc ¤ Sa Ph¸t Qu¸n",tbProp={0,160},nCount=1,nQuality = 1,},
		{szName=" §å phæ Hoµng Kim - §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",tbProp={0,161},nQuality = 1,},
		{szName=" §å phæ Hoµng Kim - §Þnh Quèc Thanh Sa Tr­êng Sam",tbProp={0,159},nCount=1,nQuality = 1,},
	},
	[3] = {
		{szName="[Cùc phÈm] §Þnh Quèc Ng©n Tµm Yªu §¸i",tbProp={0,407},nCount=1,nQuality = 1,},
		{szName="[Cùc phÈm] §Þnh Quèc Tö §»ng Hé UyÓn",tbProp={0,406},nCount=1,nQuality = 1,},	
		{szName="[Cùc phÈm] §Þnh Quèc Thanh Sa Ph¸t Qu¸n",tbProp={0,404},nCount=1,nQuality = 1,},
		{szName="[Cùc phÈm] §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",tbProp={0,405},nCount=1,nQuality = 1,},	
		{szName="[Cùc phÈm] §Þnh Quèc Thanh Sa Tr­êng Sam",tbProp={0,403},nCount=1,nQuality = 1,},	
	},
	[4] = {
		{szName="[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,210},nCount=1,nQuality = 1,},
		{szName="[Hoµn Mü] An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,212},nCount=1,nQuality = 1,},
		{szName="[Hoµn Mü] An Bang Kª HuyÕt Th¹ch Giíi ChØ",tbProp={0,213},nCount=1,nQuality = 1,},
		{szName="[Hoµn Mü] An Bang Cóc Hoa Th¹ch ChØ Hoµn",tbProp={0,211},nCount=1,nQuality = 1,},
	},
}

tbVngUpgradeABDQ.tbEquip_Upgrade = {
	[165] ={szName="[Hoµn Mü] An Bang Cóc Hoa Th¹ch ChØ Hoµn",tbProp={0,211},nCount=1,nQuality = 1,},
	[166] ={szName="[Hoµn Mü] An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,212},nCount=1,nQuality = 1,},
	[167] ={szName="[Hoµn Mü] An Bang Kª HuyÕt Th¹ch Giíi ChØ",tbProp={0,213},nCount=1,nQuality = 1,},
	[164] = {szName="[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,210},nCount=1,nQuality = 1,},
	
	[163] ={szName="[Cùc phÈm] §Þnh Quèc Ng©n Tµm Yªu §¸i",tbProp={0,407},nCount=1,nQuality = 1,},
	[162] ={szName="[Cùc phÈm] §Þnh Quèc Tö §»ng Hé UyÓn",tbProp={0,406},nCount=1,nQuality = 1,},	
	[160] ={szName="[Cùc phÈm] §Þnh Quèc Thanh Sa Ph¸t Qu¸n",tbProp={0,404},nCount=1,nQuality = 1,},
	[161] ={szName="[Cùc phÈm] §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",tbProp={0,405},nCount=1,nQuality = 1,},	
	[159] ={szName="[Cùc phÈm] §Þnh Quèc Thanh Sa Tr­êng Sam",tbProp={0,403},nCount=1,nQuality = 1,},	
}
--nguyen lieu nhan duoc khi phan giai
tbAward_ReleaseEquip = {
	[1] = { --phan thuong trang bi thuong
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nCount = 10, nRate=50,},
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nCount = 15, nRate=40,},
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nCount = 20, nRate=10,},
	},
	[2] = { --phan thuong trang bi an bang hoan my
		{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nCount = 10,nRate=50,},
		{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nCount = 15,nRate=40,},
		{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nCount = 20,nRate=10,},
	},
	[3] = { --phan thuong trang bi an bang hoan my
		{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nCount = 30,nRate=100,},
	},
	[4] = { --phan thuong trang bi an bang hoan my
		{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nCount = 30, nRate=100,},
	},
}
