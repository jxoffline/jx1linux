Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbCodeFanpage = 
{
	nStartDate = 201306270000,
	nEndDate = 201307152400,
	tbExtPoint1 = {nID = 3, nBit = 10, nVer = 1},--n¹p code tõ web
	tbExtPoint2 = {nID = 3, nBit = 11, nVer = 1}, --check gamer ®· nhËn th­ëng		
}

function tbCodeFanpage:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbCodeFanpage:main()
	if (self:IsActive() ~= 1) then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!")
		return
	end	
	
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n, vui lßng chõa Ýt nhÊt 10 « trèng trong hµnh trang råi míi nhËn th­ëng.")
		return
	end
	
	if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint1) ~= 1) then
 		Talk(1,"","Xin lçi! §¹i hiÖp kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
 		return
 	end	
	
	 if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint2) ~= 0 ) then
 		Talk(1,"","§¹i hiÖp ®· nhËn th­ëng råi")
 		return
 	end
	
	 if (tbExtPointLib:SetBitValueByVersion(self.tbExtPoint2, 1) ~= 1) then
	 	return
	 end	
	 local tbAward = {
	 	{szName = "§iÓm Kinh NghiÖm", nExp=500000000},
		{szName="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=50,nBindState=-2},
		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=500,nBindState=-2},
		{szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=20160,nBindState=-2},
		{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nBindState=-2,nExpiredTime=4320},
	 }
 	tbAwardTemplet:Give(tbAward, 1,{"CodeFaceBook","NhanThuongTaiChienTam"})		
end

if tbCodeFanpage:IsActive() then
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("ChiÕn T©m T«n Gi¶", "NhËn phÇn th­ëng n¹p code fanpage", tbCodeFanpage.main,{tbCodeFanpage})
end