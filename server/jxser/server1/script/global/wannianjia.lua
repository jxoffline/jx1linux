Include("\\script\\event\\pingzi\\200805\\pingzi.lua");	-- Æ´×ÖÓÎÏ·
Include("\\script\\event\\young_hero\\hero.lua");		-- ÉÙÄêÓ¢ĞÛ
Include("\\script\\task\\system\\task_string.lua");
function main()
	wannianjia_main();
end


function wannianjia_main()
	local nDateH = tonumber(GetLocalDate("%Y%m%d%H"));
	local tbSay = 
	{
		"<dec><npc>Vâ L©m TruyÒn Kú ®· b­íc sang tuæi thø 3, chóc mõng quèc th¸i d©n an, nhµ nhµ h¹nh phóc, ng­êi ng­êi Êm no. Ch¼ng hay ®¹i hiÖp cÇn g×?",
	}
	if pingzi0805:IsActTime() then
		tinsert(tbSay, "Ta muèn tiÕn hµnh ghĞp ch÷./#pingzi0805:main()");
	end
	if (nDateH >= hero_nDate_S and nDateH <= hero_nDate_E) then
		tinsert(tbSay, "Ta muèn tham gia ho¹t ®éng Anh Hïng ThiÕu Niªn/#here_main()");
	end
	tinsert(tbSay, "T×m hiÓu c¸ch ®æi phÇn th­ëng/wannianjia_Detailed");
	tinsert(tbSay, "Ta sÏ ghĞ l¹i sau/OnCancel");
	CreateTaskSay(tbSay);
end
--ÁË½â¶Ò»»½±Àø
function wannianjia_Detailed(nStep)
	local tbSay = 
	{
		"<dec><npc>Cã 2 ho¹t ®éng lín, ®¹i hiÖp muèn t×m hiÓu ho¹t ®éng nµo?",
		"T×m hiÓu Ho¹t ®éng ghĞp ch÷/#pingzi0805:Detailed()",
		"T×m hiÓu Ho¹t ®éng Anh Hïng ThiÕu Niªn/#hero_intruduction()",
		"Trë l¹i/wannianjia_main"
	}
	
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end