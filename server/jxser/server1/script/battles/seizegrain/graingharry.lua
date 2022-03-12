IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

-- ÔËÁ¸³µ
-- Param3	Á¸³µÕóÓª
-- Param4	Á¸³µÊ£ÓàÁ¸Ê³°üµÄÊıÁ¿

function main()
	local npcidx = GetLastDiagNpc();
	local ncount = GetNpcParam(npcidx, 4);
	local ngharry_camp = GetNpcParam(npcidx, 3);
	local n_gharry_x = GetNpcParam(npcidx, 1);
	local n_gharry_y = GetNpcParam(npcidx, 2);
	-- ¸ÃÆìÍ¬Ê±±»ÁíÒ»¸öÈËÄÃ×ßÁË£¬Ôò²»ÔÙ²Ù×÷
	if (ncount == 0 ) then
		return
	end;
	
	-- ²»ÊÇÔÚ½øĞĞÖĞ
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("graingharry Event error, because Mission no Start, yet");
		return 
	end
	
	local n_player_camp = GetCurCamp();
	local W,X1,Y1 = GetWorldPos();
	X1 = floor(X1 / 8);
	Y1 = floor(Y1 / 16);
	
	if (ngharry_camp == GetCurCamp()) then	-- Í¬ÊôÕóÓªµÄ ¿ÉÒÔ°áÔË
	-- Íæ¼ÒÒÑ¾­ÔÚÔËÁ¸Ê±£¬²»ÄÜÄÃÁíÒ»´ü
		if (BT_GetData(PL_PARAM3) ~= 0) then
			Msg2Player("B¹n ®ang vËn chuyÓn mét bao l­¬ng, kh«ng thÓ mang thªm bao l­¬ng kh¸c?");
			return
		end
		-- ¼õÉÙÒ»¸öÁ¸³µÖĞÁ¸Ê³°üµÄÊıÁ¿
		ncount = ncount - 1;
		SetNpcParam(npcidx,4,ncount);
		--1341
		--1342
		if (ngharry_camp == 1) then
			ChangeOwnFeature(0,0,1341);	-- ¸Ä±äÍæ¼ÒĞÎÏóÎªÔËÁ¸°üµÄÑù×Ó
		else
			ChangeOwnFeature(0,0,1342);	-- ¸Ä±äÍæ¼ÒĞÎÏóÎªÔËÁ¸°üµÄÑù×Ó
		end
		
		BT_SetData(PL_PARAM3, 1);
		
		Msg2Player("B¹n ®ang v¸c mét bao l­¬ng, h·y mau chãng vËn chuyÓn ®Õn <color=yellow>B¶n doanh<color> phe m×nh.");
		
		if (n_player_camp == 1) then
			Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe Tèng<color=yellow>%s<color=0x00FFFF> t¹i <color=yellow>%d, %d<color=0x00FFFF> ®o¹t ®­îc Bao l­¬ng, ®ang quay vÒ <color=yellow>B¶n doanh",
										GetName(),X1,Y1))
			AddSkillState(460, 1, 0, 1000000 ) --ÑÕÉ«¹â»·£¬·Ö±çµĞÎÒ
		else
			Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t¹i <color=yellow>%d, %d<color=0x9BFF9B> ®o¹t ®­îc Bao l­¬ng, ®ang quay vÒ <color=yellow>B¶n doanh",
											GetName(),X1,Y1))
			AddSkillState(461, 1, 0, 1000000 ) --ÑÕÉ«¹â»·£¬·Ö±çµĞÎÒ
		end
		
		AddSkillState(656,30,0,100000) --½µÍæ¼ÒµÄËÙ¶È
	else									-- ¶ÔÁ¢ÕóÓªµÄ»ğÊ¯ÉÕ»Ù
		local n_flint = CalcItemCount(3, 6, 1, 1763,-1);	-- ±³°üÖĞµÄ»ğÊ¯ÊıÁ¿
		if (n_flint > 0) then
			ConsumeItem(-1,1,6,1,1763,-1);	-- É¾³ıÍæ¼ÒÒ»¸ö»ğÊ¯
			ncount = 0;						-- Ïú»õÁ¸Ê³³µ
			SetNpcParam(npcidx, 4, 0);
			delnpcsafe(npcidx);
			n_new_npcidx = sf_addgharry(ngharry_camp, n_gharry_x, n_gharry_y, 1);
			if (n_new_npcidx > 0) then
				AddNpcSkillState(n_new_npcidx, 705, 1,0, 10080)
				
				if (n_player_camp == 1) then
					Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe Tèng <color=yellow>%s<color=0x00FFFF> t¹i <color=yellow>%d, %d<color=0x00FFFF> ®· thiªu hñy 1 Xe l­¬ng.",
												GetName(),X1,Y1));
				else
					Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim <color=yellow>%s<color=0x9BFF9B> t¹i <color=yellow>%d, %d<color=0x9BFF9B> ®· thiªu hñy 1 Xe l­¬ng.",
												GetName(),X1,Y1));
				end
			end
			return 0;
		else
			Msg2Player("CÇn cã <color=yellow>Háa th¹ch<color> míi cã thÓ thiªu hñy Xe l­¬ng.");
		end
	end
	
	if (ncount <= 0)  then
		delnpcsafe(npcidx);
	end
end;


-- ËÀÍö
function OnDeath( nNpcIndex )
	local State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	
	--Èç¹ûÊÇËÀÓÚÆäËüNpcÔò²»Í³¼ÆÅÅĞĞ
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end;
	
	bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK5, GetCurCamp()))-- ¼Ó»ı·Ö ÉÕ»ÙÏàµ±ÓÚÉ±Ò»¸ö´ó½«
	
	BT_SortLadder();
	BT_BroadSelf();
end;
