_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Chóc mõng <color=yellow>%s<color=green> ®· nhËn ®­îc vËt phÈm <color=yellow>%s<color=green>", GetName(), strItemName)
	AddGlobalNews(strMessage)
	--local handle = OB_Create();
	--ObjBuffer:PushObject(handle, strMessage)
	--RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	--OB_Release(handle)
end	
Award_A = 
{
	{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
	{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.2},
	{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
	{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
	{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},
	{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.4},
	{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
	{szName="Phong V©n Chi B¶o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
	{szName = "Kim ¤ Ph¸t Qu¸n - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim ¤ Kim Kh¶i - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim ¤ Hµi - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim ¤ Yªu §¸i - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}, nRate =0.004, CallBack = _Message},
	{szName = "Kim ¤ Hé UyÓn - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim ¤ H¹ng Liªn - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim ¤ Ngäc Béi - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim ¤ Th­îng Giíi ChØ - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "Kim ¤ H¹ Giíi ChØ - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "Kim ¤ KhÝ Giíi - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, nRate = 0.001, CallBack = _Message},
	{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3210},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3220},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
	{szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.2,nExpiredTime=10080,nUsageTime=60},
	{szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="MÆt n¹ Nguyªn so¸i",tbProp={0,11,447,1,0,0},nCount=1,nRate=1,nExpiredTime=10080,nUsageTime=60},
	{szName="MÆt n¹ Quû ¶nh",tbProp={0,11,455,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Ch×a khãa vµng",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
	{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
	{szName="KÝch C«ng Trî Lùc Hoµn",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="¢m D­¬ng Ho¹t HuyÕt §¬n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Phó Quý CÈm H¹p",tbProp={6,1,2402,1,0,0},nCount=1,nRate=4,nExpiredTime=10080},
	{szName="LÖnh Bµi Thñy TÆc",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Thiªn B¶o Khè LÖnh",tbProp={6,1,2813,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Kim ¤ Trïng LuyÖn Ngäc",tbProp={6,1,3005,1,0,0},nCount=1,nRate=0.2},
	{szName="Tèng Kim Chiªu Binh LÔ Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName = "§iÓm Kinh NghiÖm", nExp=5000000,nRate=46.417},
	{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=6},
	{szName = "§iÓm Kinh NghiÖm", nExp=15000000,nRate=2.5},
	{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=0.5},
	{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=0.05},
}

