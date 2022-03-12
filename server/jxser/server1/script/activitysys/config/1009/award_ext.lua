Include("\\script\\lib\\log.lua")
_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Chóc mõng <color=yellow>%s<color=green> ®· nhËn ®­îc vËt phÈm <color=yellow>%s<color=green>", GetName(), strItemName)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("B¹n nhËn ®­îc "..nCount.." ®iÓm cèng hiÕn bang héi")
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "SuDungVatPham", nCount.." ®iÓm cèng hiÕn bang héi")
	end
end

tbAward_Ext = {
	["award2000"] = {
		--{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message}
		  {szName = "Kim ¤ KhÝ Giíi - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message},
	},
	["awardspecial"] = { 
			{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200, CallBack = _Message},
			{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={1,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (§ai L­ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={4,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={3,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (Ngäc Béi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={8,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (¸o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={5,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (GiÇy)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={7,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (H¹ng Liªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={0,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (NhÉn Trªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={2,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (NhÉn D­íi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={9,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (Vò KhÝ)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={6,0,0,0,0,0}},
			{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=2},
			{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=2},
			{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},
			{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},
			{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},
			{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=2},
			{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=2},
			{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},
			{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},
			{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},
			{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=40.5},
			{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=10},
			{szName = "§iÓm Kinh NghiÖm", nExp=100000000,nRate=5},
			{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ Y",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ Béi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ H¹ Giíi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=3.3},
			{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=2, CallBack = _Message},
			{szName="Phong V©n Chi B¶o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nRate=1,nExpiredTime=43200, CallBack = _Message},	
		},
	["awardnomal"] ={ --Server cò vµ siªu quang
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
		{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.5},
		{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2,CallBack = _Message},
		{szName="Phong V©n Chi B¶o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1,CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Y",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Béi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ H¹ Giíi",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.001, CallBack = _Message},
		{szName="20000 §iÓm Cèng HiÕn Bang Héi",nCount=1,nRate=4.5, pFun = function() %pContributionAward(20000) end},
		{szName="50000 §iÓm Cèng HiÕn Bang Héi",nCount=1,nRate=2.5, pFun = function() %pContributionAward(50000) end},
		{szName="100000 §iÓm Cèng HiÕn Bang Héi",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
		{szName="MËt tÞch kÜ n¨ng 150 (CÊp 19)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="MËt tÞch kÜ n¨ng 150 (CÊp 20)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200, CallBack = _Message},
		{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
		{szName="Viªm §Õ LÖnh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="Ch×a khãa vµng",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
		{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
		{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName="KÝch C«ng Trî Lùc Hoµn",tbProp={6,1,2952,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="¢m D­¬ng Ho¹t HuyÕt §¬n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="B¸ch Niªn Tr©n Lé",tbProp={6,1,2266,1,0,0},nCount=1,nRate=0.1},
		{szName="Thiªn Niªn Tr©n Lé",tbProp={6,1,2267,1,0,0},nCount=1,nRate=0.1},
		{szName="V¹n Niªn Tr©n Lé",tbProp={6,1,2268,1,0,0},nCount=1,nRate=0.1},
		{szName="Håi thµnh phï (nhá) ",tbProp={6,1,1082,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="Håi thµnh phï (lín) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="Tèng Kim Chiªu Binh LÔ Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName = "§iÓm Kinh NghiÖm", nExp=5000000,nRate=49.527},
		{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=6},
		{szName = "§iÓm Kinh NghiÖm", nExp=15000000,nRate=2.5},
		{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=0.5},
		{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=0.05},
	},
}	