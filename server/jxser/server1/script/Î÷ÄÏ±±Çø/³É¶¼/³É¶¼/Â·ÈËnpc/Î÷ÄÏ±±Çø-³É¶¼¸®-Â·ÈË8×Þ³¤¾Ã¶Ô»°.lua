--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË8×Þ³¤¾Ã¶Ô»°
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_zouchangjiu()
	else
		Say("Tõ l©u ®· nghe danh Xuyªn Muéi Tö lµ c« n­¬ng võa ®Ñp l¹i võa cã tµi, h«m nay ®­îc diÖn kiÕn qu¶ lµ líi ®ån kh«ng sai. NÕu nh­ mµ ta ch­a cã n­¬ng tö th×...",0)
	end
end;

