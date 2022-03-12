--ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË5È³×ÓÀî¶Ô»°
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
	Say("C¸i ch©n quÌ nµy cña ta lµ do ®¸nh trËn víi bän giÆc Kim. Còng v× c¸i ch©n nµy mµ cho ®Õn giê ta vÉn ch­a thµnh th©n. Cã nhµ nµo chŞu g¶ con cho mét anh quÌ nh­ ta?",0)
end

