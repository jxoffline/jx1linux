-------------------------------------------------------------------------
-- FileName		:	honor_ladder.lua
-- Author		:   zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   ÅÅÃûnpc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\task\\system\\task_string.lua" )
Include( "\\script\\lib\\say.lua" )



tbHonor_Sys_2009.tbLadderContent = 
{
	strTalk1 = "Ng­¬i nh×n thÊy <color=yellow>%s<color> ®­îc trªn bia ®¸ viÕt nh­ sau <enter> <enter>%s",
	
	strCancel = "Rêi khái/#tbHonor_Sys_2009:ladder_onCancel()",
}

function main()
	local nNpcIdx = GetLastDiagNpc();
	tbHonor_Sys_2009:ladder_main(nNpcIdx)
end

function tbHonor_Sys_2009:ladder_main(nNpcIdx)
	local nLadderIdx = GetNpcParam(nNpcIdx, 1);
	local nIdx = GetNpcParam(nNpcIdx, 2);
	local tbLadder = self.tbHonor_Ladder_List[nLadderIdx];
	
	if (tbLadder == nil) then return end
	
	local tbPlayer  = tbLadder.tbLadder[nIdx];
	
	if (tbPlayer == nil or nIdx > tbLadder.nCount) then return end
	
	local tbTalk = {}
    local tbContentTb =
	{
	    {
			format("Danh x­ng: <color=yellow>%s<color>",tbPlayer.strPlayerName), "", 
			format("M«n ph¸i: <color=yellow>%s<color>",self.tbNPC_Template_List[tbPlayer.nClass].strName),
		},
		{
			format(tbLadder.content, tbPlayer.nValue),"",
			format("XÕp h¹ng: <color=green>%d<color>",nIdx),
		},
	}
	local var_width = {30,1,30}
	local var_align = 1
	
	tbTalk[getn(tbTalk)+1] = format(self.tbLadderContent.strTalk1, tbLadder.strName, maketable(tbContentTb, var_width, var_align));
	tbTalk[getn(tbTalk)+1] = self.tbLadderContent.strCancel;
    
	CreateTaskSay(tbTalk);
end



function tbHonor_Sys_2009:ladder_onCancel()
end
