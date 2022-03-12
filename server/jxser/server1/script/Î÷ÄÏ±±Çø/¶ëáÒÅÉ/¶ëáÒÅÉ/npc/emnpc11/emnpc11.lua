--description: ¶ëáÒÅÉÃîÒşÏà¹«
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(207) == 1 then
		allbrother_0801_FindNpcTaskDialog(207)
		return 0;
	end
	UTask_em = GetTask(1);
	if (UTask_em == 10*256+20) then					--½Óµ½10¼¶ÈÎÎñ
		if (HaveItem(19) == 1) then
			Talk(1,"","Ta chê tin mõng cña muéi! ")
		else
			Talk(3, "L10_step1", "DiÖu Èn s­ tû ®· cho muéi biÕt chuyÖn cña ®¹i ca, ta sÏ nghÜ c¸ch gióp hµn g­¬ng l¹i. §¹i ca h·y ®­a nöa m¶nh g­¬ng kia ®­a cho ta ®­îc kh«ng? ", "VËy ta tr«ng chê vµo muéi, muéi dù ®Şnh lµm g×?", "Muéi ®Õn t×m Thî rÌn ë Thµnh §« xem cã c¸ch g× kh«ng?")
		end
	elseif (UTask_em == 10*256+60) then 					--Í­¾µÒÑ²¹ºÃ
		Talk(2, "", "§¹i ca! Xem ®i! Muéi ®· söa g­¬ng ®ång xong! ", "Tèt l¾m! H·y ®­a g­¬ng ®ång cho n­¬ng tö cña ta! ")
	elseif (UTask_em == 10*256+70) and (HaveItem(20) == 1) then		--ÈÎÎñ×îºóÒ»²½
		Talk(2, "", "§¹i ca! DiÖu Èn s­ tû nhê muéi mang m¶nh g­¬ng nµy trao cho huynh. Nh¾n nhñ huynh cã b»ng lßng ®îi tû 3 n¨m kh«ng? 3 n¨m sau tû sÏ trë vÒ bªn huynh.", "PhiÒn ng­¬i nh¾n víi n­¬ng tö ta, dï ph¶i ®îi bao l©u ta còng ®îi nµng vÒ!")
		DelItem(20)
		SetTask(1, 10*256+80)
		AddNote("Mang g­¬ng ®ång giao cho t­íng c«ng cña DiÖu Èn vµ chuyÓn nh÷ng t©m huyÕt cña huynh Êy ®Õn DiÖu Èn s­ tû ")
		Msg2Player("Mang g­¬ng ®ång giao cho t­íng c«ng cña DiÖu Èn vµ chuyÓn nh÷ng t©m huyÕt cña huynh Êy ®Õn DiÖu Èn s­ tû ")
	elseif (UTask_em >= 10*256+80) then 					--ÈÎÎñÍê³ÉºóµÄ¶Ô»°
		Talk(1,"","Bao l©u ta còng ®îi nµng vÒ!")
	else
		Talk(1,"","Vî chång ta ®Õn bao giê míi ®­îc gÆp nhau?")
	end
end;

function L10_step1()
	AddEventItem(19)
--	SetTask(1, 14)
	AddNote("T×m ®­îc T­íng c«ng cña DiÖu Èn ë d­íi nói, vµ nhËn ®­îc nöa tÊm g­¬ng ®ång bªn ph¶i. ")
	Msg2Player("T×m ®­îc T­íng c«ng cña DiÖu Èn ë d­íi nói, vµ nhËn ®­îc nöa tÊm g­¬ng ®ång bªn ph¶i. ")
end;
