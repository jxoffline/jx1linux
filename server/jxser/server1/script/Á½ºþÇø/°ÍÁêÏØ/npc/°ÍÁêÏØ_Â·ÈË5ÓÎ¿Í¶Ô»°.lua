--Á½ºşÇø °ÍÁêÏØ Â·ÈË5ÓÎ¿Í¶Ô»°
--°ÍÁêÏØĞÂÊÖÈÎÎñ£º¹ÅÀÏÌ«µÄ±¦±´
--suyu
-- Update: Dan_Deng(2003-08-10)

function main(sel)
	UTask_world19 = GetTask(47);
	if (UTask_world19 == 2) then
		if HaveItem(183) == 1 then
			Say("¤ « «! C¸i g× kia! B¹n trÎ cã bøc th­ ph¸p kia, cã thÓ nh­îng l¹i cho ta ®­îc kh«ng, gi¸ c¶ cã thÓ th­¬ng l­îng, bøc th­ ph¸p nµy lµ cña Ph¹m V¨n Chİnh C«ng næi tiÕng ®Êy!",2,"B¸n /yes","Kh«ng b¸n /no")
		else
			Talk(1,"","¤i!...Bao giê th× ta míi cã thÓ t×m ®­îc mét bøc th­ ph¸p quı nh­ thÕ nµy?")
		end
	else
		i = random(0,3)
		if (i == 0) then
			Talk(1,"","§éng §×nh hå nµy cßn ®­îc gäi lµ 'V©n Méng Tr¹ch', phİa B¾c gi¸p Tr­êng Giang, Nam gi¸p bèn con s«ng T­¬ng, T­, Nguyªn, Phong, danh hiÖu lµ 'B¸t B¸ch Lı §éng §×nh Hå'. ")
		elseif (i == 1) then
			Talk(1,"","§éng §×nh hå réng mªnh m«ng, nói non chãt vãt, ®Æc ®iÓm lín nhÊt lµ ngoµi hå cã hå, trong hå cã nói,c¸ nhiÒu v« sè, lau sËy um tïm, n­íc trêi mét s¾c, h¶i ©u bay l­în. Xu©n thu tø quı lu«n thay ®æi. ")
		elseif (i == 2) then
			Talk(1,"","Du kh¸ch?Ph¹m V¨n Chİnh C«ng trong bµi 'Nh¹c d­¬ng lÇu kı' cã viÕt?'D÷ quan phu Ba L¨ng th¾ng tr¹ng,t¹i §éng §×nh nhÊt hå. Hµm viÔn s¬n, Th«n Tr­êng Giang, h¹o h¹o thang thang, hoµnh v« tÕ nhai?triÒu huy tŞch ©m, khİ t­îng v¹n thiªn',§éng §×nh hå nµy xøng ®¸ng ®­îc t«n lµ 'Thiªn h¹ ®Ö nhÊt §éng'!")
		else
			Talk(1,"","¤i!...Bao giê th× ta míi cã thÓ t×m ®­îc mét bøc th­ ph¸p quı nh­ thÕ nµy?")
		end
	end
end;

function yes()
	i = 100 * (random(0,5)+10)
	Talk(2,"","NÕu ng­¬i ®· ®ång ı b¸n cho ta, th× kh«ng ®­îc ®æi ı ®Êy! §Ó xem ta cßn bao nhiªu tiÒn, 5, 10, 15, 20... ","Tèt råi, ®­a ng­¬i "..i.."ng©n l­îng.")
	DelItem(183)
	Earn(i)
	SetTask(47, 3)
	Msg2Player("§­a bøc th­ ph¸p cho ng­êi du kh¸ch, lÊy ®­îc "..i.."ng©n l­îng.")
	AddNote("§­a bøc th­ ph¸p cho nguêi du kh¸ch, hoµn thµnh nhiÖm vô. ")
end;

function no()
	Talk(1,"","Cã thÓ nghÜ l¹i kh«ng? Ta thËt lßng rÊt muèn cã bøc th­ ph¸p nµy. ")
end;
