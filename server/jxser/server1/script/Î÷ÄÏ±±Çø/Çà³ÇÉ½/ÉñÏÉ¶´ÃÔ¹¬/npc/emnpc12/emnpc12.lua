--description: ¶ëáÒÅÉ¸ßÈË 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	
	if allbrother_0801_CheckIsDialog(1) == 1 then
		allbrother_0801_FindNpcTaskDialog(1)
		return 0;
	end
	
	
	UTask_em = GetTask(1)
	if (UTask_em == 40*256+10) then
		Talk(1,"","Cã chuyÖn g×? H·y ®¸nh b¹i <color=Red>Linh thó<color> cña ta råi h·y nãi.")
		AddNote("T×m ®­îc mét cao nh©n Èn c­, muèn nhËn ®­îc sù gióp ®ì cña «ng ta th× ph¶i ®¸nh b¹i ®­îc Linh thó do «ng ta nu«i ")
	elseif (UTask_em == 40*256+20) then
		Say("Muèn cã Khóc Phæ th× cÇn ph¶i mang <color=red>Phï dung cÇm kª<color> ®Õn ®æi. Bøc tranh ®ã hiÖn ®ang n»m trong tay 1 tiªu côc ë phñ Th¸i B×nh, nÕu cã b¶n lÜnh th× ®Õn ®ã lÊy råi mang vÒ ®©y ®æi ")
		SetTask(1, 40*256+40)
		AddNote("§¸nh b¹i ®­îc linh thó, nhËn nhiÖm vô ®Õn tiªu côc mang bøc tranh Phï dung cÈm kª vÒ ")
		Msg2Player("Cao nh©n yªu cÇu mang bøc tranh Phï dung cÈm kª vÒ ®æi Khóc phæ B¸ch §iÓu TriÒu Phông ")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 1)) then						--µÃµ½Ü½ÈØ½õ¼¦Í¼
		Talk(6, "select", "§©y lµ 'Phï Dung CÈm Kª §å' mµ ng­¬i cÇn.", "§©y qu¶ lµ b¶n gèc cña tiÒn nh©n. Ha ha ha…Ta ngµy ®ªm t×m kiÕm, cuèi cïng míi cã ®­îc!", "HiÖn giê tiªn sinh cã thÓ ®­a khóc phæ 'B¸ch §iÓu TriÒu Phông' cho ta kh«ng?", "C¸i nµy...", "Tiªn sinh lµ cao nh©n tiÒn bèi, nãi ph¶i gi÷ lêi, nÕu kh«ng sÏ bÞ thiªn h¹ chª c­êi.", "Ta kh«ng nãi lµ kh«ng ®­a. Nµy lµ khóc phæ, ng­¬i cÇm lÊy ®i!")
	elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 0)) then
		AddEventItem(22)
		Talk(3,"","Kh«ng thÊy Khóc phæ ­? T¹i ng­¬i kh«ng tù lÊy, kh«ng thÓ tr¸ch ta ®­îc ","TiÒn bèi cao nh©n mµ l¹i l­êng g¹t ®å cña hËu bèi nh­ vËy, nÕu tin nµy mµ lan truyÒn ra ngoµi th× thanh danh ng­êi sÏ. ","Th«i ®­îc råi, ta sî ng­¬i råi, mau cÇm Khóc Phæ råi ®i mau ")
	elseif (UTask_em >= 40*256+40) and (UTask_em < 40*256+80) then
		Talk(1,"","Muèn lÊy khóc phæ µ? Mang <color=Red>'Phï Dung CÈm Kª ®å'<color> tíi ®æi.")
	elseif (UTask_em >= 40*256+80) then
		Talk(1,"","Phï Dung CÈm Kª §å qu¶ thËt tr¸c tuyÖt! Xem c¶ ®êi còng kh«ng ch¸n.")
	else
		Talk(1,"","KÎ nhµn c­ ®õng ®Õn quÊy rÇy ta!")
	end
end;

function select()
	DelItem(21)
	AddEventItem(22)
	SetTask(1, 40*256+80)
	AddNote("Dïng Phï Dung Kª CÈm §µo' ®Õn Cao Nh©n ®æi lÊy b¶n nh¹c 'B¸ch §iÓu TriÒu Phông'. ")
	Msg2Player("NhËn ®­îc b¶n nh¹c 'B¸ch §iÓu TriÒu Phông ")
end; 
