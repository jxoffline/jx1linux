Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\task_head.lua")
local  _Message =  function (nItemIndex, strBoxName)
	local handle = OB_Create()
	local msg = format("<color=green>Chóc mõng cao thñ <color=yellow>%s<color=green> ®· nhËn ®­îc <color=yellow><%s><color=green> tõ <color=yellow><%s><color>" ,GetName(),GetItemName(nItemIndex), strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
local  BingoBoxAddExp =  function (nAmount, strBoxName)
	AddOwnExp(nAmount)
	Msg2Player("§¹t ®­îc kinh nghiÖm kh«ng thÓ céng dån "..nAmount)
	tbLog:PlayerAwardLog("BachBaoRuong", "SuDungTinhMyBaoRuong", "§iÓm Kinh NghiÖm", "", nAmount)
	local handle = OB_Create()
	local msg = format("<color=green>Chóc mõng cao thñ <color=yellow>%s<color=green> ®· nhËn ®­îc <color=yellow><%s><color=green> tõ <color=yellow><%s><color>" ,GetName(),nAmount.." ®iÓm kinh nghiÖm", strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
tbBingoBoxAward = {
	[3053] = {		--Quý träng b¶o r­¬ng	
		{szName = "Kim ¤ Ph¸t Qu¸n (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Kim Kh¶i (Max Option - Tù chän hÖ ph¸i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Hµi (Max Option) - Tù chän hÖ ph¸i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Yªu §¸i (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Hé UyÓn (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ H¹ng Liªn (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Ngäc Béi (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Th­îng Giíi ChØ (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ H¹ Giíi ChØ (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ KhÝ Giíi (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},	
		{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 12, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=10, pFun = function() %BingoBoxAddExp(200e6, "Quý Träng B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=6, pFun = function() %BingoBoxAddExp(500e6, "Quý Träng B¶o R­¬ng") end},
		{szName="Long §¶m",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="L­u Huúnh",tbProp={0,3500},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Cuång Lan",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Thóy Ngäc B¨ng HuyÒn",tbProp={0,3502},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Ng­ng TuyÕt Hµn S­¬ng",tbProp={0,3504},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Gia H¹n Phï",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Phong V©n Th¹ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3211},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3221},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
	},
	[3054] = {--Tinh Mü B¶o R­¬ng
		{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Béi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ H¹ Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},	
		{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 15, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.5, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Long §¶m",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="L­u Huúnh",tbProp={0,3500},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Cuång Lan",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Thóy Ngäc B¨ng HuyÒn",tbProp={0,3502},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Ng­ng TuyÕt Hµn S­¬ng",tbProp={0,3504},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Gia H¹n Phï",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Phong V©n Th¹ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Phiªn Vò ",tbProp={0,10,7,1,0,0},nCount=1,nRate=4,nExpiredTime=259200, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=15, pFun = function() %BingoBoxAddExp(100e6, "Tinh Mü B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=9, pFun = function() %BingoBoxAddExp(200e6, "Tinh Mü B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=2, pFun = function() %BingoBoxAddExp(500e6, "Tinh Mü B¶o R­¬ng") end},		
	},
}
tbBingoBoxAward_2 = {
	[3053] = {		--Quý träng b¶o r­¬ng	
		{szName = "Kim ¤ Ph¸t Qu¸n (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Kim Kh¶i (Max Option - Tù chän hÖ ph¸i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Hµi (Max Option) - Tù chän hÖ ph¸i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Yªu §¸i (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Hé UyÓn (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ H¹ng Liªn (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Ngäc Béi (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ Th­îng Giíi ChØ (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ H¹ Giíi ChØ (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "Kim ¤ KhÝ Giíi (Max Option) - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},	
		{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=16, pFun = function() %BingoBoxAddExp(200e6, "Quý Träng B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=8, pFun = function() %BingoBoxAddExp(500e6, "Quý Träng B¶o R­¬ng") end},
		{szName="Long §¶m",tbProp={0,3499},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},		
		{szName="Cuång Lan",tbProp={0,3501},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Thóy Ngäc B¨ng HuyÒn",tbProp={0,3502},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Ng­ng TuyÕt Hµn S­¬ng",tbProp={0,3504},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Gia H¹n Phï",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
		{szName="Phong V©n Th¹ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8.4,CallBack = function(nParam) %_Message(nParam, "Quý Träng B¶o R­¬ng") end},
	},
	[3054] = {--Tinh Mü B¶o R­¬ng
		{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Béi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ H¹ Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},			
		{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.8, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.8, CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Long §¶m",tbProp={0,3499},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},		
		{szName="Cuång Lan",tbProp={0,3501},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Thóy Ngäc B¨ng HuyÒn",tbProp={0,3502},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Ng­ng TuyÕt Hµn S­¬ng",tbProp={0,3504},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Gia H¹n Phï",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},
		{szName="Phong V©n Th¹ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=9,CallBack = function(nParam) %_Message(nParam, "Tinh Mü B¶o R­¬ng") end},		
		{szName = "§iÓm Kinh NghiÖm", nRate=16.6, pFun = function() %BingoBoxAddExp(100e6, "Tinh Mü B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=12, pFun = function() %BingoBoxAddExp(200e6, "Tinh Mü B¶o R­¬ng") end},
		{szName = "§iÓm Kinh NghiÖm", nRate=5, pFun = function() %BingoBoxAddExp(500e6, "Tinh Mü B¶o R­¬ng") end},		
	},
}
local tbBingoBoxLog = {
	[3053] = "SuDungQuyTrongBaoRuong",
	[3054] = "SuDungTinhMyBaoRuong",--Tinh Mü B¶o R­¬ng
}
local tbBingoBoxTSKDailyLimit = {
	[3053] = 3078,
	[3054] = 3077,--Tinh Mü B¶o R­¬ng
}
local tbBingoBoxFreeBag = {
	[3053] = {nW = 2, nH = 1},
	[3054] = {nW = 3, nH = 3},--Tinh Mü B¶o R­¬ng
}
local tbHeiLongXianDan = {tbProp={6,1,3278,1,0,0},}
function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	if nP ~= 3053 and nP ~= 3054 then
		return 1
	end
		
	local nTSKID = %tbBingoBoxTSKDailyLimit[nP]
	if PlayerFunLib:CheckTaskDaily(nTSKID, 10, format("Sö dông vËt phÈm %s ®¹t giíi h¹n ngµy, kh«ng thÓ sö dông thªm.", GetItemName(nItemIndex)), "<") ~= 1 then
		return 1
	end
	local tbFreeBag = %tbBingoBoxFreeBag[nP]
	if PlayerFunLib:CheckFreeBagCellWH(tbFreeBag.nW, tbFreeBag.nH, 1, "default") ~= 1  then
		return 1
	end
	
	if GetTask(TSK_TRANSLIFE_5)>0 then
		if PlayerFunLib:CheckFreeBagCell(tbFreeBag.nW*tbFreeBag.nH+1,"default") ~= 1 then
			return 1
		end
		tbAwardTemplet:Give(%tbHeiLongXianDan, 1, {"heilongxiandan"})
	end
	
	PlayerFunLib:AddTaskDaily(nTSKID, 1)	
	if mod(PlayerFunLib:GetTaskDailyCount(nTSKID), 4) == 0 then	
		tbAwardTemplet:Give(tbBingoBoxAward_2[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP].."2"})
	else
		tbAwardTemplet:Give(tbBingoBoxAward[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP]})
	end
	--Meridan material - Modified by DinhHQ - 20120711
	local tbMeridanAward = {szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=2,nBindState=-2}
	tbAwardTemplet:Give(tbMeridanAward, 1, {"KinhMach", %tbBingoBoxLog[nP]})
	return 0
end