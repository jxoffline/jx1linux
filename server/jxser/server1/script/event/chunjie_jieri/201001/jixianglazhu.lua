Include("\\script\\global\\judgeoffline_limit.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= 20100329) then
		Msg2Player("VËt phÈm nµy ®· qu¸ h¹n.");
		return 0;
	end
	
	if (offlineCheckPermitRegion() ~= 1) then
		Msg2Player("Kh«ng ®­îc sö dông vËt phÈm nµy t¹i ®©y");
		return 1;
	end
	
	AddSkillState(892, 1, 1, 64800);
	
  local nMapId, nPosX16, nPosY16 = GetWorldPos();
  local SId = SubWorldID2Idx(nMapId);
  local nNpcIndex;
  if (SId >= 0) then
	  if (random(1,100) <= 50) then
	  	nNpcIndex = AddNpc(1333, 1, SId, nPosX16 * 32, nPosY16 * 32, 1, "C©y §µo");
	  	if nNpcIndex > 0 then
	  		SetNpcScript(nNpcIndex,"\\script\\event\\chunjie_jieri\\201001\\taoshu.lua");
	  		SetNpcTimer(nNpcIndex, 24*60*60*18);
	  	end
	  else
	  	nNpcIndex = AddNpc(1334, 1, SId, nPosX16 * 32, nPosY16 * 32, 1, "C©y Mai");
	  	if nNpcIndex > 0 then
	  		SetNpcScript(nNpcIndex,"\\script\\event\\chunjie_jieri\\201001\\taoshu.lua");
	  		SetNpcTimer(nNpcIndex, 24*60*60*18);
	  	end
	  end
	end
	return 0;
end