Include("\\script\\misc\\eventsys\\eventsys.lua")

function onEnterMap()
	SetProtectTime(18*3) 
	AddSkillState(963, 1, 0, 18*3) 	
	SetFightState(1)	
	SetPKFlag(1)
	ForbidChangePK(1)
end

function onLeaveMap()
	ForbidChangePK(0)
end

EventSys:GetType("EnterMap"):Reg(200, onEnterMap)
EventSys:GetType("LeaveMap"):Reg(200, onLeaveMap)