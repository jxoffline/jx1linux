--zero 20070712 ¡Ó≈∆÷∆‘Ï

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\pay.lua");

function main()
	if(tonumber(GetLocalDate("%Y%m%d"))>=20070728 and tonumber(GetLocalDate("%Y%m%d"))<=20070813) then
		CreateTaskSay({"<dec><npc>Hoan ngh™nh Æ’n vÌi hoπt ÆÈng 'Tri÷u HÂi M∑nh T≠Ìng' di‘n ra tı 28-07-2007 Æ’n 24:00 13-08-2007. Trong thÍi gian hoπt ÆÈng, ng≠Íi ch¨i c p 90 trÎ l™n (bao gÂm c p 90) Æ∑ nπp thŒ c„ th” tham gia ch’ tπo l÷nh bµi. Xem nÈi dung chi ti’t tr™n trang chÒ.",
			"Ta muËn ch’ tπo MÈc Bµi/#lingpaizhizao_do(1)",
			"Ta muËn ch’ tπo ßÂng Bµi/#lingpaizhizao_do(2)",
			"Ta muËn ch’ tπo Ng©n Bµi/#lingpaizhizao_do(3)",
			"Ta muËn ch’ tπo Kim Bµi/#lingpaizhizao_do(4)",
			"Ta muËn ch’ tπo Ng‰c Bµi/#lingpaizhizao_do(5)",
			"C∏ch ch’ tπo l÷nh bµi/lingbaizhizao_content",
			"HÒy b· /OnCancel"});	
	else
		Say("Hoπt ÆÈng 'Tri÷u HÂi M∑nh T≠Ìng' di‘n ra tı 28-07-2007 Æ’n 24:00 13-08-2007. Trong thÍi gian hoπt ÆÈng, ng≠Íi ch¨i c p 90 trÎ l™n (bao gÂm c p 90) Æ∑ nπp thŒ c„ th” tham gia ch’ tπo l÷nh bµi.",0)
	end
	
end


lingpai_id={1477,1478,1479,1480,1481}
lingpai_success_rate={30,25,50,90,100};
lingpai_pay={5000,10000,20000,30000,1000000};
lingpai_name={"MÈc Bµi","ßÂng Bµi","Ng©n Bµi","Kim Bµi","Ng‰c Bµi"};
function lingpaizhizao_do(lingpai_level)
	if( IsCharged() == 0) then --≥‰÷µ
		Say("Chÿ c„ ng≠Íi ch¨i c p 90 trÎ l™n (bao gÂm c p 90) Æ∑ nπp thŒ mÌi c„ th” tham gia ch’ tπo l÷nh bµi.",0);
		return 
	end
	if( GetLevel() <90) then --µ»º∂
		Say("Ng≠¨i h∑y cﬂn nh· læm, ch≠a ÆÒ s¯c Æ” tham gia nhi÷m vÙ nguy hi”m nµy. ßπt Æ’n c p 90 rÂi h∑y Æ’n t◊m ta!",0);
		return 
	end
	
	if( CalcFreeItemCellCount() < 1) then -- ø’º‰
		Say("Hµnh trang Æ∑ Æ«y, h∑y sæp x’p lπi cho ng®n næp.",0);
		return 
	end
	
	if( CalcEquiproomItemCount(6,1,lingpai_id[lingpai_level],-1) < 5) then --≤ƒ¡œ
		Say("Nguy™n li÷u mang theo kh´ng ÆÒ!",0);
		return 
	end
		
	if( Pay(lingpai_pay[lingpai_level]) == 0) then  -- »•µÙ«Æ
			Say("ThÀt Æ∏ng ti’c, ng©n l≠Óng mang theo kh´ng ÆÒ!",0);
		return 
	end
	
	for i=1,4 do ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1);	end --»•µÙ4∏ˆ≤ƒ¡œ
	if(random(1,100)<=lingpai_success_rate[lingpai_level]) then --≥…π¶µƒª∞
		ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1); --»•µÙ“ª∏ˆ≤ƒ¡œ
		AddItem(6,1,lingpai_id[lingpai_level]+1,1,0,0);
		Say(format("ChÛc mıng bπn Æ∑ nhÀn Æ≠Óc 1 %s.",lingpai_name[lingpai_level]),0);
		WriteLog(format("[Tri÷u hÂi m∑nh t≠Ìng]\t%s\tAccount:%s\tName:%s\t Ch’ tπo %s thµnh c´ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			lingpai_name[lingpai_level]));
	else
		Say("ThÀt Æ∏ng ti’c, ch’ tπo th t bπi, hao tÊn nguy™n li÷u vµ ng©n l≠Óng!",0);
	end
end

function lingbaizhizao_content()
	CreateTaskSay({"<dec><npc><enter>ß” ch’ tπo MÈc Bµi c«n c„ 5 V‚ L©m MÀt Th≠ vµ 5000 l≠Óng, n’u ch’ tπo th t bπi sœ tÊn th t 4 V‚ L©m MÀt Th≠ vµ 5000 l≠Óng.<enter><enter>ß” ch’ tπo ßÂng Bµi c«n c„ 5 MÈc Bµi vµ 1 vπn l≠Óng, n’u ch’ tπo th t bπi sœ m t 4 MÈc Bµi vµ 1 vπn l≠Óng.<enter><enter>ß” ch’ tπo Ng©n Bµi c«n c„ 5 ßÂng Bµi vµ 2 vπn l≠Óng, n’u ch’ tπo th t bπi sœ m t 4 ßÂng Bµi vµ 2 vπn l≠Óng.<enter><enter>ß” ch’ tπo Kim Bµi c«n c„ 5 Ng©n Bµi vµ 3 vπn l≠Óng, n’u ch’ tπo th t bπi sœ m t 4 Ng©n Bµi vµ 3 vπn l≠Óng.<enter><enter>ß” ch’ tπo Ng‰c Bµi c«n c„ 5 Kim Bµi vµ 100 vπn l≠Óng. Ch’ tπo Ng‰c Bµi c„ x∏c su t thµnh c´ng lµ 100%.",
		"TrÎ lπi/main",
		"Bi’t rÂi/OnCancel"
		});
end
function OnCancel()
end