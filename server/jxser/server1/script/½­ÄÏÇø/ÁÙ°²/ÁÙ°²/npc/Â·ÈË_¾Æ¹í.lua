-- ÁÙ°²¡¡Â·ÈË¡¡¾Æ¹í
-- by£ºDan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
	i = random(0,6)
	Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 ~= 0 ) then
		branch_zuihan()
	else
		if (i == 0) then
			Talk(1,"","Töu quû ta t©m nguyÖn lín nhÊt lµ ®­îc uèng tÊt c¶ r­îu ngon cña thiªn h¹,chØ cÇn ®¹t ®­îc t©m nguyÖn nµy cã chÕt còng cam lßng. ")
		elseif (i == 1) then
			Talk(1,"","R­îu Giang T«, r­îu L©m An, T©y Hå ®Ö nhÊt töu, Thanh xuyªn Hång l¹c töu, Cöu Ch©u nhÊt d¹ töu...tÊt c¶ ta ®· ®Òu nÕm qua nh­ng vÉn ch­a xøng lµ ®Ö nhÊt töu ")
		elseif (i == 2) then
			Talk(1,"","R­îu Giang T«, r­îu L©m An, T©y Hå ®Ö nhÊt töu, Thanh xuyªn Hång l¹c töu, Cöu Ch©u nhÊt d¹ töu...tÊt c¶ ta ®· ®Òu nÕm qua nh­ng vÉn ch­a xøng lµ ®Ö nhÊt töu ")
		elseif (i == 3) then
			Talk(1,"","R­îu Giang T«, r­îu L©m An, T©y Hå ®Ö nhÊt töu, Thanh xuyªn Hång l¹c töu, Cöu Ch©u nhÊt d¹ töu...tÊt c¶ ta ®· ®Òu nÕm qua nh­ng vÉn ch­a xøng lµ ®Ö nhÊt töu ")
		elseif (i == 4) then
			Talk(1,"","R­îu Giang T«, r­îu L©m An, T©y Hå ®Ö nhÊt töu, Thanh xuyªn Hång l¹c töu, Cöu Ch©u nhÊt d¹ töu...tÊt c¶ ta ®· ®Òu nÕm qua nh­ng vÉn ch­a xøng lµ ®Ö nhÊt töu ")
		elseif (i == 5) then
			Talk(1,"","R­îu T«n NghÜa th× ®¾ng, r­îu L¨ng Thanh th× chua, nh­ng h­¬ng th¬m th× kh«ng thÓ chª ®­îc gièng nh­ cã tr¨m lo¹i cá th¬m vËy. BÊt kÓ lµ nam phô l·o Êu chØ cÇn nghe mïi h­¬ng nµy lµ biÕt ngay T«n L¨ng töu. Nh÷ng kÎ bŞ tö téi ®­îc uèng mét vß tr­íc khi bŞ chĞm ®Çu kÓ còng tháa lßng ")
		else
			Talk(1,"","CÇn ph¶i biÕt! C¶nh giíi cña mü töu còng chİ cao nh­ nh©n sinh vËy. ¸i chµ, cã nãi ra ng­¬i còng kh«ng hiÓu! ")
		end
	end
end;
