IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

function main()
npcidx = GetLastDiagNpc();

--¸ÃÆìÍ¬Ê±±»ÁíÒ»¸öÈËÄÃ×ßÁË£¬Ôò²»ÔÙ²Ù×÷
if (GetNpcParam(npcidx, 4) == 0 ) then
	return
end;

if (GetMissionV(MS_STATE) ~= 2) then
	delnpcsafe(npcidx);
	print("flagobj Event error, because Mission no Start, yet");
	return 
end;

--¹Ì¶¨Ä£Ê½Ê±£¬²»ÄÜÄÃµÐ·½µÄÆå
if (GetMissionV(MS_FLAGMODE) == 1) then
	if (GetNpcParam(npcidx, 3) ~= GetCurCamp()) then
		Msg2Player("B¹n chØ cã thÓ di chuyÓn So¸i Kú cña phe m×nh!")
		return
	end
end

	if (BT_GetData(PL_PARAM1) ~= 0 or BT_GetData(PL_PARAM2) ~= 0) then
		Msg2Player("Trong tay cßn cê, kh«ng thÓ ®o¹t thªm cê kh¸c!");
		return
	end

	x = GetNpcParam(npcidx, 1);
	y = GetNpcParam(npcidx, 2);
	
	ChangeOwnFeature(0,0,643);
	
	BT_SetData(PL_PARAM1, x)
	BT_SetData(PL_PARAM2, y)


	Msg2Player("B¹n ®· ®o¹t So¸i Kú, h·y mau chuyÓn ®Õn <color=yellow>"..floor(x/(32*8))..","..floor(y/(32*16)));
	W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF> phe Tèng <color=yellow>"..GetName().."<color=0x00FFFF> t¹i <color=yellow>"..floor(X1/8)..","..floor(Y1/16).."<color=0x00FFFF>®· ®o¹t ®­îc So¸i Kú, hiÖn ®ang chuyÓn ®Õn <color=yellow>"..floor(x/(32*8))..","..floor(y/(32*16)))
		AddSkillState(460, 1, 0, 1000000 ) --ÑÕÉ«¹â»·£¬·Ö±çµÐÎÒ
		AddSkillState(656,30,0,100000) --½µÍæ¼ÒµÄËÙ¶È
		ST_SyncMiniMapObj(x, y);
		sf_setflagplayer(1, PlayerIndex)
	else
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B> phe Kim <color=yellow>"..GetName().."<color=0x9BFF9B> t¹i <color=yellow>"..floor(X1/8)..","..floor(Y1/16).."<color=0x9BFF9B> ®· ®o¹t ®­îc So¸i Kú, hiÖn ®ang chuyÓn ®Õn <color=yellow>"..floor(x/(32*8))..","..floor(y/(32*16)))
		AddSkillState(461, 1, 0, 1000000 ) --ÑÕÉ«¹â»·£¬·Ö±çµÐÎÒ
		AddSkillState(656,30,0,100000) --½µÍæ¼ÒµÄËÙ¶È
		ST_SyncMiniMapObj(x, y);
		sf_setflagplayer(2, PlayerIndex)
	end
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;
