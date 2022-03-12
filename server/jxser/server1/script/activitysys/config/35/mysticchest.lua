Include("\\script\\activitysys\\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
function main(nIdx)
	if tbVngMysticChest:IsActive() ~= 1 then
		Talk(1, "", "VËt phÈm nµy chØ cã thÓ sö dông vµo thêi gian: <color=red>00h00 ngµy 22 th¸ng 10 n¨m 2011 ®Õn 24h00 ngµy 31 th¸ng 10 n¨m 2011<color>")
		return 1
	end
	if PlayerFunLib:VnCheckInCity("default") ~= 1 or PlayerFunLib:CheckFreeBagCell(2,"default") ~= 1 then
		return 1
	end
	 tbVngMysticChest:Use()
	return 0
end

MysticChestAnnounce = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Chóc mõng <color=yellow>%s<color=green> ®· nhËn ®­îc vËt phÈm <color=yellow>%s<color=green> khi sö dông <color=yellow>R­¬ng ThÇn BÝ<color>", GetName(), strItemName)
	local handle = OB_Create()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Tong(nTongId, strMessage)
	end
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbVngMysticChest = {}
tbVngMysticChest.tbAward =
{
	{szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=10, CallBack = MysticChestAnnounce},
	{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2, CallBack = MysticChestAnnounce},
	{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=2, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.6, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.4, CallBack = MysticChestAnnounce},
	{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=70},
	{szName = "§iÓm Kinh NghiÖm", nExp=100000000,nRate=13},	
}

function tbVngMysticChest:IsActive()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate < 201110220000 or nCurDate > 201110312400 then
		return 0
	end
	return 1
end

function tbVngMysticChest:Use()
	tbAwardTemplet:Give(self.tbAward, 1, {"Event_Thang10", "SuDungRuongThanBi"})
end