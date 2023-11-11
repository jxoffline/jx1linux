-- Â·ÈË_ĞìÖĞÔ­.lua
-- By: Dan_Deng(2004-04-13)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld50 = GetTask(50)
	if (Uworld50 == 10) then
		Talk(8,"Uworld50_10","Ng­¬i vµ ta ®Òu lµ thanh niªn, sao l¹i gièng nh­ ng­êi giµ ®Õn ®©y d¹y ®êi ta h¶?","Kh«ng! TÊt c¶ chØ lµ Ên t­îng cña c¸ nh©n, bëi v× mçi ng­êi cã lËp tr­êng riªng kh¸c víi c¸ch nghÜ cña ng­êi kh¸. Nªn ta chØ muèn nghe suy nghÜ cña ng­¬i vÒ B¹ch Doanh Doanh nh­ thÕ nµo th«i.","Doanh Doanh b¶n chÊt l­¬ng thiÖn, cã lÇn chóng t«i vµo nói s©u s¨n b¾n kiÕm thøc ¨n, c« Êy v× con vËt nhá bŞ ta b¾n tróng mµ ®au lßng r¬i lÖ.","Ngò §éc gi¸o dùa vµo qu©n Kim xem chóng ta lµ kÎ thï, tr«ng c« ta nh­ vËy ng­¬i kh«ng c¶m thÊy rÊt khã ph©n biÖt thËt gi¶ sao?","Tr­íc ®©y cã thÓ lµ nh­ vËy, nh­ng sau nµy c« Êy thÊy nh©n d©n lÇm than, thËm chİ cßn bŞ qu©n Kim tµn s¸t, th× ®· tù m×nh hèi c¶i nh÷ng viÖc sai tr¸i tr­íc ®©y. C« Êy kh«ng cã c¸ch nµo thuyÕt phôc ®­îc anh m×nh!","Nh­ thÕ th× … ta hiÓu råi!","Ng­¬i lµ ng­êi ®Çu tiªn ®ñ b×nh tÜnh nghe ta nãi vÒ B¹ch Doanh Doanh, xin nhê ng­¬i gi¶i thİch víi cha ta vµ nh÷ng ng­êi kh¸c ®Ó hä hiÓu.","Còng kh«ng nhÊt ®Şnh nh­ vËy! Tr­íc tiªn ta chuÈn bŞ ®i Ngò ®éc gi¸o mét chuyÕn ®Ó nghe B¹ch Doanh Doanh nãi chuyÖn.")
	elseif (Uworld50 == 30) then
		Talk(2,"","Ta ®· nãi B¹ch Doanh Doanh lµ ng­êi thËt lßng, mµ c¸c ng­¬i cßn ch­a tin sao?","Cã lÏ nh­ thÕ! Nh­ng ta khuyªn ng­¬i nhÊt ®Şnh CÈn thËn! Kh«ng nªn qu¸ tin t­ëng c« ta. Ta sÏ tiÕp tôc l­u ı hµnh tung cu¶ c« ta xem cã ph¶i nh­ vËy kh«ng.")
	elseif (Uworld50 == 40) and (HaveItem(383) == 1) then		-- ½»ÈÎÎñÁË
		Talk(5,"Uworld50_prise","VËy.....lÏ nµo B¹ch Doanh Doanh lu«n lõa g¹t ta?","RÊt tiÕc! Nh­ng viÖc c« Êy bİ mËt cÊu kÕt víi qu©n Kim lµ cã thùc!","VËy lµ tõ tr­íc tíi giê ta lu«n bŞ c« ta lîi dông, ta thËt ngu ngèc!","Tõ thiÕu hiÖp chØ lµ nhÊt thêi kh«ng xem xĞt kü, bŞ yªu n÷ lîi dông, tØnh ngé lµ tèt råi, còng kh«ng nªn qu¸ bËn t©m lµm g×.","LÇn nµy may m¾n ®­îc khuyªn gi¶i, thËt kh«ng biÕt c¶m ¬n thÕ nµo míi ph¶i.")
	elseif (Uworld50 >= 50) then			-- ÈÎÎñÒÑ¾­Íê³É
		Talk(1,"","RÊt c¶m ¬n ng­¬i! NÕu kh«ng cã ng­¬i gióp ®ì, b©y giê ta ®· bŞ B¹ch Doanh Doanh bá bïa mª, kh«ng chõng ®· g©y ra sai lÇm nghiªm träng råi.")
	else
		Talk(1,"","C« n­¬ng tèt nh­ B¹ch Doanh Doanh, t¹i sao ai còng ph¶n ®èi?")
	end
end

function Uworld50_10()
	SetTask(50,20)
	Msg2Player("B¹n quyÕt ®Şnh ®Õn Ngò §éc Gi¸o 1 chuyÕn, nghe B¹ch Doanh Doanh tù m×nh gi¶i thİch. ")
end

function Uworld50_prise()
	Talk(1,"","Nh­ thÕ nµy vËy, ta nãi cho ng­¬i nh÷ng kinh nghiÖm khi ta luyÖn vâ, hy väng ng­¬i xem nã cã t¸c dông tham kh¶o.")
	DelItem(383)
	SetTask(50,50)
	AddProp(1)
	AddVit(1)
	Task88_3 = GetByte(GetTask(88),3) + 1
	if (Task88_3 > 255) then Task88_3 = 255 end
	Task88 = SetByte(GetTask(88),3,Task88_3)
	SetTask(88,Task88)			-- ¼ÇÂ¼ÈÎÎñµÃÍâ¹¦µã×ÜÊı
	Msg2Player("Cïng t×m tßi kh¸m ph¸ víi Tõ Trung Nguyªn, ngo¹i c«ng cña b¹n ®· t¨ng lªn 1 ®iÓm. ")
	i = ReturnRepute(25,60,4)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	AddRepute(i)		-- ¼ÓÉùÍû
end
