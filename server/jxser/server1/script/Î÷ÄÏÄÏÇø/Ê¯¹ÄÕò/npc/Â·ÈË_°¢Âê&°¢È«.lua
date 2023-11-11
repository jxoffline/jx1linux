--Ê¯¹ÄÕò Â·ÈË °¢Âê&°¢È« ĞÂÊÖÈÎÎñ£º»¹Ç®
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 0) and (GetLevel() >= 3) then		-- ÈÎÎñÆô¶¯
		Talk(3,"W23_get","A Toµn, con ®õng ®i, søc kháe nh­ vËy mµ ®i ®©u?","A M· ®õng c¶n con, nÕu con kh«ng ®i h¸i nÊm lÊy tiÒn ë ®©u ra? ThÈm Gia sÏ kh«ng tha cho chóng ta!","X¶y ra chuyÖn g× vËy?")
	elseif (UTask_world23 == 6) then
		Talk(2,"W23_prise","Ta ®· gióp c¸c ng­êi tr¶ nî råi!","ThËt c¶m ¬n ®¹i hiÖp!")
	else				-- ·ÇÈÎÎñ¶Ô»°
		if (random(0,1) == 0) then
			Talk(1,"","Nh×n thÊy A Quyªn nhµ bªn c¹nh võa xinh võa hiÓu chuyÖn, ta còng muèn cã mét ®øa con, nh­ng chóng ta hiÖn giê rÊt cùc, thiÕu nî ng­êi ta, lµm g× cã tiÒn nu«i con næi.")
		else
			Talk(1,"","¤i! Håi tr­íc søc kháe ta tèt l¾m, bëi v× cã lÇn h¸i cñ Êu tĞ xuèng n­íc, tõ ®ã ng· bÖnh kh«ng thÓ nµo ch÷a trŞ ")
		end
	end
end;

function W23_get()
	Say("Ai dµ! Chóng ta thiÕu tiÒn ThÈm Gia trong th«n, nh­ng v× A Toµn l©m bÖnh rÊt l©u, kh«ng cã tiÒn tr¶ nî. ThÈm gia b¶o mang nhµ chóng ta b¸n hoÆc cÇm ®Ó lÊy tiÒn tr¶ «ng.",2,"§õng véi, ®Ó ta quyÕt ®Şnh giïm «ng. /W23_get_yes","Vèn ®· thiÕu nî th× mäi ng­êi ph¶i cè g¾ng h¬n. /W23_get_no")
end;

function W23_get_yes()
	SetTask(23,3)
	Talk(1,"","Yªn t©m! Giao cho ta ®i! C¸c ng­êi ë ®©y chê tin cña ta.")
	AddNote("NhËn nhiÖm vô gióp A M· vµ A Toµn gi¶i quyÕt g¸nh nÆng, Ğp ThÈm gia bá nî. ")
	Msg2Player("NhËn nhiÖm vô gióp A M· vµ A Toµn gi¶i quyÕt g¸nh nÆng, Ğp ThÈm gia bá nî. ")
end

function W23_get_no()
end

function W23_prise()
	Talk(1,"","§©y lµ quÇn ¸o do chİnh tay ta may, xin h·y nhËn lÊy!")
	SetTask(23,10)
	AddNote("Nãi víi A M· vµ A Toµn lµ ®· tr¶ hÕt nî, nhiÖm vô hoµn thµnh. ")
	Msg2Player("Nãi víi A M· vµ A Toµn lµ ®· tr¶ hÕt nî, nhiÖm vô hoµn thµnh. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("NhËn Cæn y ")
	else
		AddItem(0, 2, 10, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("NhËn CÈm Sam ")
	end
	AddRepute(7)
	Msg2Player("Danh väng cña b¹n t¨ng thªm 7 ®iÓm. ")
end;
