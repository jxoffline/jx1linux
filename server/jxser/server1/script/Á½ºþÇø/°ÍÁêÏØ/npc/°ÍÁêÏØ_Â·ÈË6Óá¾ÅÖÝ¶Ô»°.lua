--Á½ºşÇø °ÍÁêÏØ Â·ÈË6Óá¾ÅÖİ¶Ô»°
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
	i = random(0,2)

	if (i == 0) then
		Say("Ngµy tr­íc §¹i Th¸nh Thiªn V­¬ng khëi binh t¹i §éng §×nh hå,thÕ thiªn hµnh ®¹o, diÖt b¹o cøu chóng sinh,®­îc d©n yªu mÕn, lµm triÒu ®×nh rÊt lo sî, ph¸i binh tiªu diÖt. Thiªn V­¬ng qu©n İt ®Şch ®«ng, bŞ b¾t sau ®ã ®· hy sinh ",0)
		return
	end

	if (i == 1) then
		Say("Khi Thiªn V­¬ng bŞ giÕt, D­¬ng c«ng tö cña ngµi ®ang t¹i ngo¹i häc nghÖ, kh«ng thÓ vÒ nh×n mÆt. Khi quay l¹i §éng §×nh Hå, tËp hîp anh em nghÜa qu©n, lËp ra Thiªn V­¬ng Bang. ",0)
		return
	end

	if (i == 2) then
		Say("D­¬ng c«ng tö vâ nghÖ cao c­êng, tµi trİ h¬n ng­êi, Thiªn V­¬ng Bang d­íi bµn tay l·nh ®¹o cña anh ta, ngµy cµng ph¸t triÓn, rÊt ®­îc lßng cña l·o b¸ t¸nh. Nh­ng tõ tr­íc ®Õn giê ta ch­a tõng ®­îc thÊy mÆt tËt cña D­¬ng c«ng tö,nghe nãi ®ã lµ mét thiÕu niªn kh«i ng« tuÊn tó. ",0)
		return
	end;

end;

