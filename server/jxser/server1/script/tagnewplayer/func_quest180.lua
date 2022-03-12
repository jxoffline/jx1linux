Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\killmonster.lua");
Include("\\script\\task\\task_addplayerexp.lua");
tbQuest=
{
	tbQuest2=
	{
		{szQuestName = "QuyÕt chiÕn Tèng Kim", nId = 1},
		{szQuestName = "Truy t×m Thñy TÆc", nId = 2},
		{szQuestName = "N©ng cÊp Danh Väng", nId = 3},
		{szQuestName = "Tiªu diÖt §ao Yªu", nId = 4}
	},
	tbQuest3=
	{
		{szQuestName = "Thu gom HuyÒn Tinh", nId = 1},
		{szQuestName = "Thu gom MËt §å", nId = 2},
		{szQuestName = "Thu gom Phóc Duyªn", nId = 3},
		{szQuestName = "Thu gom Khiªu ChiÕn LÖnh", nId = 4}
	}
};
function AcceptFirstQuest()
	SetTask(Task_IsQuest, 1)
	tbAnBangHKL:AcceptTask(1, 21)
end

function FinishFirstQuest()
	if (tbAnBangHKL:CheckTaskComplete() ~= 1) then
		return
	end
	 tbAnBangHKL:CompleteTask()
	 SetTask(Task_IsFinishQuest, 1)
end

function GetSecondQuest()
	SetTask(Task_IsQuest, 2)
	local nTskRandom = random(1, getn(tbQuest.tbQuest2))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest2[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestTongKim()
	elseif (nTskID == 2) then
		QuestThuyTac()
	elseif (nTskID == 3) then
		QuestDanhVong()
	elseif (nTskID == 4) then
		QuestDaoYeu()
	end
end
function QuestTongKim()
	SetTask(Task_lag_TskID, 1)
	local nCurScoreTK = GetTask(747)
	SetTask(Task_SCore,nCurScoreTK)
	Msg2Player("§¹i hiÖp h·y t¨ng ®iÓm tÝch lòy tèng Kim 1000 ®iÓm")
end
function QuestThuyTac()
	SetTask(Task_lag_TskID, 2)
	SetTask(Task_KillNPC, 0)
	Msg2Player("§¹i hiÖp h·y tiªu diÖt Thñy TÆc ®Çu lÜnh")
end
function QuestDanhVong()
	SetTask(Task_lag_TskID, 3)
	SetTask(Task_SCore, GetRepute())
	Msg2Player("§¹i hiÖp h·y t¨ng ®iÓm Danh Väng 50 ®iÓm")
end
function QuestDaoYeu()
	SetTask(Task_lag_TskID, 4)
	SetTask(Task_KillNPC, 0)
	Msg2Player("§¹i hiÖp h·y tiªu diÖt 4 tªn §ao Yªu ë S¬n ThÇn MiÕu")
end

function FinishSecondQuest()
		if (GetTask(Task_lag_TskID) == 1) then --hoan thanh nhiem vu tong kim
			if (GetTask(747) >= GetTask(Task_SCore) + 1000) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô liªn hoµn thø 2, §¹i hiÖp cã thÓ nhËn tiÕp nhiÖm vô liªn hoµn thø 3")
			else
				Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh nhiÖm vô !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 2) then  --hoan thanh nhiem vu thuy tac
			if (GetTask(Task_KillNPC) == 1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô liªn hoµn thø 2, §¹i hiÖp cã thÓ nhËn tiÕp nhiÖm vô liªn hoµn thø 3")
			else
				Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh nhiÖm vô !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 3) then
			if (GetRepute() >= GetTask(Task_SCore)+50) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô liªn hoµn thø 2, §¹i hiÖp cã thÓ nhËn tiÕp nhiÖm vô liªn hoµn thø 3")
			else
				Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh nhiÖm vô !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 4) then
			if (GetTask(Task_KillNPC) >= 4) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh nhiÖm vô liªn hoµn thø 2, §¹i hiÖp cã thÓ nhËn tiÕp nhiÖm vô liªn hoµn thø 3")
			else
				Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh nhiÖm vô !");
				return
			end
		end
		
end

function GetThirdQuest()
	SetTask(Task_IsQuest, 3)
	local nTskRandom = random(1, getn(tbQuest.tbQuest3))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest3[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestHuyenTinh()
	elseif (nTskID == 2) then
		QuestMatDo()
	elseif (nTskID == 3) then
		QuestPhucDuyen()
	elseif (nTskID == 4) then
		QuestKCL()
	end
end

function QuestHuyenTinh()
		SetTask(Task_lag_TskID, 1)
		Msg2Player("§¹i hiÖp h·y giao nép 1 HuyÒn Tinh cÊp 5")
end
function QuestMatDo()
		SetTask(Task_lag_TskID, 2)
		Msg2Player("§¹i hiÖp h·y giao nép 10 MËt §å ThÇn BÝ")
end
function QuestPhucDuyen()
		SetTask(Task_lag_TskID, 3)
		Msg2Player("§¹i hiÖp h·y giao nép 1 Phóc Duyªn Lé(lín)")
end
function QuestKCL()
		SetTask(Task_lag_TskID, 4)
		Msg2Player("§¹i hiÖp h·y giao nép 2 Khiªu ChiÕn LÖnh")
end

function FinishThirdQuest()
		--check cue Exp
		local curexp = GetExp()
		if (curexp < 0) then
			Talk(1, "", "§¹i hiÖp ®ang bÞ ©m ®iÓm kinh nghiÖm, kh«ng thÓ nhËn th­ëng !.");
			return
		end
		GiveItemUI( "NhiÖm vô giao vËt phÈm", "Nh÷ng thø ta cÇn ng­¬i t×m ®­îc ch­a", "yestask", "no" );
end
function yestask(nCount)
		if (GetTask(Task_lag_TskID)==1) then
			if (CheckIQuestItem(nCount,6,1,147,5,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh chuçi nhiÖm vô liªn hoµn cña ngµy h«m nay! C¸c h¹ nhËn  2000000000 ®iÓm kinh nghiÖm")
				--Bonus 2 tû exp cã céng dån
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."hoµn thµnh chuçi nhiÖm vô nhËn nhËn  2000000000 ®iÓm kinh nghiÖm")
			end
		end
		if (GetTask(Task_lag_TskID)==2) then
			if (CheckIQuestItem(nCount,6,1,196,0,10)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh chuçi nhiÖm vô liªn hoµn cña ngµy h«m nay! C¸c h¹ nhËn  2000000000 ®iÓm kinh nghiÖm")
				--Bonus 2 tû exp cã céng dån
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."hoµn thµnh chuçi nhiÖm vô nhËn nhËn  2000000000 ®iÓm kinh nghiÖm")
			end
		end
		if (GetTask(Task_lag_TskID)==3) then
			if (CheckIQuestItem(nCount,6,1,124,0,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh chuçi nhiÖm vô liªn hoµn cña ngµy h«m nay! C¸c h¹ nhËn  2000000000 ®iÓm kinh nghiÖm")
				--Bonus 2 tû exp cã céng dån
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."hoµn thµnh chuçi nhiÖm vô nhËn nhËn  2000000000 ®iÓm kinh nghiÖm")
			end
		end
		if (GetTask(Task_lag_TskID)==4) then
			if (CheckIQuestItem(nCount,6,1,1499,0,2)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Chóc mõng ®¹i hiÖp ®· hoµn thµnh chuçi nhiÖm vô liªn hoµn cña ngµy h«m nay! C¸c h¹ nhËn  2000000000 ®iÓm kinh nghiÖm")
				--Bonus 2 tû exp cã céng dån
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."hoµn thµnh chuçi nhiÖm vô nhËn nhËn  2000000000 ®iÓm kinh nghiÖm")
			end
		end
			
end
function CheckIQuestItem(nCount,nG,nD,nP,nLevel,nItemNeedCount)
		local nItemCount =0
		for i=1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
			if (itemgenre ~= nG or detailtype ~= nD or parttype ~= nP or GetItemLevel(nItemIdx) < nLevel) then	
				Talk(1, "", "§¹i hiÖp xin h·y giao ®óng vËt phÈm ta cÇn !");
				return 0
			end--if
			nItemCount = nItemCount + GetItemStackCount(nItemIdx)
		end --for
		if (nItemCount ~= nItemNeedCount) then
			Talk(1, "", "§¹i hiÖp xin h·y giao ®óng sè l­îng vËt phÈm ta cÇn !");
			return 0
		end
		for i = 1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			RemoveItemByIndex(nItemIdx)
		end
		return 1
end

function ReviewCurQuest()
	local IsQ, _ = GetCurQuest()
	if (IsQ == 1) then
		 tbAnBangHKL:ReviewCurKillMonsterTask()
	elseif (IsQ == 2) then
		ReviewQuest2()
	elseif (IsQ == 3) then
		ReviewQuest3()
	else
	
	end
end

function ReviewQuest2()
	local nTskID = tbQuest.tbQuest2[GetTask(Task_lag_TskID)].nId
	local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow = "§¹i hiÖp h·y t¨ng ®iÓm tÝch lòy tèng Kim 1000 ®iÓm"
		elseif (nTskID == 2) then
			szShow = "§¹i hiÖp h·y tiªu diÖt Thñy TÆc ®Çu lÜnh"
		elseif (nTskID == 3) then
			szShow = "§¹i hiÖp h·y t¨ng ®iÓm Danh Väng 50 ®iÓm"
		elseif (nTskID == 4) then
			szShow = "§¹i hiÖp h·y tiªu diÖt 4 tªn §ao Yªu ë S¬n ThÇn MiÕu"
		end
		Talk(1, "", szShow);
end

function ReviewQuest3()
	local nTskID = tbQuest.tbQuest3[GetTask(Task_lag_TskID)].nId
		local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow ="§¹i hiÖp h·y giao nép 1 HuyÒn Tinh cÊp 5"
		elseif (nTskID == 2) then
			szShow = "§¹i hiÖp h·y giao nép 10 MËt §å ThÇn BÝ"
		elseif (nTskID == 3) then
			szShow = "§¹i hiÖp h·y giao nép 1 Phóc Duyªn Lé(lín)"
		elseif (nTskID == 4) then
			szShow = "§¹i hiÖp h·y giao nép 2 Khiªu ChiÕn LÖnh"
		end
		Talk(1, "", szShow);
end

function no()
end
