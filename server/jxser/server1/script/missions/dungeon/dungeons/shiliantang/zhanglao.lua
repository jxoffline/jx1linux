Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")

function main()	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>Vﬁ Æπi hi÷p thÀt lµ Æa l‘. ß∑ c„ trong ng≠Íi Æ∑ c„ th› luy÷n thi’p chæc hºn ngoµi giang hÂ cÚng lµ mÈt vﬁ anh hÔng hµo ki÷t. MÈt lÛc n˜a th› luy÷n Æ≠Íng sœ mÎ, trong lÛc chÍ ÆÓi Æ” ta gi∂i th›ch cho ng≠¨i luÀt Î trong th› luy÷n Æ≠Íng nµy."
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	
	tbDailog:AddOptEntry("Xin tr≠Îng l∑o chÿ dπy.",readRule);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() ~= 1) then
		tbDailog:AddOptEntry("Ta muËn ÆÊi 1 c¨ hÈi tri÷u tÀp cung ti‘n thÒ",buyChance);
	end

	tbDailog:AddOptEntry("ß’n nhÀn tri÷u tÀp phÔ",getCallItem);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() == 1) then
		tbDailog:AddOptEntry("B· qua b≠Ìc chu»n bﬁ",skipPrepareTime);
	end
	
	tbDailog:AddOptEntry("Xem thµnh t›ch cÒa ÆÓt nµy",queryKillCount);
	tbDailog:AddOptEntry("Xem nhÀn Æ≠Óc bao nhi™u huy ch≠¨ng",queryMedalCount);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() == 1) then
		tbDailog:AddOptEntry("Ta Æ’n nhÀn ph«n th≠Îng",getAward);
	end

	tbDailog:AddOptEntry("Ta muËn rÍi kh·i th› luy÷n Æ≠Íng",leave);
	
	--µØ≥ˆ∂‘ª∞øÚ
	tbDailog:Show()
end

function buyChance()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:BuyChance();
	end
end

function getAward()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:GetAward();
	end
end

function leave()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	if (tbDungeon ~= nil) then
		tbDungeonManager:LeaveDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end

function getCallItem()
	if (CalcEquiproomItemCount(6,1,2315,-1) >= 1) then
		Talk(1,"","Ng≠¨i Æ∑ c„ tri÷u tÀp phÔ rÂi.");
		return
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") == 1) then
		PlayerFunLib:GetItem("return {tbProp={6,1,2315,1,0,0},}",1,"NhÀn [Th› Luy÷n ß≠Íng tri÷u tÀp phÔ]")
	end
end

function skipPrepareTime()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:SkipPrepare();
	end
end

function queryMedalCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("Hi÷n tπi c∏c hπ c„ <color=green>%d<color> huy ch≠¨ng th› luy÷n Æ≠Íng.", tbDungeon:GetMedal()));
	end
end

function queryKillCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("Ng≠¨i Æ∑ Æ∏nh lÔi Æ≠Óc <color=green>%d<color> t™n th›ch kh∏ch", tbDungeon:GetKillCount()));
	end
end

function readRule()
	local szTitle =  "<npc>ßπi hi÷p c„ th” xem tr≠Ìc quang c∂nh cÒa bÊn Æ≠Íng, mÈt lÛc n˜a sœ xu t hi÷n hµng loπt th›ch kh∏ch xu t hi÷n. Vi÷c cÒa ng≠¨i lµ Æi“u binh Æ” phﬂng thÒ. BÊn Æ≠Íng c„ 10 n¨i »n gi u c¨ quan, c∏c hπ chÿ c«n Æ’n g«n n¨i c«n g‰i cung ti‘n thÒ Æ” g‰i s˘ trÓ giÛp, mÁi l«n mÎ 1 c¨ quan c«n 100 Æi”m tinh l˘c vµ 5 huy hi÷u th› luy÷n. Ng≠¨i v…n c„ th” Æi“u phËi Æ’n vﬁ tr› kh∏c Æ” ph∏t huy h’t t∏c dÙng, mÁi l«n Æi“u phËi m t 2 huy ch≠¨ng th› luy÷n. H«u h’t mÁi th›ch kh∏ch Æ“u c„ huy ch≠¨ng th› luy÷n, Æ∏nh bπi c„ c¨ may nhÀn Æ≠Óc. Sau 100 t™n th›ch kh∏ch xu t hi÷n v“ sau, cµng Æ∏nh bπi cµng nhi“u th◊ ph«n th≠Îng cµng h p d…n, l∑o phu cÚng sœ chu»n bﬁ ph«n th≠Îng h p d…n h¨n. <enter>ß∂ bπi 1-49 th›ch kh∏ch nhÀn Æ≠Óc mÈc ch’ b∂o hπp <enter>ß∂ bπi 50-69 th›ch kh∏ch nhÀn Æ≠Óc ÆÂng ch’ b∂o hπp <enter>ß∂ bπi 70-89 th›ch kh∏c nhÀn Æ≠Óc ng©n ch’ b∂o hπp <enter>ß∂ bπi 90-99 th›ch kh∏ch nhÀn Æ≠Óc hoµng kim b∂o hπp <enter>ß∂ bπi 100 th›ch kh∏ch trÎ l™n c„ th” nhÀn Æ≠Óc huy“n thi’t b∂o hπp <enter>Cﬂn v“ b∂o hπp ch≠a nh˜ng ph«n th≠Îng g◊ th◊ xem vÀn may cÒa c∏c hπ Æ„."
	local tbOpt = {}
	tinsert(tbOpt, {"ßa ta tr≠Îng l∑o chÿ dπy."})
	CreateNewSayEx(szTitle, tbOpt);
end


function OnExit()

end;