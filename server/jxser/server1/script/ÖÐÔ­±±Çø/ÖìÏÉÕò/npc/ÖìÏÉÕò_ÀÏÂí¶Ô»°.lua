--ÖÐÔ­±±Çø ÖìÏÉÕò ÀÏÂí¶Ô»°
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()

Say("ThÊy ®øc h¹nh cña L·o Chu ch­a? BÞ vî qu¶n lý nghiªm ngÆt nh­ vËy, xem ta ®©y ®Õn giê vÉn ch­a lÊy vî. C¸i g×? Kh«ng ®¸ng ®Ó khoe sao? Th«i cót ®i, ch­a vî cã g× lµ kh«ng tèt!",0)

end;
