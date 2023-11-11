Include("\\script\\activitysys\\config\\15\\head.lua")
Include("\\script\\activitysys\\config\\15\\variables.lua")

local tbAward = {}
pActivity.tbAward = tbAward

-- bBroadcast: ÆÁÄ»ÖÐ¼ä»ÆÉ«¹ö¶¯±ê¼ÇÖµ£¨²»Ìí¼Ó¸Ã±ê¼ÇÖµ£¬Ôò²»»á³öÏÖÆÁÄ»ÖÐ¼ä»ÆÉ«¹ö¶¯£©
-- A½±Àø
tbAward["award_a"] = nil

-- B½±Àø
tbAward["award_b"] = 
{
	-- {szName="B¹ch Hæ B¶o Th¹ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=0.15},
	-- {szName="B¹ch Hæ Thiªn Th¹ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=0.08},
	-- {szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.04,bBroadcast=1},
	-- {szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.06,bBroadcast=1},
	-- {szName="B¹ch Hæ Kim Bµi",tbProp={6,1,3183,1,0,0},nCount=1,nRate=0.05,bBroadcast=1},
	-- {szName="HuyÒn Tinh Kho¸ng Th¹ch ",tbProp={6,1,147,9,0,0},nCount=1,nRate=0.05},
	-- {szName="Tö M·ng Th¹ch",tbProp={6,1,3000,1,0,0},nCount=1,nRate=0.2},
	-- {szName="Kim ¤ Kim Bµi",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.1},
	-- {szName="B¶o R­¬ng Kim ¤ Kh«i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.03,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Y ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Hµi ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Yªu §¸i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Hé UyÓn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ H¹ng Liªn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Béi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.03,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Th­îng Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.02,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ H¹ Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.02,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Vò KhÝ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={2,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.003,bBroadcast=1},
	-- {szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},bBroadcast=1,nRate=0.002},
	-- {szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=15},
	-- {szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- {szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	-- {szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- {szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.2},
	-- {szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.2},
	-- {szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.2},
	-- {szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.2},
	-- {szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.2},
	-- {szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.2},
	-- {szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.2},
	-- {szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.2},
	-- {szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.05},
	-- {szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=20, nBindState=-2},
	-- {szName="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=1,nRate=7, nBindState=-2},
	-- {szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=4,nRate=20},
	-- {szName="B¸ch niªn thÊt tinh th¶o",tbProp={6,1,1674,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="Thiªn niªn thÊt tinh th¶o",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="V¹n Niªn Ngò Th¸i Hoa",tbProp={6,1,2265,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
	-- {szName="NhÊt Kû Cµn Kh«n Phï",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200,bBroadcast=1},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=6000000,nRate=21.325},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=8000000,nRate=6},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=4},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=1},
}

-- C½±Àø
tbAward["award_c"] = 
{
	-- {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200,bBroadcast=1},
	-- {szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.05},
	-- {szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.05},
	-- {szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.03},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=50},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=18},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=100000000,nRate=9.5},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=200000000,nRate=4},
	-- {szName = "§iÓm Kinh NghiÖm", nExp=500000000,nRate=2},
	-- {szName="B¶o R­¬ng Kim ¤ Kh«i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Y ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Hµi ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Yªu §¸i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Hé UyÓn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ H¹ng Liªn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Béi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Th­îng Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ H¹ Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B¶o R­¬ng Kim ¤ Vò KhÝ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.5,bBroadcast=1},
	-- {szName="B¹ch Hæ B¶o Th¹ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=3},
	-- {szName="B¹ch Hæ Thiªn Th¹ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=2},
	-- {szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=1,bBroadcast=1},
	-- {szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.02,bBroadcast=1},
}

-- D½±Àø
tbAward["award_d"] = nil

tbAward["award_special"] = 
{
	-- [200]={szName = "§iÓm Kinh NghiÖm", nExp=300000000,},
	-- [400]={szName = "§iÓm Kinh NghiÖm", nExp=600000000,},
	-- [800]={szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=400,nBindState=-2},
	-- [1200]={szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1000},
	-- [1600]={szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1,bBroadcast=1},
	-- [2000]={szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount = 1,bBroadcast=1,nExpiredTime=43200},	
}