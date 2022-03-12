--Á½ºşÇø ÄÏÔÀÕò Â·ÈË3°¢¸£¶Ô»°
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
	if ( GetTask(1256) == 1) then
	
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","Ng­¬i ®Õn thËt ®óng lóc. Chóng ta mau ®i t×m c¨n nguyªn cña dŞch bÖnh nµy ®i! §iÒn Bµ Bµ kh«ng xong råi, lµm ng­êi ta lo l¾ng qu¸.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end

Say("Ta muèn lªn Hoµnh S¬n häc vâ, muèn lµm ng­êi nh­ §éc C« §¹i HiÖp, diÖt trõ c­êng b¹o, gióp ®ì kÎ yÕu, thay trêi hµnh ®¹o, uy phong lÉm liÖt!",0)

end;

