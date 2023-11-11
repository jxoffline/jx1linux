--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË13ºØÀ¼Ö¥¶Ô»°
Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
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
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_helanzhi()
	else
		Say("Chång ta ë Thµnh §« lµm sai ®Çu, rÊt cùc khæ! Ta ph¶i mét vµi mãn ngon cho huynh Êy ®Ó båi bæ søc khoÎ.",0)
	end
end;