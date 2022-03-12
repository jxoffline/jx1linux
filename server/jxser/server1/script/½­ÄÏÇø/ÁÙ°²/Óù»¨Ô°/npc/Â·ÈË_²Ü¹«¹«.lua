-- ÁÙ°² Â·ÈËNPC ²Ü¹«¹«£¨Ø¤°ï50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		--´ø×Å50¼¶ÈÎÎñ
		Talk(3,"","VÞ c«ng c«ng nµy! Ta muèn vµo gÆp Hoµng th­îng. Cã mét vËt quan träng muèn giao cho Hoµng th­îng. "," Hoµng th­îng hiÖn ®ang nghØ ng¬i. Cø giao vËt ®ã cho ta. Ta sÏ chuyÓn ®Õn cho Hoµng th­îng","µ…chuyÖn nµy… ","Sao h¶? Kh«ng tin t­ëng ta µ? Còng kh«ng chÞu hái tr­íc xem Tµo c«ng c«ng ta lµ ng­êi nh­ thÕ nµo. Hoµng th­îng tõ nhá ®Õn lín ®Òu do ta s¨n sãc. LÏ nµo ta l¹i ®i g¹t ng­¬i sao? ","VËy còng ®­îc!")
		AddNote("Giao bøc ®Þa ®å cho Tµo c«ng c«ng. ")
		Msg2Player("Giao bøc ®Þa ®å cho Tµo c«ng c«ng. ")
		DelItem(199)
		SetTask(8,50*256+30)
		NewWorld(176, 1627, 3206)
	else
		Talk(1,"","Ng­¬i lµ ai? Ai cho ng­¬i ®i vµo ®©y?")
	end
end;
