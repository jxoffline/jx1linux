function main()
--Ôö¼ÓÒ»¿éËéÊ¯

AddEventItem(351);
Msg2Player("Chóc mõng B¹n! B¹n lÊy ®­îc mét miÕng ®Şa ®å s¬n hµ x· t¾c ");
Name = GetName();
str = format("Chóc mõng! %s nhËn ®­îc mét m¶nh b¶n ®å S¬n Hµ X· T¾c!", Name);
AddGlobalNews(str);
WriteLog(date("%m%d%H%M")..str);
DelObject();
end;