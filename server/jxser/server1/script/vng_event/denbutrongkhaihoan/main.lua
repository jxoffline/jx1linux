Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbVngDenBuTKH = {
	nStartDate = 201112050800,
	nEndDate = 201112062400,
	tbBitTask = {
		nTaskID = 2912,
		nStartBit = 19,
		nBitCount = 1,
		nMaxValue = 1
	}	
}

function tbVngDenBuTKH:AddDialog(tbDialog)
	if self:IsActive() ~= 1 or tbVNG_BitTask_Lib:getBitTask(self.tbBitTask) == 1 then		
		return
	end
	tinsert(tbDialog,  "NhËn phÇn th­ëng ®Òn bï Trèng Kh¶i Hoµn/#tbVngDenBuTKH:MainDialog()")  	
end

function tbVngDenBuTKH:MainDialog()
	local strTittle = "PhÇn th­ëng §Òn bï Trèng Kh¶i Hoµn yªu cÇu:\n\t<color=red>- Nh©n vËt ®¼ng cÊp trªn 150 hoÆc nh©n vËt ®· trïng sinh kh«ng giíi h¹n ®¼ng cÊp\n\t- §· gia nhËp bang héi.<color>"
	Describe(strTittle, 2, "Ta muèn nhËn/#tbVngDenBuTKH:GetAward()", "§ãng/OnCancel")	
end

function tbVngDenBuTKH:IsActive()
	local now = tonumber(date("%Y%m%d%H%M"));
	if now < self.nStartDate or now >= self.nEndDate then
		return 0
	end
	return 1
end

function tbVngDenBuTKH:GetAward()
	if self:IsActive() ~= 1 then
		Talk(1,"","§· qua thêi gian nhËn th­ëng.")
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "C¸c h¹ ch­a gia nhËp bang héi kh«ng thÓ nhËn phÇn th­ëng nµy!")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTask) == 1 then
		Talk(1, "", "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTask, 1)
	local tbAward = {szName = "§iÓm kinh nghiÖm", nExp = 240e6}
	tbAwardTemplet:Give(tbAward, 1, {"Noel_2011","NhanDenbuTrongKhaiHoan"});
end