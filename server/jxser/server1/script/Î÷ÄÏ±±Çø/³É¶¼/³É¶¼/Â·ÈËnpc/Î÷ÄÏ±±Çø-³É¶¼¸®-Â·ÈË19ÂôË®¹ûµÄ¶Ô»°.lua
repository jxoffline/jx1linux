--西南北区 成都府 路人19卖水果的对话
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
		tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main() 
Say("Tr竔 c﹜ v鮝 r� l筰 v鮝 ti y! C竎 lo筰 tr竔 c﹜ v鮝 m韎 h竔 t� Long Tuy襫 y! C� nho, o, l獏 h穣 ch鋘 甶! H穣 xem 甶! ",0)

end;
