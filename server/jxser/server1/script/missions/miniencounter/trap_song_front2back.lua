Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function main(sel)
	local tbTargetPos = 
	{
		[1] = {1633, 3418},
	};

	local nTargetPosNum = getn(tbTargetPos);
	local nRandom = random(1, nTargetPosNum);

	-- ÅĞ¶ÏÕóÓª
	local nMapId = GetWorldPos();
	local tbMap  = EncounterMapManager:FindInMapList(nMapId);

	if tbMap then
		local tbPlayer = tbMap:GetPlayer(GetName());
		if tbPlayer.nCamp == 1 then
			SetFightState(0);		   -- ÉèÖÃÕ½¶·×´Ì¬
			SetPos(tbTargetPos[nRandom][1], tbTargetPos[nRandom][2]);
			SetTmpCamp(1);
			SetCurCamp(1);
		else
			Msg2Player("Phİa tr­íc lµ hËu doanh cña ®Şch, tèt nhÊt kh«ng nªn tiÕn s©u vµo n÷a!");
		end
	end
end

