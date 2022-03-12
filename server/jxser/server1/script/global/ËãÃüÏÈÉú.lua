-- ËãÃüÏÈÉú.lua ¿´ÉùÍûÖµµÄËãÃüÏÈÉú
-- By Dan_Deng(2003-11-11)

sexhead = {"ThiÕu hiÖp","N÷ hiÖp"}

Include("\\script\\global\\repute_head.lua")

function main()
	if (GetSex() == 0) then			-- ÄĞÅ®ÓÃ²»Í¬µÄ¶Ô»°
		Say("VŞ thiÕu hiÖp nµy khİ ph¸ch bÊt phµm!  Cã muèn biÕt t­¬ng lai s¸ng l¹n cña m×nh kh«ng? ChØ cÇn 5000 l­îng! ",2,"§­îc! §Ó ta xem thö /view_repute_yes","Kh«ng cÇn ®©u/no")
	else
		Say("VŞ n÷ hiÖp nµy khİ ph¸ch bÊt phµm!  Cã muèn biÕt t­¬ng lai s¸ng l¹n cña m×nh kh«ng? ChØ cÇn 5000 l­îng! ",2,"§­îc! §Ó ta xem thö /view_repute_yes","Kh«ng cÇn ®©u/no")
	end
end

function view_repute_yes()
	if (GetCash() < 500) then
		Talk(1,"","l¹i mét ng­êi kh«ng cã tiÒn n÷a, lµm phİ mÊt nöa ngµy trêi")		
		return 0
	end
	Pay(500)
	repute_exp = GetRepute()
	repute_lvl = GetReputeLevel(repute_exp)
	if (repute_lvl == -1) then			-- ³ö´íÊ±
		Talk(1,"","Tù cæ anh tµi ®a khæ ¶i!  Gian nan lµ ®iÒu khã tr¸nh khái!  Nhí th­¬ng xuyªn v¸i thiªn thÇn cÇu phóc nhĞ! ")
	elseif (repute_lvl == 0) then
		Talk(2,"","X­a nay anh hïng th­êng khæ ¶i, hiÖn giê ng­¬i ®ang gÆp khèn khã, thËm chİ danh väng giang hå cña ng­¬i còng ®ang cã vÊn ®Ò. Xin h·y ®i gÆp Thiªn ThÇn cÇu phóc ®i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> B¸ T¸nh B×nh D©n <color> ")
	elseif (repute_lvl == 1) then
		Talk(2,"","ThÇn Long gi¶ lµm ng­êi trÇn gian. Ng­¬i mÆc dï hiÖn giê ®ang long ®ong, nh­ng sÏ ph¸t triÓn rÊt nhanh, ng­êi tinh ı sÏ ph¸t hiÖn ra ng­¬i lµ thiªn tµi ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> ng­êi míi T¸i XuÊt giang hå <color> ")
	elseif (repute_lvl == 2) then
		Talk(2,"","X­a nay Anh hïng th­êng khæ ¶i, hiÖn giê ng­¬i ®ang gÆp khèn khã, thËm chİ danh väng giang hå còng ®ang cã vÊn ®Ò. Xin h·y ®i gÆp th¸nh thÇn cÇu phóc ®i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> V« Danh TiÓu Tèt <color> ")
	elseif (repute_lvl == 3) then
		Talk(2,"","X­a nay Anh hïng th­êng khæ ¶i, hiÖn giê ng­¬i ®ang gÆp khèn khã, thËm chİ danh väng giang hå còng ®ang cã vÊn ®Ò. Xin h·y ®i gÆp th¸nh thÇn cÇu phóc ®i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> MÆc MÆc V« V¨n <color> ")
	elseif (repute_lvl == 4) then
		Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm giang hå. B¶n lÜnh ®· dÇn dÇn thÓ hiÖn, c¸c Anh hïng hiÖp nghÜa trong giang hå ®· dÇn dÇn chó ı ®Õn Ng­¬i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> S¬ HiÓn Phong Mang <color> ")
	elseif (repute_lvl == 5) then
		Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm giang hå. B¶n lÜnh ®· dÇn dÇn thÓ hiÖn, c¸c Anh hïng hiÖp nghÜa trong giang hå ®· dÇn dÇn chó ı ®Õn Ng­¬i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> TiÓu H÷u Danh Khİ <color> ")
	elseif (repute_lvl == 6) then
		Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm giang hå. B¶n lÜnh ®· dÇn dÇn thÓ hiÖn, c¸c Anh hïng hiÖp nghÜa trong giang hå ®· dÇn dÇn chó ı ®Õn Ng­¬i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> Danh §Çu H­ëng L­îng <color> ")
	elseif (repute_lvl == 7) then
		Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm giang hå. B¶n lÜnh ®· dÇn thÓ hiÖn, c¸c anh hïng hiÖp nghÜa trong giang hå ®· dÇn dÇn chó ı ®Õn ng­¬i. ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> Uy TrÊn NhÊt ph­¬ng <color> ")
	elseif (repute_lvl == 8) then
		Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm giang hå. B¶n lÜnh ®· dÇn thÓ hiÖn, c¸c anh hïng hiÖp nghÜa trong giang hå ®· dÇn dÇn chó ı ®Õn ng­¬i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> Ng¹o ThŞ QuÇn Hïng <color> ")
	elseif (repute_lvl == 9) then
		Talk(2,"","Danh väng giang hå ®· t¨ng lªn tét ®Ønh, giang hå t«n ng­¬i lµ: NhÊt §¹i T«ng s­, Vâ L©m §¹i HiÖp ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> NhÊt §¹i T«ng S­ <color> ")
	else
		Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm giang hå. B¶n lÜnh ®· dÇn dÇn thÓ hiÖn, c¸c anh hïng hiÖp nghÜa ®· dÇn dÇn chó ı ®Õn ng­¬i ","Danh väng giang hå cña ng­¬i hiÖn giê lµ "..repute_exp.."giang hå xem ng­¬i hiÖn giê lµ <color=red> TiÕu Ng¹o giang hå <color> ")
	end
end

function no()
end
