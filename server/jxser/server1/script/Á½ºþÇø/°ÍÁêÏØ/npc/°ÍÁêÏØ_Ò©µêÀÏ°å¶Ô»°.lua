--description: Á½ºşÇø °ÍÁêÏØ Ò©µêÀÏ°å¶Ô»°£¨ÌìÍõ°ï40¼¶ÈÎÎñ¡¢ĞÂÊÖÈÎÎñĞ¡ÓæµùµùµÄ²¡£©
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- ÌìÍõ40¼¶ÈÎÎñ
		Talk(5, "L40_tw_talk2", "T¹i h¹ lµ ®Ö tö Thiªn V­¬ng bang, cã mét ®ång m«n bŞ tróng näc r¾n Xİch LiÖm. Xin thÇn y cho thuèc gi¶i!", "R¾n Xİch LiÖm µ? ThËt lµ nguy hiÓm qu¸!..Ta cã thÓ cøu, c¸i khã lµ ph¶i t×m ®­îc d­îc liÖu ®Ó phèi thuèc!", "Kh«ng biÕt ph¶i cÇn nh÷ng d­îc liÖu g×?", "§©y lµ bİ quyÕt gia truyÒn, nh­ng ng­¬i lµ ®Ö tö Thiªn V­¬ng nªn ta nãi cho nghe! CÇn cã <color=Red>da th»n l»n ®á<color> vµ <color=Red>Lôc Thñ Quy<color>. T×m ®­îc hai thø nµy th× ®ång m«n cña ng­¬i sÏ ®­îc cøu", "Kh«ng biÕt cã thÓ t×m hai thø nµy ë ®©u?")
	elseif(UTask_world18 == 1) then				-- ĞÂÊÖ´åĞ¡ÓæÈÎÎñ
		Talk(1,"","H¶?Bè cña TiÓu Ng­ bÖnh µ? Ng­¬i ®Õn chËm råi! Ta võa b¸n viªn Tú Bµ hoµn cuèi cïng cho ®Ö tö Thiªn V­¬ng. Hay lµ ng­¬i hái thö «ng ta xem")
		Msg2Player("Chñ d­îc ®iÕm cho biÕt Tú Bµ hoµn ®· b¸n hÕt. B¹n h·y ®i hái thö ®Ö tö Thiªn V­¬ng Bang. ")
		AddNote("Tú Bµ hoµn ®· b¸n hÕt. B¹n h·y ®i hái thö ®Ö tö Thiªn V­¬ng Bang. ")
	elseif (UTask_tw == 40*256+50) then
		Say("Nghe nãi trong <color=Red>Phôc L­u ®éng<color> cã <color=Red>Th»n lµn ®á<color> vµ<color=Red>Lôc Thñ Quy<color>, cã ng­êi trªn <color=Red>Thiªn V­¬ng ®¶o<color> ®· nh×n thÊy. ChØ cÇn t×m ®­îc nã th× ®ång m«n sÏ ®­îc cøu", 2, "Ta mua İt thuèc tr­íc ®·/yes", "Ta ph¶i lËp tøc ®i t×m thuèc dÉn/no")
	else							-- ·ÇÈÎÎñ×´Ì¬
		Say("Bæn tiÖm ®Òu lµ thÇn d­îc! Cã bÖnh sÏ khái bÖnh, kh«ng bÖnh sÏ kháe, gi¸ c¶ ph¶i ch¨ng. Mua mét İt chø?", 3, "Giao dŞch/yes", "Ta ®Õn nhËn nhiÖm vô S¬ nhËp/yboss","Kh«ng giao dŞch/no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","Nghe nãi trong <color=Red>Phôc L­u ®éng<color> cã <color=Red>Th»n lµn ®á<color> vµ<color=Red>Lôc Thñ Quy<color>, cã ng­êi trªn <color=Red>Thiªn V­¬ng ®¶o<color> ®· nh×n thÊy", "§a t¹ Ng« thÇn y!")
	SetTask(3, 40*256+50)								-- ÌìÍõ40¼¶ÈÎÎñ
	AddNote("Ng« thÇn y t¹i Ba L¨ng huyÖn cho biÕt: muèn gi¶i näc r¾n cÇn cã da th»n l»n ®á vµ Lôc Thñ Quy")
	Msg2Player("Muèn trŞ ®­îc näc cña §éc xµ, cÇn ph¶i cã da Th»n l»n ®á vµ Lôc Thñ Quy.")
end;

function yes()
	Sale(39);  			--µ¯³ö½»Ò×¿ò
end;

function no()
end;
