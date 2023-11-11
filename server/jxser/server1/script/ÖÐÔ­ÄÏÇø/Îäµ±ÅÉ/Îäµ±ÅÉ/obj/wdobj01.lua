--description: Îäµ±ÅÉ³öÊ¦ÈÎÎñ Îäµ±É½±¦Ïä1
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B¶o r­¬ng: HiÖn nay tiÒn tuyÕn phe Tèng <color=Red>bÖnh dŞch h¹ch<color> kĞo dµi, h·y ®Õn <color=Red>T­¬ng D­¬ng<color> t×m <color=Red>Chñ d­îc ®iÕm <color> t×m c¸ch guİp ®ì")
			Msg2Player("GÇn ®©y bÖnh dŞch h¹ch lan trµn trong doanh tr¹i qu©n Tèng, cÇn ph¶i ®Õn thµnh T­¬ng D­¬ng t×m «ng chñ tiÖm thuèc nhê gióp ®ì gi¶i quyÕt. ")
			SetTask(17, SetByte(GetTask(17),1,2))
			AddNote("L¸ bïa trªn b¶o r­¬ng ë Th¸i Tö nham viÕt:: §Õn thµnh T­¬ng D­¬ng t×m chñ tiÖm thuèc t×m c¸ch ng¨n chÆn bÖnh dŞch h¹ch lan trµn trong doanh tr¹i qu©n Tèng. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","B¶o r­¬ng: <color=Red>BÖnh dŞch h¹ch<color> vÉn ®ang kĞo dµi.....")
			Msg2Player("BÖnh dŞch h¹ch vÉn ®ang lan trµn... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(69)
			Say("<color=Red>BÖnh dŞch h¹ch<color> ®· trõ, më b¶o r­¬ng, ph¸t hiÖn 1 quyÓn <color=Red>'Ngäc Thanh Ch©n Kinh'<color>.", 0)
			Msg2Player("BÖnh dŞch h¹ch ®­îc tiªu diÖt, cã bé Ngäc Thanh Ch©n Kinh. ")
			SetTask(17, SetByte(GetTask(17),1,10))
			AddNote("Më B¶o r­¬ng cã Ngäc Thanh Ch©n Kinh. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(69) == 0) then
				AddEventItem(69)
			else
				Talk(1,"","B¶o r­¬ng ®· rçng")
			end
		end
	else
		Talk(1,"","Ch­a nhËn nhiÖm vô! B¹n kh«ng thÓ më B¶o r­¬ng nµy!")
	end
end;
