--description: ĞÂÊÖ´å_ÕÅ´óÔª
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan

function main()
	UTask_world44=GetTask(72)
	if (UTask_world44==2) then
		Talk(8,"","Huynh cã ph¶i lµ Tr­¬ng §¹i Nguyªn kh«ng?"," Lµ ta ®©y, cã chuyÖn g× kh«ng?","Doanh Doanh c« n­¬ng nhê ta ®­a cho huynh chiÕc kh¨n tay nµy, nhê ta nãi l¹i, canh ba ®ªm nay, chç cò, kh«ng gÆp kh«ng vÒ.","C¸i g×? Tr­¬ng §¹i Nguyªn! Anh vÉn cßn giao du víi ¶ thî may Êy µ?"," Lµm g× cã? Ta ®©u cã chuyÖn g× víi c« Êy, n­¬ng tö h·y tin ta.","Nh­ng....."," Nµy, ng­¬i ®õng tïy tiÖn vu c¸o ng­êi tèt chø!",".....….")
		SetTask(72,4)
		Msg2Player("Kh«ng ngê chØ v× mét chiÕc kh¨n tay gÊm mµ bŞ m¾ng chöi, quay l¹i nãi víi Doanh Doanh. ")
		AddNote("T×m thÊy Tr­¬ng §¹i Nguyªn, chuyÓn l¹i lêi cña Doanh Doanh, kh«ng ngê anh ta lµ ng­êi ®· cã vî, kh«ng ®­a ®­îc chiÕc kh¨n tay uyªn ­¬ng, mµ cßn bŞ chöi. ")		
	elseif (UTask_world44==4)  then
		Talk(1,"","§õng tïy tiÖn vu c¸o ng­êi tèt chø!")
	else
		Talk(1,"","Lµm ng­êi thËt kh«ng dÔ, lµm ®µn «ng cµng kh«ng dÔ, lµm ng­êi ®µn «ng ®µo hoa l¹i cµng khã h¬n.")
	end
end
