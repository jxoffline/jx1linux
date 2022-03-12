Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\longzhu\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	zhongqiu0808_npc_main()
end
function zhongqiu0808_npc_main()
	if zhongqiu0808_IsActDate() ~= 1 then
		return Say("Ho¹t ®éng ®· kÕt thóc.", 0)
	end
	local tbSay = 
	{
		"<dec><npc>Ho¹t ®éng trung thu diÔn ra tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, bao gåm 6 ho¹t ®éng, muèn t×m hiÓu ho¹t ®éng nµo?",
		"Ho¹t ®éng b¸nh trung thu Th­ëng NguyÖt/zhongqiu0808_hecheng_dialog",
		"Ho¹t ®éng Long ch©u - Phông vò/zhongqiu0808_longzhuhecheng_dialog",
		"Ho¹t ®éng ®Ìn kÐo qu©n/#zhongqiu0808_ActContent(1)",
		"Ho¹t ®éng B¾c ®Èu l·o nh©n/#zhongqiu0808_ActContent(4)",
		"Ho¹t ®éng huy ch­¬ng chiÕn c«ng/#zhongqiu0808_ActContent(3)",
		"Ho¹t ®éng ñy th¸c thu thËp/#zhongqiu0808_ActContent(2)",
		"T¹i h¹ chØ tiÖn ®­êng qua ®©y!/OnCancel",
	}
	CreateTaskSay(tbSay);
end



function zhongqiu0808_ActContent(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>Ho¹t ®éng ®Ìn kÐo qu©n diÔn ra tõ 05-09-2008 ®Õn 24 giê ngµy 05-10-2008. Thêi gian cô thÓ: Tõ thø hai ®Õn thø n¨m mçi tuÇn: 19:00 - 19:59, 21:30 - 22:29; Thø s¸u, thø b¶y vµ chñ nhËt mçi tuÇn: 11:00 - 11:59, 19:00 - 19:59, 21:30 - 22:29. Sau khi ho¹t ®éng ®­îc b¾t ®Çu, ®Ìn kÐo qu©n sÏ xuÊt hiÖn trªn tÊt c¶ b¶n ®å, ng­êi ch¬i cã thÓ dïng nÕn ®á (cã thÓ mua t¹i NPC hµng rong) ®Ó th¾p ®Ìn (ph¶i c¨n cø theo tuÇn tù §«ng T©y Nam B¾c ®Ó th¾p ®Ìn) th× míi cã thÓ nhËn ®­îc gi¶i th­ëng.",
			"KÕt thóc ®èi tho¹i/OnCancel"
		}
		
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>Tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, ng­êi ch¬i ñy th¸c trªn m¹ng b»ng c¸c lo¹i B¹ch CÇu Hoµn sÏ nhËn ®­îc hép Tiªn Vò.",
			"KÕt thóc ®èi tho¹i/OnCancel"
		}
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>Trong thêi gian ho¹t ®éng tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, 20 ng­êi ®øng ®Çu chiÕn tr­êng ®o¹t danh hiÖu §¹i t­íng phe Kim hoÆc §¹i t­íng phe Tèng sÏ nhËn ®­îc huy ch­¬ng chiÕn c«ng. Ngoµi ra ng­êi ch¬i cã thÓ ®Õn NPC Qu©n Nhu Quan bªn Tèng hoÆc bªn Kim, sö dông 2000 ®iÓm tÝch lòy Tèng Kim ®Ó ®æi 1 C«ng tr¹ng lÖnh bµi. Sö dông ChiÕn c«ng huy ch­¬ng vµ C«ng tr¹ng lÖnh bµi sÏ nhËn ®­îc ®iÓm kinh nghiÖm vµ vËt phÈm gi¸ trÞ.",
			"KÕt thóc ®èi tho¹i/OnCancel"
		}
		
	elseif nStep == 4 then
		tbSay = 
		{
			"<dec><npc>Trong thêi gian ho¹t ®éng (05-09-2008 ®Õn 24:00 ngµy 05-10-2008), vµo thø s¸u, thø b¶y, chñ nhËt hµng tuÇn sÏ diÔn ra ho¹t ®éng B¾c ®Èu l·o nh©n.",
			"KÕt thóc ®èi tho¹i/OnCancel"
		}
	end
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end