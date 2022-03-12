--description: Á½ºşÇø °ÍÁêÏØ ¾ÆµêÀÏ°å¶Ô»° ÌìÍõÈëÃÅÈÎÎñ
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\timerhead.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 20) then 							--ÌìÍõ°ïÈëÃÅÈÎÎñ
		Talk(4,"","Chñ qu¸n! ë®©y lo¹i r­îu nµo lµ ngon nhÊt?","R­îu ngon nhÊt ë ®©y lµ <color=Red>Bång Lai Xu©n<color>, nÊu lo¹i r­îu nµy tèn rÊt nhiÒu c«ng søc, h¬n n÷a nguyªn liÖu rÊt khã t×m, v× thÕ gi¸ c¶ sÏ kh«ng rÎ. ","ChØ cÇn r­îu ngon lµ ®­îc, ta muèn mua mét hò, hÕt bao nhiªu tiÒn?","Cã bao nhiªu tiÒn còng kh«ng ®ñ, bëi v× qu¸n chóng ta tõ l©u råi kh«ng cßn b¸n lo¹i r­îu nµy n÷a, v× thiÕu c¸c lo¹i nguyªn liÖu <color=Red>Linh Chi<color>, <color=Red>HuyÒn S©m<color> vµ <color=Red>Hµ Thñ ¤<color>. NÕu kh¸ch quan cã thÓ gióp ta t×m ba mãn nguyªn liÖu nµy, ta sÏ lµm gióp mét hò ")
		SetTask(38,SetByte(GetTask(38),1,40))
		AddNote("§èi tho¹i víi chñ qu¸n r­îu Ba L¨ng huyÖn, biÕt ®­îc cÇn t×m ba lo¹i nguyªn liÖu ®Ó nÊu r­îu: Linh Chi, HuyÒn S©m, Hµ Thñ ¤. ")
		Msg2Player("BiÕt ®­îc cÇn t×m ba lo¹i nguyªn liÖu ®Ó nÊu r­îu: Linh Chi, HuyÒn S©m, Hµ Thñ ¤. ")
	elseif (Uworld38 == 40) then
		if (HaveItem(116) == 1) and (HaveItem(135) == 1) and (HaveItem(144) == 1) then
			if (GetTimerId() > 0) then		-- ÁíÓĞ¼ÆÊ±Æ÷ÔÚÔËĞĞÖĞ
				Talk(1,"","Ng­¬i ®ang mang nhiÖm vô cÊp b¸ch nh­ thÕ, mµ cßn ch¹y lung tung µ?")
				return
			end
			Talk(2,"","Chñ qu¸n! Ta ®· t×m ®ñ ba lo¹i nguyªn liÖu råi, «ng gióp ta nÊu r­îu Bång Lai Xu©n ®i!","§­îc! Nh­ng ph¶i chê mét giê ®ång hå míi xong. ")
			DelItem(116)
			DelItem(135)
			DelItem(144)
			SetTask(38,SetByte(GetTask(38),1,60))
			SetTimer(1 * CTime * FramePerSec, 1)									--¿ªÆô¼ÆÊ±Æ÷
			AddNote("Quay l¹i qu¸n r­îu Ba L¨ng huyÖn, ®­a nguyªn liÖu, biÕt ®­îc cÇn ph¶i ®îi mét giê. ")
			Msg2Player("§­a nguyªn liÖu, biÕt ®­îc cÇn ph¶i ®îi mét giê. ")
		else
			Talk(1,"","Nghe nãi ba lo¹i c©y thuèc nµy sinh tr­ëng t¹i <color=Red>phİa §«ng B¾c Vò L¨ng s¬n<color>, nh­ng ë ®ã cã rÊt nhiÒu qu¸i thó ¨n thŞt ng­êi, v× thÕ kh«ng ai cã can ®¶m ®Õn ®ã. ")
		end
	elseif (Uworld38 == 60) then			-- Îª¼ÆÊ±Æ÷Èİ´í¼ÓÈëÊÖ¶¯³¬Ê±´¦Àí
		i = GetRestSec(1)
		if (i > 0) then
			Talk(1,"","Ch­a ®Õn lóc ®©u, r­îu nÊu ch­a xong, ng­¬i cßn ph¶i ®îi: "..i.."Gi©y, ")
		else
			StopTimer()						--½áÊø¼ÆÊ±
			SetTask(38,SetByte(GetTask(38),1,80))
			TWenroll_getitem()
		end
	elseif (Uworld38 == 80) and (HaveItem(90) == 0) then
		TWenroll_getitem()
	elseif (Uworld38 >= 80) then		-- Íê³É´ËÈÎÎñºó
		Talk(1,"","ThÕ nµo?Bång Lai Xu©n cña bæn tiÖm kh«ng ph¶i lµ h­ danh chø?")
	else
		Talk(1,"","N¬i ®©y chóng ta cã ®ñ thøc ¨n, h¶i s¶n phong phó. Kh¸ch quan muèn ¨n g×? Muèn uèng r­îu g×?")
	end
end;

function TWenroll_getitem()
	AddEventItem(90)
	Msg2Player("LÊy ®­îc mét hò r­îu Bång Lai Xu©n. ")
--	SetTask(3, 8)
	AddNote("Mét giê sau, quay l¹i qu¸n r­îu lÊy ®­îc Bång Lai Xu©n. ")
end
