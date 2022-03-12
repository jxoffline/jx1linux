Include("\\vng_script\\activitysys\\config\\1029\\variables.lua")

tbAward_Code ={
	[1] = {
				{szName = "Phi V©n ThÇn M·", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=8,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "QuÕ Hoa Töu", tbProp={6,1,125,1,0,0},nCount=8,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Hép quµ offline",tbProp={6,1,30379,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},
	},
	[2] = {
				{szName = "Phi V©n ThÇn M·", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=14*24*60,nBindState=-2},
				{szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=7*24*60, nBindState=-2},
				{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "QuÕ Hoa Töu", tbProp={6,1,125,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Hép quµ offline",tbProp={6,1,30379,1,0,0},nCount=10,nExpiredTime=7*24*60,nBindState=-2},
	},
	[3] = {
				{szName = "Phi V©n ThÇn M·", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=14*24*60,nBindState=-2},
				{szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=3*24*60, nBindState=-2},
				{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "QuÕ Hoa Töu", tbProp={6,1,125,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Hép quµ offline",tbProp={6,1,30379,1,0,0},nCount=10,nExpiredTime=7*24*60,nBindState=-2},
	},
	[4] = {
				{szName = "Phi V©n ThÇn M·", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=14*24*60,nBindState=-2},
				{szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=3*24*60, nBindState=-2},
				{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "QuÕ Hoa Töu", tbProp={6,1,125,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Hép quµ offline",tbProp={6,1,30379,1,0,0},nCount=20,nExpiredTime=7*24*60,nBindState=-2},
	},
	[5] = {				
				{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "QuÕ Hoa Töu", tbProp={6,1,125,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Hép quµ offline",tbProp={6,1,30379,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},
	},
}

local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("Chóc mõng ®¹i hiÖp <color=cyan>%s<color> më hép quµ offline nhËn ®­îc: <color=cyan>%s<color>", GetName(), GetItemName(nItemIndex)))
end
--Phan thuong doi ruong HKMP
tbAward_Offline_Box = {
			
				{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=1,nRate=12,nExpiredTime=7*24*60,nBindState=-2,},
				{szName="ThiÕt La H¸n LÔ Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=5,nExpiredTime=7*24*60,nBindState=-2},				
				{szName="Thiªn C¬ LÖnh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=7,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Dao Quang LÖnh",tbProp={6,1,4626,1,0,0},nCount=1,nRate=10,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Thiªn Niªn Linh D­îc",tbProp={6,1,4631,1,0,0},nCount=1,nRate=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Cöu Thiªn Linh D­îc",tbProp={6,1,4632,1,0,0},nCount=1,nRate=12,nExpiredTime=7*24*60,nBindState=-2},
				
				{szName="Thiªn V­¬ng Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4547,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Ngò §éc Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4548,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Thóy Yªn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4549,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="C«n l«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4550,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Thiªn nhÉn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4551,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
	
				{szName="ThiÕu l©m Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="§­êng m«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Nga my Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Vâ ®ang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="C¸i bang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				
				{szName = "§iÓm Kinh NghiÖm", nExp=1000000,nRate=20},
				{szName = "§iÓm Kinh NghiÖm", nExp=2000000,nRate=18.93},
}


