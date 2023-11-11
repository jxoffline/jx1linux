Include("\\vng_script\\activitysys\\config\\1028\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1028\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")

pActivity.nPak = curpack()

function pActivity:CheckExtPointValue(tbExtPoint)
	if (VngExtPointLib:GetBitValueByVersion(tbExtPoint) == 0) then
		return Talk(1,"","PhÇn th­ëng chØ giµnh cho b»ng h÷u kÝch ho¹t code thµnh c«ng trªn trang chñ. Mçi tµi kho¶n chØ nhËn ®­îc 1 lÇn.")
	end
	return 1
end
function pActivity:SetBitExPoint_Success(tbExtPoint)
	if (VngExtPointLib:SetBitValueByVersion(tbExtPoint,0) ~= 1) then
		return Talk(1,"","Cã lçi khi nhËn th­ëng, xin liªn hÖ B§H")
	end
end