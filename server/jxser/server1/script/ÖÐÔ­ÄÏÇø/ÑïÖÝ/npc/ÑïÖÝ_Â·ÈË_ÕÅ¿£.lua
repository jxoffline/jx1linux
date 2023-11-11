-- ÑïÖİ»áÓÑ¿ÍÕ» Â·ÈËNPC ÕÅ¿££¨Ø¤°ï40¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 40*256+20) and (HaveItem(236) == 1) then		--40¼¶ÈÎÎñÖĞ
		Talk(3,"","Tr­¬ng ®¹i nh©n, ta lµ ®Ö tö C¸i Bang. Ta cã mét bøc hµm th­ quan träng muèn ph¶i giao «ng. Bªn trong cã chøng cø cña cÈu tÆc triÒu ®×nh cÊu kÕt víi giÆc Kim.Ngoµi ra, Kim quèc ©m m­u ¸m s¸t «ng khi «ng trªn ®­êng lªn kinh. Tuy ®Ö tö bæn bang ®· thay ®¹i nh©n h¹ thñ nh÷ng tªn s¸t thñ, nh­ng khã mµ ch¾c ®­îc chóng cã ra tay n÷a hay kh«ng? Xin ®¹i nh©n h·y cè g¾ng b¶o träng!","å! L¹i cã chuyÖn nh­ thÕ! §a t¹ quı bang ®· ra tay t­¬ng trî, bøc hµm th­ nµy rÊt quan träng. Ta nhÊt ®Şnh sÏ ®İch th©n gÆp hoµng th­îng. Kh«ng ph¶i chØ v× sù an nguy cña ta, mµ ph¶i lÊy Quèc n¹n lµm ®Çu! C¸i m¹ng ta nµo cã x¸ chi!","Tr­¬ng ®¹i nh©n lµ trô cét quèc gia! Xin h·y b¶o träng! T¹i h¹ ®i ®©y!")
		DelItem(236)
		SetTask(8,40*256+30)
		AddNote("Giao bøc Thİch s¸t mËt hµm cho Tr­ong TuÊn ")
		Msg2Player("Giao bøc Thİch s¸t mËt hµm cho Tr­ong TuÊn ")
	else
		Talk(1,"","Quèc gia l©m nguy, lµ con d©n ph¶i cã tr¸ch nhiÖm víi ®Êt n­íc.Yªn t©m! Ta nhÊt ®Şnh sÏ kh«ng lµm ng­¬i thÊt väng!")
	end
end;
