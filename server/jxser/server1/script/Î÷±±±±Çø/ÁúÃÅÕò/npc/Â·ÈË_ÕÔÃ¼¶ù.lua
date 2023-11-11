--ÁúÃÅÕò Â·ÈË ÕÔÃ¼¶ù ĞÂÊÖÈÎÎñ£ºÉÓ¿ÚĞÅ
-- By: Dan_Deng(2003-09-04)

function main(sel)
	UTask_world26 = GetTask(26)
	if (UTask_world26 == 3) then		-- ÈÎÎñÖĞ
		Talk(8,"W26_step2","Mi Nhi c« n­¬ng! Cã ng­êi nhê ta b¸o tin cho c« ","Tin g× vËy?","Tiªu DŞch ¶nh ®· chÕt.","C¸i g×?","Tiªu DŞch ¶nh ®· chÕt råi.","Kh«ng thÓ nµo...Ng­¬i g¹t ta! Ta kh«ng tin!"," (Rèt cuéc lµ thÕ nµo?) "," Lµ ai nãi víi ng­¬i?")
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","Ta ngµy th¸ng ë ®©y chê mong, cuèi cïng th× ®îi ®Õn khi nµo ®©y?")
	end
end;

function W26_step2()
	Talk(1,"","Ta …ta kh«ng thÓ nãi ®­îc! C¸o tõ!")
	SetTask(26,6)
	AddNote("Mang tin nµy nãi víi TriÖu Mi Nhi, kh«ng ngê ph¶n øng cña nµng ta m¹nh mÏ nh­ vËy. Hay lµ ta quay l¹i hái l·o ¨n mµy. ")
	Msg2Player("Mang tin nµy nãi víi TriÖu Mi Nhi, kh«ng ngê ph¶n øng cña nµng ta m¹nh mÏ nh­ vËy. Hay lµ ta quay l¹i hái l·o ¨n mµy. ")
end;
