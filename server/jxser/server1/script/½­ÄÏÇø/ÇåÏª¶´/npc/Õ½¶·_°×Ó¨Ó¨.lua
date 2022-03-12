-- Õ½¶·_°×Ó¨Ó¨.lua
-- By: Dan_Deng(2004-04-13)

function OnDeath()
	Uworld50 = GetTask(50)
	if (Uworld50 == 31) then			-- Á½¸öÈË¶¼´ò°ÜÁË£¬¿ÉÒÔµÃµ½ÊÖÚÍ
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("§¸nh b¹i B¹ch Doanh Doanh ")
		Talk(2,"","B¹ch c« n­¬ng! §©y chİnh lµ lêi thÒ cña c« ph¶i kh«ng?","C¸i tªn nhµ rçi thİch lo chuyÖn cña ng­êi kh¸c, §¹i Kim quèc sÏ kh«ng tha cho ng­¬i")
	elseif (Uworld50 == 30) then
		SetTask(50,32)
		Msg2Player("§¸nh b¹i B¹ch Doanh Doanh ")
		Talk(1,"","A! Ta bŞ th­¬ng råi. MËt sø ®¹i nh©n, mau ch¹y!")
	elseif (Uworld50 == 40) and (HaveItem(383) == 0) then			-- ÖØĞÂµÃµ½ÊÖÚÍ
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("§¸nh b¹i B¹ch Doanh Doanh ")
		Talk(2,"","B¹ch c« n­¬ng! §©y chİnh lµ lêi thÒ cña c« ph¶i kh«ng?","C¸i tªn nhµ rçi thİch lo chuyÖn cña ng­êi kh¸c, §¹i Kim quèc sÏ kh«ng tha cho ng­¬i")
	end
end
