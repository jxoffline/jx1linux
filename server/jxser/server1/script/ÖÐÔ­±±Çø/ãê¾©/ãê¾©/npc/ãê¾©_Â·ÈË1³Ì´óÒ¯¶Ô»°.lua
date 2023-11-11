--ÖÐÔ­±±Çø ãê¾©¸® Â·ÈË1³Ì´óÒ¯¶Ô»°
-----------------------------------------------------------------------
function main(sel)

if(GetItemCount(351) >= 1)then
	Say("Ng­êi Kim tÆng cho chóng ta mét sè b¶o bèi, giao cho chóng ta nhiÖm vô ®i t×m tÊm ®Þa ®å 'S¬n hµ x· t¾c' g× ®ã. Kh«ng biÕt lµ nã cã c«ng dông g×?",4,"Ta t×m ®­îc 1 miÕng To¸i phiÕn /gift1","Ta t×m ®­îc 2 miÕng To¸i phiÕn /gift2","Ta t×m ®­îc 1 miÕng To¸i phiÕn /gift3","Ta kh«ng ®æi ®©u /no")
else
	default()
end

end;

-----------------------------------------------------------------------

function default()
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","BiÖn Kinh nµy næi tiÕng lµ nhê cã tßa ThiÕt Th¸p, nh­ng trong ®ã l¹i cã nhiÒu bÝ Èn...")
	elseif (i == 1) then
		Talk(1,"","B©y giê BiÖn Kinh nµy ®· bÞ ng­êi Kim chiÕm råi! Chóng ta sÏ ph¶i sèng nh÷ng th¸ng ngµy cùc khæ!")
	else
		Talk(1,""," Hoµng th­îng chØ biÕt h­ëng phóc mét m×nh ë ph­¬ng Nam, lµm g× biÕt quan t©m ®Õn sù thèng khæ cña b¸ t¸nh! ")
	end
end

-----------------------------------------------------------------------

function gift1()
if(GetItemCount(351) >= 3)then
	DelItem(351)
	DelItem(351)
	DelItem(351)
	for i = 1, 3 do
		x = 238 + random(0,2)
		AddEventItem(x)			-- Ëæ»ú¸ø±¦Ê¯
		AddEventItem(353)			-- ÐÉºì±¦Ê¯
--		AddItem(6, 1, 21, 1, 0, 0, 0)			-- ÐÉºì±¦Ê¯
	end
	Say("TÊm b¶n ®å cña ng­¬i ta ®· lÊy råi, tÆng cho ng­¬i nh÷ng thø nµy, ng­¬i h·y gi÷ lÊy. MÊy n¨m nay kh«ng ®­îc yªn æn l¾m! ",0)
else
	Say("Ng­êi b¹n trÎ kh«ng nªn khinh th­êng ng­êi giµ! Ng­¬i lµm g× cã 3 m¶nh b¶n ®å?",0)
end
end

-----------------------------------------------------------------------

function gift2()
if(GetItemCount(351) >= 2)then
	DelItem(351)
	DelItem(351)
	x = 238 + random(0,2)
	AddEventItem(x)
	AddEventItem(353)			-- ÐÉºì±¦Ê¯
--	AddItem(6, 1, 21, 1, 0, 0, 0)			-- ÐÉºì±¦Ê¯
	Say("TÊm b¶n ®å cña ng­¬i ta ®· lÊy råi, tÆng cho ng­¬i nh÷ng thø nµy, ng­¬i h·y gi÷ lÊy. MÊy n¨m nay kh«ng ®­îc yªn æn l¾m! ",0)
else
	Say("Ng­êi b¹n trÎ kh«ng nªn khinh th­êng ng­êi giµ! Ng­¬i lµm g× cã 3 m¶nh b¶n ®å?",0)
end
end

-----------------------------------------------------------------------

function gift3()
if(GetItemCount(351) >= 1)then
	DelItem(351)
	AddEventItem(353)			-- ÐÉºì±¦Ê¯
--	AddItem(6, 1, 21, 1, 0, 0, 0)			-- ÐÉºì±¦Ê¯
	Say("TÊm b¶n ®å cña ng­¬i ta ®· lÊy råi, tÆng cho ng­¬i nh÷ng thø nµy, ng­¬i h·y gi÷ lÊy. MÊy n¨m nay kh«ng ®­îc yªn æn l¾m! ",0)
else
	Talk(1,"","Ng­êi b¹n trÎ kh«ng nªn khinh th­êng ng­êi giµ! Ng­¬i lµm g× cã 3 m¶nh b¶n ®å?")
end
end

-----------------------------------------------------------------------

function no()
end

-----------------------------------------------------------------------
