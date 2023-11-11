-- Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 24) then
Talk(3,"L20_hs","Ng­êi ch¬i: S­ huynh, cã thÓ thØnh gi¸o huynh vµi chiªu kh«ng?","§Ö tö luyÖn kiÕm Hoa S¬n: §­¬ng nhiªn lµ ®­îc, Ng­¬i ®Õn DiÔn Vâ §­êng t×m ta, c¸c s­ huynh kh¸c còng ë ®ã, ng­¬i cã thÓ ®Êu víi 1 ng­êi bÊt kú.")
elseif (GetTask(169) > 24) and (GetTask(169) < 26)then
Talk(2,"","Ng­êi ch¬i: S­ huynh, cã thÓ thØnh gi¸o huynh vµi chiªu kh«ng?","§Ö tö luyÖn kiÕm Hoa S¬n: §­¬ng nhiªn råi, ta ë DiÔn Vâ tr­êng ®¬i ng­¬i.")
elseif (HaveMagic(1350) < 0) and HaveMagic(1347) >= 0 then
Talk(1,"","§Ö tö luyÖn kiÕm Hoa S¬n: VŞ s­ ®Ö nµy cã muèn ®Êu víi ta vµi chiªu?")
elseif (HaveMagic(1375) >= 0) then
Talk(1,"","Ng­êi ch¬i: S­ huynh khiªm nh­êng råi")
else
Talk(1,"","§Ö tö luyÖn kiÕm Hoa S¬n: kiÕm ph¸p ph¸i Hoa S¬n ta tinh diÖu v« phØ, kh¾p n¬i ®¹t tíi c¶nh giíi 'Chİnh hîp k× th¾ng, kiÕm tung cÇu th¾ng'")

end
end; 


function L20_hs()	
	SetFightState(1) 
	SetTask(169,25)
AddNote("§Ö tö luyÖn kiÕm muèn ng­¬i §Õn chæ DiÔn Vâ §­êng thi ®Êu víi h¾n.") 
Msg2Player("§Ö tö luyÖn kiÕm muèn ng­¬i §Õn chæ DiÔn Vâ §­êng thi ®Êu víi h¾n.") 
end; 



