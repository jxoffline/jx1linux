-- ÌìÁúËÂ³ÕÉ®¶Ô»°½Å±¾

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_chiseng()
	else
		Talk(1,"","MÊy n¨m gÇn ®©y ®Ö tö c¸c n¬i kh¸c ®Õn ngµy mét İt, ph­¬ng tr­îng th× kh«ng lo l¾ng viÖc trong tù, chØ lo tŞnh tu. §Ö tö ai còng hoang mang, hiÖn ®· xuèng nói chiªu mé c¸c ®Ö tö míi. Thİ chñ mét thêi gian sau h·y tíi ®i!");
	end
end
