Include("\\script\\event\\newyear_2009\\lucky_bag\\hongbaohecheng.lua");
Include("\\script\\event\\newyear_2009\\lucky_bag\\wuguohecheng.lua");
Include("\\script\\event\\newyear_2009\\xinnianyanhua\\xinnianyanhua.lua");
Include("\\script\\event\\qingren_jieri\\200902\\event.lua");

function main()
	local arytalk = {"<dec><npc>HiÖn t¹i ®ang ë thêi gian tÕt, ®¹i hiÖp cßn chÇn chõ g× n÷a?"};
	
	if (newyear0901_hongbao_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho¹t ®éng bao l× x× may m¾n/#newyear0901_hongbao_dialogmain()";
	end
	
	if (newyear0901_wuguo_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho¹t ®éng m©m ngò qu¶/#newyear0901_wuguo_dialogmain()";
	end
	
	if (newyear0901_yanhua_IsActDate() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho¹t ®éng ph¸o hoa mõng xu©n/#newyear0901_yanhua_dialogmain()";
	end
	
	if (valentine2009_isCarryon() == 1) then
		arytalk[getn(arytalk)+1]	= "Ho¹t ®éng lÔ t×nh nh©n/#valentine2009_main()";
	end
	
	arytalk[getn(arytalk)+1]	= "B©y giê ta ®ang cã viÖc bËn, h·y ®Õn vµo dÞp kh¸c nhÐ./OnCancel";
	
	CreateTaskSay(arytalk);
end