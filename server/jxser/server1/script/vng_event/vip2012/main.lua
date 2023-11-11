Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

if (not tbVipAcc2012) then
	tbVipAcc2012 = {};
end

tbVipAcc2012.nStartDate = 20120123;
tbVipAcc2012.nEndDate = 20120220;
tbVipAcc2012.nExtpointID  = 4;
tbVipAcc2012.nBit1   = 9;--acc cã trong danh s¸ch
tbVipAcc2012.nBit2   = 10;--acc ®· nhËn th­ëng


function tbVipAcc2012:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate >= self.nStartDate) and (nCurDate < self.nEndDate) then
		return 1;
	end
	return 0;
end

function tbVipAcc2012:main()
	local tbOpt = {}
	tinsert(tbOpt, {"NhËn", tbVipAcc2012.GetAward, {tbVipAcc2012}})
	tinsert(tbOpt, {"§ãng"})	
	CreateNewSayEx("PhÇn th­ëng dµnh cho VIP lµ 600 triÖu ®iÓm kinh nghiÖm kh«ng céng dån, ®¹i hiÖp cã muèn nhËn ngµy kh«ng?", tbOpt)
end

function tbVipAcc2012:GetAward()
		if( self:IsActive() ~= 1) then
			Talk(1,"","HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng, xin h·y ghÐ th¨m trang chñ ®Ó biÕt thªm th«ng tin.!")
			return
		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit1) ~= 1 ) then
 			Talk(1,"","Xin thø lçi, ®¹i hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng.")
 			return
 		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit2) ~= 0 ) then
 			Talk(1,"","§¹i hiÖp ®· nhËn th­ëng, kh«ng thÓ nhËn thªm.")
 			return
 		end
 		
 		 if (tbExtPointLib:SetBitValue(self.nExtpointID, self.nBit2, 1) ~= 1) then
	 		return
	 	end
	 	
		 local tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=600e6};
		 	
 		tbAwardTemplet:Give(tbAward, 1,{"VipAcc2012","NhanPhanThuongDiemKinhNghiem"})
end

local pEventType = EventSys:GetType("AddNpcOption")
if (tbVipAcc2012:IsActive() ~= 0) then
	nId = pEventType:Reg("NguyÖt Nhi", "NhËn PhÇn th­ëng dµnh cho VIP", tbVipAcc2012.main,{tbVipAcc2012})
end	