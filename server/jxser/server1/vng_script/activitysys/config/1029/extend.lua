Include("\\vng_script\\activitysys\\config\\1029\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1029\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1029\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
Include("\\script\\lib\\progressbar.lua")

pActivity.nPak = curpack()

--Function t¾t Bit ExtPoint khi ®· nhËn thÎ HLLB
function pActivity:CheckBitExtPoint(tbBitExt)		
	if (VngExtPointLib:GetBitValueByVersion(tbBitExt) ~= 1) then
		Talk(1,"","C¸c h¹ ch­a nhËp code trªn trang chñ, kh«ng thÓ nhËn th­ëng.")
		return nil
	end
	return 1
end