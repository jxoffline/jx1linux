Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\EventThangLong1000\\head.lua")

function main()
	local n_size = GetTeamSize();
	local strLeaderName = ""
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>H·y tæ ®éi víi thµnh viªn råi míi më R­¬ng !", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	end
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>ChØ cã ®éi tr­ëng míi cã thÓ më R­¬ng.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	else
		strLeaderName = GetName()
	end
	if (GetTask(Task_Allow_OpenBox) ~= 1) then
		Talk(1,"","CÇn ph¶i tiªu diÖt <color=yellow>TrÊn Long Hé B¶o <color>  th× míi cã thÓ më ®­îc R­¬ng !")
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox,3,"Mçi ngµy chØ cã thÓ më 3 R­¬ng Cæ VËt mµ th«i !","<") ~= 1) then
			return
	end
	PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox,1)
	
	local oldPlayer = PlayerIndex;
	for i = 1, n_size do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		SetTask(Task_Allow_OpenBox, 0)
		Talk(1,"","§éi Tr­ëng <color=yellow>" ..strLeaderName.. "<color> võa míi më R­¬ng Cæ VËt thµnh c«ng !")
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_GetBonusByKillBoss,21,"Mçi ngµy ng­êi ch¬i cã thÓ nhËn ®iÓm kinh nghiÖm chung víi tæ ®éi tèi ®a  21 lÇn !","<") ~= 1) then
			Msg2Player("H«m nay ®¹i hiÖp ®· nhËn ®iÓm kinh nghiÖm chung víi tæ ®éi ®ñ 21 lÇn")
		else
			PlayerFunLib:AddTaskDaily(Task_Daily_GetBonusByKillBoss,1)
			GetBonusOpenBox(IsCaptain())
		end
	end;
	PlayerIndex = oldPlayer;
end

function GetBonusOpenBox(nValue)
	
	if (nValue ~= 0) then--la doi truong
		local nVar = random(1, 3)
		if (nVar ==1) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30045, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		if (nVar ==2) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30046, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		if (nVar ==3) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30047, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		AddOwnExp(4000000)
		Msg2Player("Ban nhËn ®­îc 4000000 ®iÓm kinh nghiÖm")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."Më R­¬ng nhËn ®­îc 4000000 ®iÓm EXP ")
	else --la thanh vien
			local nVar2 = random(1, 3)
			if (nVar2 ==1) then
					local nItemIndex = AddStackItem(20, 6, 1, 30045, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
			if (nVar2 ==2) then
					local nItemIndex = AddStackItem(20, 6, 1, 30046, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
			if (nVar2 ==3) then
					local nItemIndex = AddStackItem(20, 6, 1, 30047, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
	AddOwnExp(1000000)
	Msg2Player("Ban nhËn ®­îc 1000000 ®iÓm kinh nghiÖm")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."Më R­¬ng nhËn ®­îc 1000000 ®iÓm EXP ")
	end
end

function OnCancel()
end