IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")

KILLBOSSTIEUEXPAWARD = 1000000
KILLBOSSTIEUNEAREXPAWARD = 500000


local tbBossItemDropAward = {

	{{szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nRate=0.5},},
	{{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=0.5},},
 	{{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=1,nRate=10},},	
	{{szName="Tö Thñy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=2},},
	{{szName="Lam Thñy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=2},},
	{{szName="Lôc Thñy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=2},},
	{{szName="Tinh Hång B¶o Th¹ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=2},},
	{{szName="B¸ch Qu¶ Lé",tbProp={6,1,73,1,0,0},nCount=1,nRate=10},},
	{{szName="Phi Phong",tbProp={6,1,15,1,0,0},nCount=1,nRate=20},},
	-- {{szName="Phóc Duyªn (tiÓu)",tbProp={6,1,122,1,0,0},nCount=1,nRate=30},},
	-- {{szName="Phóc Duyªn (trung)",tbProp={6,1,123,1,0,0},nCount=1,nRate=30},},
	-- {{szName="Phóc Duyªn (®¹i)",tbProp={6,1,124,1,0,0},nCount=1,nRate=10},},
	-- {{szName="§¹i lùc hoµn",tbProp={6,0,3,1,0,0},nCount=1,nRate=9},},
	-- {{szName="§¹i lùc hoµn",tbProp={6,0,6,1,0,0},nCount=1,nRate=10},},
	--{{nExp = 1000000, nRate=25},},

}

function OnDeath( nNpcIndex )
	--AddExp(1000000)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbBossItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	--local szNews = format("§¹i hiÖp <color=yellow>%s<color> t¹i <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	--AddGlobalNews(szNews);
	--LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
--==--
local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSTIEUEXPAWARD, 0, format("%s phÇn th­ëng","Kinh nghiÖm ®¶ b¹i BOSS tiÓu "));
			Msg2Player("§¹i hiÖp nhËn ®­îc kinh nghiÖm team giÕt boss: "..KILLBOSSTIEUEXPAWARD)
		end
	else -- Ò»¸öÈË
		szName = GetName();
		PlayerFunLib:AddExp(KILLBOSSTIEUEXPAWARD, 0, format("%s phÇn th­ëng","Kinh nghiÖm ®¶ b¹i BOSS tiÓu "));
		Msg2Player("§¹i hiÖp nhËn ®­îc kinh nghiÖm giÕt boss: "..KILLBOSSTIEUEXPAWARD)
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSTIEUNEAREXPAWARD, 0, format("%s phÇn th­ëng","Kinh nghiÖm ®øng gÇn lóc BOSS tiÓu "));
		Msg2Player("§¹i hiÖp nhËn ®­îc kinh nghiÖm ®øng gÇn boss: "..KILLBOSSTIEUNEAREXPAWARD)
	end
		--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbBossItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	

	local szNews = format("§¹i hiÖp <color=yellow>%s<color> t¹i <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
--==--
end;

