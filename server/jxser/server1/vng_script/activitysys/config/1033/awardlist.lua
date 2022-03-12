Include("\\vng_script\\activitysys\\config\\1033\\variables.lua")

tbAward_Nhan_KimQuang = {
	{szName="Kim Quang B¾c Kinh Chi Méng",tbProp={0,197},nCount=1,nRate=60,nQuality = 1,},
	{szName="Kim Quang Nh· §iÓn Chi Hån",tbProp={0,202},nCount=1,nRate=40,nQuality = 1,},
}

local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("Chóc mõng ®¹i hiÖp <color=cyan>%s<color> ®· ®æi thµnh c«ng <color=cyan>%s<color>", GetName(), GetItemName(nItemIndex)))
end
--Phan thuong doi ruong HKMP
tbRuongHKMP = {
	[1] = {
				{szName="Thiªn V­¬ng Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4547,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Ngò §éc Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4548,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Thóy Yªn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4549,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="C«n l«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4550,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Thiªn nhÉn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4551,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
	},
	[2] = {
				{szName="ThiÕu l©m Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="§­êng m«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Nga my Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Vâ ®ang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="C¸i bang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
	},
}


--Phan thuong ruong boss
tbAward_KillBoss_KimQuang_Fix = {
	{szName="Thiªn s¬n b¶o lé",tbProp={6,1,72,1,0,0},nCount=2,nExpiredTime=7*24*60},
	{szName="QuÕ hoa töu",tbProp={6,1,125,1,0,0},nCount=1,nExpiredTime=7*24*60},
	{szName="Tiªn th¶o lé",tbProp={6,1,71,1,0,0},nCount=5,nExpiredTime=7*24*60},
	{szName="§¹i lùc hoµn",tbProp={6,0,3,1,0,0},nCount=5,nExpiredTime=7*24*60},
	{szName="Phi tèc hoµn",tbProp={6,0,6,1,0,0},nCount=5,nExpiredTime=7*24*60},
	{szName="T©m t©m t­¬ng ¶nh phï",tbProp={6,1,18,1,0,0},nCount=2,nExpiredTime=7*24*60},
	{szName="Tinh hång b¶o th¹ch",tbProp={4,353,1,1,0,0},nCount=2,},
	{szName="Tö thñy tinh",tbProp={4,239,1,1,0,0},nCount=2,},
	{szName="Bµn nh­îc t©m kinh",tbProp={6,1,12,1,0,0},nCount=2,nExpiredTime=7*24*60},
	{szName="Tiªn th¶o lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=2,nExpiredTime=7*24*60},
}

tbAward_KillBoss_KimQuang_Random ={
	{szName="Kim Quang TrÝch Tinh Hoµn",tbProp={0,194},nCount=1,nRate=9.5,nQuality = 1,},
	{szName="Kim Quang §­êng Nghª Gi¸p",tbProp={0,195},nCount=1,nRate=20,nQuality = 1,},
	{szName="Kim Quang Lôc PhØ Thóy Hé Th©n Phï",tbProp={0,196},nCount=1,nRate=20,nQuality = 1,},
	{szName="Kim Quang B¹ch Kim Yªu §¸i",tbProp={0,198},nCount=1,nRate=9.5,nQuality = 1,},
	{szName="Kim Quang Thiªn Tµm Hé UyÓn",tbProp={0,199},nCount=1,nRate=9.5,nQuality = 1,},
	{szName="Kim Quang Ngò S¾c Ngäc Béi",tbProp={0,200},nCount=1,nRate=2,nQuality = 1,},
	{szName="Kim Quang Thiªn Tµm Ngoa",tbProp={0,201},nCount=1,nRate=20,nQuality = 1,},
	{szName="Kim Quang B«n L«i Toµn Long Th­¬ng",tbProp={0,203},nCount=1,nRate=9.5,nQuality = 1,},
}

--phan thuong su dung kim quang ruong
tbAward_Use_KimQuang_Ruong = {
	{szName="Kim Quang lÖnh",tbProp={6,1,30388,1,0,0},nCount=1,nRate=60,nExpiredTime=DATE_END},
	{szName="Kim Quang TrÝch Tinh Hoµn",tbProp={0,194},nCount=1,nRate=4,nQuality = 1,},
	{szName="Kim Quang §­êng Nghª Gi¸p",tbProp={0,195},nCount=1,nRate=7.3,nQuality = 1,},
	{szName="Kim Quang Lôc PhØ Thóy Hé Th©n Phï",tbProp={0,196},nCount=1,nRate=7.3,nQuality = 1,},
	{szName="Kim Quang B¾c Kinh Chi Méng",tbProp={0,197},nCount=1,nRate=0.0001,nQuality = 1,},
	{szName="Kim Quang B¹ch Kim Yªu §¸i",tbProp={0,198},nCount=1,nRate=4,nQuality = 1,},
	{szName="Kim Quang Thiªn Tµm Hé UyÓn",tbProp={0,199},nCount=1,nRate=4,nQuality = 1,},
	{szName="Kim Quang Ngò S¾c Ngäc Béi",tbProp={0,200},nCount=1,nRate=2,nQuality = 1,},
	{szName="Kim Quang Thiªn Tµm Ngoa",tbProp={0,201},nCount=1,nRate=7.3998,nQuality = 1,},
	{szName="Kim Quang Nh· §iÓn Chi Hån",tbProp={0,202},nCount=1,nRate=0.0001,nQuality = 1,},
	{szName="Kim Quang B«n L«i Toµn Long Th­¬ng",tbProp={0,203},nCount=1,nRate=4,nQuality = 1,},
}
