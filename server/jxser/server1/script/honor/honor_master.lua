-------------------------------------------------------------------------
-- FileName		:	honor_master.lua
-- Author		:	zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   ÅÅÃûnpc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\task\\system\\task_string.lua" )
Include("\\script\\lib\\awardtemplet.lua")


tbHonor_Sys_2009.nHonor_QuestTime_Task = 2599
tbHonor_Sys_2009.nHonor_QuestChance_Task = 2600 -- 0 Ã»ÓÐ´ðÌâ»ú»áÁË, 1 ÓÐÒ»´Î´ðÌâ»ú»á, 2 ÓÐÁ½´Î´ðÌâ»ú»áÁ½, 3 Ã»½ÓÈÎÎñ, 4´ð¶ÔÎÊÌâ¿ÉÒÔÁì½±ÁË 

tbHonor_Sys_2009.tbMasterContent = 
{
	strTalk1 = "<dec><npc>Ta lµ ®­êng chñ ë ®©y, n¬i ®©y ®Æt nh÷ng bøc ®iªu kh¾c cña thËp ®¹i cao thñ ®­¬ng ®¹i. Ng­¬i cã thÓ tïy ý tham quan nh­ng kh«ng ®­îc lµm h­ háng bÊt cø thø g× trong ®ã. Ngoµi ra t¹i ®©y cã 1 nhiÖm vô nhá, ng­¬i cã muèn tham gia kh«ng?",
	strTalk2 = "<dec><npc>N¬i ®©y ®­îc gäi lµ Danh Nh©n §­êng vµ còng lµ n¬i vinh danh c¸c ®¹i cao thñ trong vâ l©m, chØ cÇn ®­îc thÕ gian c«ng nhËn lµ cao thñ th× ë n¬i ®©y sÏ cã mét bøc t­îng mµ c¸c nh©n sü kh¸c ph¶i ao ­íc.",
	strTalk3 = "<dec><npc>NhiÖm vô nµy rÊt ®¬n gi¶n, ng­¬i ®i quan s¸t nh÷ng bøc t­îng kia lµ ai råi quay trë vÒ ®©y t×m ta, ta sÏ hái mét sè c©u. Tr¶ lêi ®óng th× phÇn th­ëng sÏ thuéc vÒ ng­¬i!",
	strTalk4 = "<dec><npc>Ng­¬i ®i nhanh thÕ? §· chuÈn bÞ xong ch­a?",
	strTalk5 = "<dec><npc>H«m nay ng­¬i cã <color=green>%d<color> c¬ héi tr¶ lêi c©u hái <enter>Trong b¶ng xÕp h¹ng giang hå <color=yellow>%s<color> ng­êi thø<color=yellow>%d<color> lµ ai?",
	strTalk6 = "<dec><npc>H«m nay ®· tr¶ lêi c©u hái nµy råi, xin ®îi ngµy mai h·y tiÕp tôc.",
	strTalk7 = "<dec><npc>Chóc mõng c©u tr¶ lêi ®óng!",
	strTalk8 = "<dec><npc>ThËt ®¸ng tiÕc! C©u tr¶ lêi kh«ng chÝnh x¸c, ngµy mai h·y ®Õn l¹i nhÐ!",
	strTalk9 = "<dec><npc>Chóc mõng ®¹i hiÖp ®· ®o¸n ®óng c©u hái! Nh­ng hµnh trang kh«ng ®ñ chç, xin mêi ®Ó thõa  <color=green>3<color> « trèng trong hµnh trang råi ®Õn nhËn l¹i nhÐ!",
	strSelect1 = "Xin hái ®©y lµ n¬i nµo?/#tbHonor_Sys_2009:master_introduce()",
	strSelect2 = "Ta muèn nhËn nhiÖm vô/#tbHonor_Sys_2009:master_quest()",
	strSelect3 = "C©u hái thËt ®¬n gi¶n, ta ®i xong vÒ ngay./#tbHonor_Sys_2009:accept_quest()",
	strSelect4 = "§· chuÈn bÞ xong/#tbHonor_Sys_2009:doing_quest()",
	strReturn = "Ta cßn mét sè vÊn ®Ò cÇn hái/#tbHonor_Sys_2009:master_main()",
	strCancel1 = "KÕt thóc ®èi tho¹i/#tbHonor_Sys_2009:master_onCancel()",
	strCancel2 = "B©y giê ta cã chót viÖc bËn, sÏ quay l¹i sau./#tbHonor_Sys_2009:master_onCancel()",
	strCancel3 = "Ta cßn mét sè viÖc kh¸c, sÏ quay l¹i sau./#tbHonor_Sys_2009:master_onCancel()",
	strCancel4 = "Ta vÉn ch­a chuÈn bÞ xong./#tbHonor_Sys_2009:master_onCancel()",
}

tbHonor_Sys_2009.tb_reward = 
{
    {
        {szName = "Tiªn Th¶o Lé ", tbProp={6, 1, 71, 1, 0, 0}, nCount = 3, nBindState = -2}
    }
}
	

function main()
	tbHonor_Sys_2009:master_main()
end

function tbHonor_Sys_2009:master_main()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_introduce()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strReturn;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	local tbTalk = {};
	
	if (nQuestChance == 3) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel2;
	elseif (nQuestChance == 1 or nQuestChance == 2) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel3;
	elseif (nQuestChance == 4) then
		self:give_reward();
		return
	else
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk6;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	end
	
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:accept_quest()
	self:reset_task();
	SetTask(self.nHonor_QuestChance_Task, 2);
end

function tbHonor_Sys_2009:doing_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
        local tbTalk = {};
		local tbLadder;
		local nLimit = 100;
	
		repeat
		    local nPos = random(1,getn(self.tbHonor_Ladder_List));
		    tbLadder = self.tbHonor_Ladder_List[nPos];
		    nLimit = nLimit - 1;
		until tbLadder.nCount ~= 0 or nLimit <= 0
		
		local nTotal = tbLadder.nCount;

		if (nTotal == 0) then
		    return
		end
		
		local nTotalSelection = min(nTotal, 4);

		local nRightIdx = random(1, nTotalSelection);

		local i = 1;
		local k = 1;
		local tbSelect = {};
		while i <= nTotalSelection do
		    local nPos = random(1, nTotal);
		    local bNewPos = 1;

	        for k = 1, nTotalSelection do
	            if(nPos == tbSelect[k])then
	                bNewPos = 0;
	            end
	        end
	        if bNewPos == 1 then
	            tbSelect[i] = nPos;
	            if (i == nRightIdx)then
	                tbTalk[1] = format(self.tbMasterContent.strTalk5, nQuestChance, tbLadder.strName, nPos);
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:right_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            else
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:wrong_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            end
	            i = i + 1;
	        end
		end
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel4;
        CreateTaskSay(tbTalk);
	end
	
end

function tbHonor_Sys_2009:right_answer()
	self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
		SetTask(self.nHonor_QuestChance_Task, 4);
		local tbTalk = {};
		if (CalcFreeItemCellCount() >= 3) then
		    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk7;
		    self:give_reward();
        else
            tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
		end

	    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
        CreateTaskSay(tbTalk);
	end
end

function tbHonor_Sys_2009:wrong_answer()
    self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
    
    if (nQuestChance == 2) then
        SetTask(self.nHonor_QuestChance_Task, 1);
        self:doing_quest()
        return
    end
    
    local tbTalk = {};
	SetTask(self.nHonor_QuestChance_Task, 0);
    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk8;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
    CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:give_reward()
    self:reset_task();

	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);

	if (nQuestChance == 4) then
	    if (CalcFreeItemCellCount() < 3) then
	        local tbTalk = {};
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
            CreateTaskSay(tbTalk);
        else
            tbAwardTemplet:GiveAwardByList(self.tb_reward, "Honor System Answer Reward");
	        SetTask(self.nHonor_QuestChance_Task, 0);
	    end
	end
end

function tbHonor_Sys_2009:reset_task()
    local nQuestTime = GetTask(self.nHonor_QuestTime_Task);
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	local nCurTime = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nQuestTime ~= nCurTime) then
	    nQuestTime = nCurTime;
	    nQuestChance = 3; -- Ã»½ÓÈÎÎñ×´Ì¬
	    SetTask(self.nHonor_QuestTime_Task, nQuestTime);
	    SetTask(self.nHonor_QuestChance_Task, nQuestChance);
	end
end

function tbHonor_Sys_2009:master_onCancel()

end