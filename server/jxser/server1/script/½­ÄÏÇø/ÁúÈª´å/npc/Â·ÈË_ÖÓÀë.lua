--ÁúÈª´å Â·ÈË ÖÓÀë
--ÁúÈª´åĞÂÊÖÈÎÎñ£ºÑô´º°×Ñ©¸ş
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world20 = GetTask(20)
	if (UTask_world20 == 0) and (GetLevel() >= 5) then 		--ÈÎÎñÆô¶¯
		Talk(2,"W20_get","TÊt c¶ c¸c mãn ¨n trong thiªn h¹ ch­a cã mãn nµo mµ ta ch­a lµm qua. Nh­ng mµ cã mét mãn gäi lµ'¢m D­¬ng B¹ch TuyÕt Mü' lµ ta lµm m·i vÉn ch­a ®­îc ","T¹i sao vËy?")
	elseif (UTask_world20 == 5) then
		if (HaveItem(231) == 1) and (HaveItem(232) == 1) then		-- ÈÎÎñÍê³É
			SetTask(20,10)
			DelItem(231)
			DelItem(232)
			Talk(1,"","D­¬ng xu©n Linh Chi! B¹ch TuyÕt B¸ch hîp. Tèt l¾m! ThËt kh«ng biÕt ph¶i lµm sao ®Ó c¶m t¹ ng­¬i. §©y lµ chót İt lßng thµnh, xin h·y nhËn lÊy ")
			AddNote("Mang D­¬ng Xu©n Linh Chi vµ B¹ch TuyÕt B¸ch Hîp giao cho Chung CÇm, hoµn thµnh nhŞÖm vô ")
			Msg2Player("Mang D­¬ng Xu©n Linh Chi vµ B¹ch TuyÕt B¸ch Hîp giao cho Chung CÇm, hoµn thµnh nhŞÖm vô ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("NhËn ®­îc mét miÕng Ngäc Béi ")
			else
				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("NhËn ®­îc mét tói x¹ H­¬ng mµu ®en ")
			end
			AddRepute(8)
			Msg2Player("Danh väng cña b¹n t¨ng thªm 8 ®iÓm ")
		else
			Talk(1,"","Sao h¶? Hai mãn ®å ®ã ng­¬i ®Òu t×m vÒ ®­îc råi µ?")
		end
	elseif (UTask_world20 == 10) then		-- ÈÎÎñÒÑ¾­Íê³É
		Talk(1,"","ThËt lµ c¶m ¬n ng­¬i")
	else
		Talk(1,"","§i trong thiªn h¹, ¨n c¸c mãn ¨n cña thiÖn h¹. C¶ ®êi ta t©m huyÕt chØ lµ ®­îc ¨n tÊt c¶ c¸c mãn ngon trong thiªn h¹ mµ th«i ")
	end
end;

function W20_get()
	Say("Mãn ¨n nµy cÇn ph¶i cã 'D­¬ng Xu©n Linh Chi vµ B¹ch tuyÕt B¸ch hîp,nghe nãi chØ cã ë th«n Long tuyÒn míi cã hai thø nµy. Ta ®· t×m rÊt l©u råi nh­ng vÉn ch­a t×m ®­îc chóng ",2,"T×m gióp «ng ta /W20_get_yes","Kh«ng mµng ®Õn /W20_get_no")
end

function W20_get_yes()
	SetTask(20,5)
	Talk(1,"","§Ó ta gióp «ng t×m!")
	AddNote("NhËn nhiÖm vô gióp Chung CÇm ®i t×m D­¬ng Xu©n Linh Chi vµ B¹ch TuyÕt B¸ch Hîp ")
	Msg2Player("NhËn nhiÖm vô gióp Chung CÇm ®i t×m D­¬ng Xu©n Linh Chi vµ B¹ch TuyÕt B¸ch Hîp ")
end

function W20_get_no()
end
