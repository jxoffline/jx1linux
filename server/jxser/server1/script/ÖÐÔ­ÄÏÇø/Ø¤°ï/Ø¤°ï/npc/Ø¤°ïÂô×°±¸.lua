--丐帮 卖装备的弟子对话
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
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("Th﹏ l�  t� C竔 Bang, c莕 ph秈 gian kh� r蘮 luy謓  b秓 v� ch輓h ngh躠", 2, "Giao d辌h/yes", "Kh玭g giao d辌h/no")
	else
		Talk(1,"","Bang ch� c� l謓h: trang b� c馻 b鎛 m玭 kh玭g 頲 b竛 cho ngi ngo礽")
	end
end;

function yes()
Sale(73)
end;

function no()
end;
