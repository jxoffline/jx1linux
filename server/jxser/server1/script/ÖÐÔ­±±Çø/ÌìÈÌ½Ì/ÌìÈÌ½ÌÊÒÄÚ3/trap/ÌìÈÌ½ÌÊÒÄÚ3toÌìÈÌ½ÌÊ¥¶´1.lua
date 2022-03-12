--description: ÖĞÔ­±±Çø ÌìÈÌ½ÌÊÒÄÚ3toÌìÈÌ½ÌÊ¥¶´1 ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/20
--Trap ID£ºÖĞÔ­±±Çø 5
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
--	if (GetFaction() ~= "tianren") then
	if (UTask_tr >= 60*256+50) and (GetFaction() == "tianren") then
		NewWorld(51, 1666, 3291)
		SetFightState(1)						--Íæ¼Ò×ª»»³ÉÕ½¶·×´Ì¬
	elseif (UTask_tr > 60*256) and (UTask_tr < 60*256+50) then
		Talk(1,"","B¹n ch­a ®­a 5 thanh ®o¶n kiÕm cho Hoµn Nhan Hïng LiÖt, ch­a thÓ vµo Th¸nh ®éng.")
		SetPos(1749, 3081)						--ÉèÖÃ×ß³öTrapµã
	else
		Talk(1,"","§©y lµ Th¸nh ®éng Thiªn NhÉn gi¸o, nh÷ng ng­êi ®· vµo kh«ng thÓ trë ra.")
		SetPos(1749, 3081)						--ÉèÖÃ×ß³öTrapµã
	end
end;
