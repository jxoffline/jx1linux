--×ßÂíµÆnpc

--Ã¿ÂÖ°´Ë³ÐòµãÍê4¸öµÆµÄÍæ¼Ò¿ÉÒÔ»ñµÃ½±Àø
--+Ç°10ÃûµãÍêµÆµÄÍæ¼Ò»ñµÃ10.000.000 EXP
--+ 11Ãû¼°11ÃûÒÔºóµÄÍæ¼Ò»ñµÃ2.000.000 EXP
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	local tbFnagxiang = 
	{
		[1] = "§Ìn kÐo qu©n §«ng",
		[2] = "§Ìn kÐo qu©n T©y",
		[3] = "§Ìn kÐo qu©n Nam",
		[4] = "§Ìn kÐo qu©n B¾c",
	}
	local nNpcIndex = GetLastDiagNpc();
	local nCurNpcType = GetNpcParam(nNpcIndex, 1)
	local nTaskStep = GetNpcParam(nNpcIndex, 3)
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("ChØ cã ng­êi ch¬i cÊp 50 trë lªn ®· n¹p thÎ míi cã thÓ tham gia ho¹t ®éng.", 0)
		return 
	end
	local tbItem = {szName="NÕn ®á", tbProp={6, 1, 1820, 1, 0, 0},nCount = 1}
	
	if (GetNpcParam(nNpcIndex, 4) == 1 ) then
		return
	end;
	
	SetNpcParam(nNpcIndex, 4, 1);
	
	local nTaskState = GetTask(zhongqiu0808_TSK_TaskState)
	
	if (nCurNpcType == 1 or nTaskStep - nTaskState == 1) and ((nTaskStep - nTaskState) < -4 or (nTaskStep - nTaskState) > 0) then
		if ConsumeEquiproomItem(tbItem.nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4]) ~= 1 then
			
			Say("CÇn 1 nÕn ®á ®Ó th¾p lång ®Ìn.", 0)
		else
			SetTask(zhongqiu0808_TSK_TaskState, nTaskStep)
			Msg2Player(format("Th¾p ®­îc %s", tbFnagxiang[nCurNpcType]))
			
			if nCurNpcType == 4 then
				local nRank = GetNpcParam(nNpcIndex, 2)
				nRank = nRank + 1
				Msg2Player(format("Xin chóc mõng, ®¹i hiÖp lµ ng­êi thø %d ®· th¾p s¸ng tÊt c¶ lång ®Ìn.", nRank))
				if nRank <= 10 then
					tbAwardTemplet:GiveAwardByList({nExp = 10000000}, "Ho¹t ®éng ®Ìn kÐo qu©n." )
				else
					tbAwardTemplet:GiveAwardByList({nExp = 2000000}, "Ho¹t ®éng ®Ìn kÐo qu©n." )
				end
				SetNpcParam(nNpcIndex, 2, nRank)
			end
		end
		
		
		
		
	elseif (nTaskStep - nTaskState) >= -4 and (nTaskStep - nTaskState) <= 0  then
		Msg2Player("§Ìn kÐo qu©n nµy ®· ®­îc th¾p s¸ng råi.")
	elseif tbFnagxiang[nCurNpcType-1] then
		Msg2Player(format("Tr­íc tiªn cÇn ph¶i th¾p s¸ng %s", tbFnagxiang[nCurNpcType-1]))
	end
	
	
	SetNpcParam(nNpcIndex, 4, 0);
end

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	DelNpc(nNpcIdx)
end;