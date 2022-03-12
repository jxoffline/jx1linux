-- Á¸Ê³°ü
IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	local npcidx = GetLastDiagNpc();
	
	-- ¸ÃÆìÍ¬Ê±±»ÁíÒ»¸öÈËÄÃ×ßÁË£¬Ôò²»ÔÙ²Ù×÷
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end;
	
	-- ²»ÊÇÔÚ½øĞĞÖĞ
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("flagobj Event error, because Mission no Start, yet");
		return 
	end
	
	-- Íæ¼ÒÒÑ¾­ÔÚÔËÁ¸Ê±£¬²»ÄÜÄÃÆßÁíÒ»´ü
	if (BT_GetData(PL_PARAM3) ~= 0) then
		Msg2Player("B¹n ®ang vËn chuyÓn mét bao l­¬ng, kh«ng thÓ mang thªm bao l­¬ng kh¸c?");
		return
	end
	
	-- ÎŞÂÛÄÄ·½ÒÅÁôµÄÁ¸Ê³°ü£¬¶¼¿ÉÒÔÔËËÍ¡ª¡ªµ±È»ÊÇÔË»Ø±¾·½´óÓª
	BT_SetData(PL_PARAM3, 1);
	
	Msg2Player("B¹n ®ang v¸c mét bao l­¬ng, h·y mau chãng vËn chuyÓn ®Õn b¶n doanh phe m×nh.");
	if (GetCurCamp() == 1) then
		ChangeOwnFeature(0,0,1341);	-- ¸Ä±äÍæ¼ÒĞÎÏóÎªÔËÁ¸°üµÄÑù×Ó
	else
		ChangeOwnFeature(0,0,1342);	-- ¸Ä±äÍæ¼ÒĞÎÏóÎªÔËÁ¸°üµÄÑù×Ó
	end
	
	local W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe Tèng<color=yellow>%s<color=0x00FFFF> t¹i <color=yellow>%d, %d<color=0x00FFFF> ®o¹t ®­îc Bao l­¬ng, ®ang quay vÒ <color=yellow>B¶n doanh",
										GetName(),X1,Y1))
		AddSkillState(460, 1, 0, 1000000 ) --ÑÕÉ«¹â»·£¬·Ö±çµĞÎÒ
	else
		Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t¹i <color=yellow>%d, %d<color=0x9BFF9B> ®o¹t ®­îc Bao l­¬ng, ®ang quay vÒ <color=yellow>B¶n doanh",
										GetName(),X1,Y1))
		AddSkillState(461, 1, 0, 1000000 ) --ÑÕÉ«¹â»·£¬·Ö±çµĞÎÒ
	end
		
	AddSkillState(656,30,0,100000) --½µÍæ¼ÒµÄËÙ¶È
	
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;
