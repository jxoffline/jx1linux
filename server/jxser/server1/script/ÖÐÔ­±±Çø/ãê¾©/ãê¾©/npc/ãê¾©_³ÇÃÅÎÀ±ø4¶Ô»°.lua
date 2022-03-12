--ÖĞÔ­±±Çø ãê¾©¸® ³ÇÃÅÎÀ±ø4¶Ô»°£¨ÉÙÁÖÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-08-01)

Include("\\script\\global\\map_helper.lua")
npc_name = "<#> VÖ binh Thµnh m«n"

function default_talk()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(121) == 0)) then		--ÈëÃÅÈÎÎñ½øĞĞÖĞ
		Say("Ng­¬i ¨n gan hïm mËt gÊu råi h¶? Téi lµm n¸o ®éng nha m«n ng­¬i kh«ng g¸nh næi ®©u.",4,"Ng­¬i ph¶i phôc tïng mÖnh lÖnh ë ®©y v« ®iÒu kiÖn /enroll_S1_wrong","Nh÷ng ng­êi hµnh nghiÖp v× n­íc v× d©n /enroll_S1_correct","Phæ thiªn chi h¹, m¹c phi v­¬ng thæ, so¸i thæ chi binh, m¹c phi v­¬ng thÇn /enroll_S1_wrong","TËn t©m b¸o quèc chÕt còng kh«ng hèi hËn  /enroll_S1_wrong")
	else
		Talk(1,"","Bän ng­êi Kim kh«ng gièng ng­êi H¸n chóng ta! Chóng ch¼n biÕt g× ®Õn chuyÖn liªm sØ!")
	end
end;

function enroll_S1_correct()
	Talk(1,"","Xİch §ång kho¸ng mÆc dï kh«ng ®¸ng gi¸ g× nh­ng còng xin tÆng ng­êi lµm quµ vËy!")
	AddEventItem(121)
	Msg2Player("NhËn ®­îc Xİch §ång kho¸ng")
	AddNote("Tr¶ lêi c©u hái cña vÖ binh, nhËn ®­îc Xİch §ång kho¸ng")
end;

function enroll_S1_wrong()
	Talk(1,"","Bän ng­êi Kim kh«ng gièng ng­êi H¸n chóng ta! Chóng ch¼n biÕt g× ®Õn chuyÖn liªm sØ!")
end;
