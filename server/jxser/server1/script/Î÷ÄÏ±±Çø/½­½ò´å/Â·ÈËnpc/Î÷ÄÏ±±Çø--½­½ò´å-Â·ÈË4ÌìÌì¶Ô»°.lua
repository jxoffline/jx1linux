--Î÷ÄÏ±±Çø ½­½ò´å Â·ÈË4ÌìÌì¶Ô»°
--½­½ò´åĞÂÊÖÈÎÎñ£º»¢×ÓµÄµ¯¹­
--suyu
-- Update: Dan_Deng(2003-08-11)
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
	UTask_world18 = GetTask(46);
	if(UTask_world8 == 1) then
		Talk(1,"","Hæ tö ca nãi ®îi khi huynh Êy cã n¸, sÏ dÉn ch¸u ®i b¾n chim, thËt thİch qu¸!")
	elseif(UTask_world18 == 2) then
		Talk(1,"","N¸ cña Hæ Tö ca ch­a lµm xong sao?")
	elseif(UTask_world18 >= 10) then
		Talk(1,"","Hay l¾m, l¸t n÷a Hæ Tö Ca sÏ ®Õn t×m ch¸u!")
	else
		Talk(1,"","Hæ Tö ca lu«n g¹t gÉm ch¸u! Ch¸u ph¶i mĞc mÑ huynh Êy!")
	end
end;
