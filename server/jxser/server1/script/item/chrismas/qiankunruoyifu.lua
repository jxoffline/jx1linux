Include([[\script\item\chrismas\chrismasitem.lua]]);
Include([[\script\lib\coordinate.lua]]);

tabidx = 0;
function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	local i;
	local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
	if (TAB_ACTION[tabidx][5][1] == 1) then
		nGroupId = getgroupid(nGroupId, TAB_ACTION[tabidx][5][2]);
	end;
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	
	local szName;
	local idx = 0;
	local pidx;
	local j = 1;
	for i = 1, TAB_ACTION[tabidx][4] + 5 do
		idx, pidx = GetNextPlayer(TAB_ACTION[tabidx][2], idx, nGroupId);
		if (pidx > 0 and pidx ~= OldPlayer) then	--Ñ¡Ôñ³ýÍæ¼ÒÍâµÄËùÓÐ¶ÔÊÖ£»
			PlayerIndex = pidx;
			szName = GetName();
			tabPlayer[j] = make_option("useqk");
			j = j + 1;
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	PlayerIndex = OldPlayer;
	tabPlayer[ getn(tabPlayer) + 1 ] = "Hñy bá /giveback_yu"
	Say("B¹n muèn sö dông dông cô <color=0xB5FDD7>Cµn Kh«n Na Di Phï<color> víi ®èi thñ nµo?", getn(tabPlayer), tabPlayer);
end;

function useqk(szName)
	local pidx = check_pl(szName, TAB_ACTION[tabidx][2])
	if (not pidx) then
		giveback_yu()
		return
	end
	
	local OldName = GetName()
	local OldPlayer = PlayerIndex;
	PlayerIndex = pidx;
	
	local nBeginMapID = GetMissionV(TAB_ACTION[tabidx][6]);
	local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, TAB_ACTION[tabidx][9]) + 1;
	local PosX, PosY = getadatatow(TAB_ACTION[tabidx][8], 8 + 8 * nMapId, 15 + 8 * nMapId);
	PlayerIndex = pidx;
	SetPos(floor(PosX / 32), floor(PosY / 32));
	
	Msg2Player("<#><color=0xB5FDD7>"..OldName.."<color> sö dông 1 <color=0xB5FDD7>Cµn Kh«n Na Di Phï<color> víi b¹n, ®¶o lén vÞ trÝ cña b¹n.");
	PlayerIndex = OldPlayer;
	Msg2Player("<#> B¹n<color=0xB5FDD7>"..szName.."<color>sö dông 1 <color=0xB5FDD7>Cµn Kh«n Na Di Phï<color> cho ®èi thñ, ®¶o lén vÞ trÝ cña b¹n.");
end;

function giveback_yu()
	AddItem(6,1,985,1,0,0,0)
end
