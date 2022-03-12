-- Î÷ÄÏÄÏÇø ´äÑÌÃÅto½ûµØÃÔ¹¬¡¡´äÑÌ60¼¶ÈÎÎñ
--Trap ID£ºÎ÷ÄÏÄÏÇø 17
-- By: Dan_Deng(2003-09-09)

function main(sel)
	UTask_cy = GetTask(6)
	if (UTask_cy > 60*256) and (GetFaction() == "cuiyan") then
		SetFightState(1)
		NewWorld(158, 1584, 3191);
	elseif (UTask_cy <= 60*256) then
--		SetPos()
		Talk(1,"","Kh«ng ®­îc x«ng vµo cÊm ®Þa bæn m«n!")
	else
--		SetPos()
		Talk(1,"","N¬i nµy lµ cÊm ®Þa Thóy Yªn kh«ng ®­îc x«ng vµo!")
	end
end;
