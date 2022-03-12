--description: ÐÂÊÖ´å_ÖìÉ©
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==0)  then
		Say("Ng­¬i cã thÊy «ng chång quû nhµ ta ch¹y ®i ®©u kh«ng? ¤i! H«m nay còng kh«ng chÞu ë nhµ, võa nãi hai c©u «ng ta ®· ch¹y mÊt, ch¾c l¹i ®i uèng r­îu ®©u ®ã råi. Ng­¬i cã thÓ gióp ta t×m «ng ta vÒ kh«ng?", 2, "§­îc, ta sÏ gióp /yes", "Kh«ng quan t©m ®Õn chuyÖn vî chång ng­êi kh¸c /no")
	elseif (UTask_world46==2)  then
		Talk(1,"","L·o Êy ch¾c l¹i ®i uèng r­îu ®©u ®ã råi!")
	else
		Talk(1,"","L·o b¸ t¸nh chóng t«i, kh«ng cÇn th¨ng quan còng kh«ng cÇn ph¸t tµi, chØ cÇn mét cuéc sèng b×nh an lµ ®ñ. ")
	end
end

function yes()
	Talk(1,"","L·o Êy ch¾c l¹i ®i uèng r­îu ®©u ®ã råi!")
	SetTask(74,2)
	AddNote("NhËn nhiÖm vô: Gióp Chu TÈu t×m chång. ")
	Msg2Player("NhËn nhiÖm vô: Gióp Chu TÈu t×m chång. ")
end

function no()
end
