-------------------------------------------------------------------------
-- FileName		:	NewWorldScript_H.lua
-- Author		:	LuoBaohang
-- CreateTime	:	2005-09-02
-- Desc			:  	µØÍ¼ÇÐ»»´¥·¢½Å±¾Í·ÎÄ¼þ--º¯Êý¶¨Òå
-------------------------------------------------------------------------
IncludeLib("PARTNER")
IncludeLib("TIMER")
Include("\\script\\tong\\map\\entrance_trap.lua")
Include("\\script\\nationalwar\\nationalwar.lua")
Include("\\script\\missions\\newpracticemap\\head.lua")

aryFuncStore = {} --º¯Êý¶¨Òå£¬Ã¿¸öº¯Êý¹æ¶¨ÓÐÇÒÖ»ÓÐÒ»¸ö¿ª¹Ø²ÎÊý(½øÈëÎª1£¬ÍË³öÎª0)


function SetPartnerSwitch(bIn)
do return end
	if (bIn == 1) then
		PARTNER_CallOutCurPartner(0)
		PARTNER_SetCallOutSwitch(0)
		Msg2Player("T¾t/ gäi ®ång hµnh")
	else
		PARTNER_SetCallOutSwitch(1)	
		Msg2Player("T¾t/ gäi ®ång hµnh")
	end
end

function CD_ForbidEnemy(bIn)
	if (bIn == 1) then
		SetPKFlag(0)
		ForbidChangePK(1);
		ForbidEnmity(1);
		SetTaskTemp(200,1);
	else
		ForbidChangePK(0);
		SetTaskTemp(200,0);
		ForbidEnmity(0);
	end
end

function forbidCreateTeam(bIn)
	if (bIn == 1) then
		LeaveTeam()
		SetCreateTeam(0)
		--Msg2Player("×é¶Ó¹Ø±Õ£¡")
	else
		SetCreateTeam(1)
		--Msg2Player("×é¶Ó¿ªÆô£¡")
	end
end

function UseTownPSwitch(bIn)
	if (bIn == 1) then
		DisabledUseTownP(1)	--½ûÖ¹Ê¹ÓÃ»Ø³Ç
	else
		DisabledUseTownP(0)	--ÔÊÐíÊ¹ÓÃ»Ø³Ç
	end
end

function setLogoutRevOut(bIn)
	if (bIn == 1) then
		SetLogoutRV(1)
	else
		DisabledUseTownP(0)
	end
end

function setTiShenZhiFu( bIn )
	if (bIn == 1) then
		SetDeathReliveFlag(0)
	else
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		if (nDate <= 20070518) then
			SetDeathReliveFlag(1);
		end;
	end
end;

function noPunish(bIn)
	if (bIn == 1) then
		SetPunish(0)
	else
		SetPunish(1)
	end
end

function forbidUseTownP(bIn)
	if (bIn == 1) then
		DisabledUseTownP(1)
	else
		DisabledUseTownP(0)
	end
end

function setPeaceState(bIn)
	if (bIn == 1) then
		SetFightState(0)
	else
		SetFightState(0)
	end
end

function sjFightState(bIn)
	if (bIn == 1) then
		SetFightState(0)
	end
end


function forbidHeart(bIn)
	if (bIn == 1) then
		DisabledUseHeart(1)
	else
		DisabledUseHeart(0)
	end
end

function restoreCurCamp(bIn)
	if (bIn == 1) then
	else
		SetCurCamp(GetCamp())
	end
end

function forbidStall(bIn)
	if(bIn == 1) then
		DisabledStall(1)
	else
		DisabledStall(0)
	end
end

function TongMap(bIn)
	noPunish(bIn)
	forbidUseTownP(bIn)
	forbidHeart(bIn)
	restoreCurCamp(bIn)
	forbidStall(bIn)
	if (bIn == 1) then
		-- ÉèÁÙÊ±ÖØÉúµãÎª¼À¾Æ´¦
		SetTempRevPos(SubWorldIdx2ID(SubWorld),aRevPos.x * 32,aRevPos.y * 32)
		if (GetProductRegion() ~= "vn") then
			-- ×÷µØÍ¼ÓÐÐ§ÆÚ¼°µØÍ¼½ûÖÆµÈÅÐ¶Ï²Ù×÷
			tongmap_entrance();
		end;
	else
		SetRevPos(GetPlayerRev())
	end
	--µØÍ¼½ûÖÆÈÓ³ö
	if (bIn == 1 and GetMapType(SubWorld) == 1)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				local pos = GetMapEnterPos(SubWorldIdx2MapCopy(SubWorld))
				SetFightState(0)
				SetPos(pos.x, pos.y)
			end
		end
	end
end

--	Ö±½Ó½øÈëÀÎ·¿
function PK10_InPrison(bIn)
	if (bIn == 1) then
		if (GetPK() == 10) then
			SetDeathPunish_PK10(1)
			Msg2Player("<color=green>Kh¾p n¬i ®Òu tung tin, quan phñ ®ang r¸o riÕt truy t×m ng­¬i, nh÷ng ng­êi muèn ®­îc träng th­ëng t×m kiÕm ng­¬i kh¾p n¬i, h·y cÈn thËn chót.<color>");
		else
			SetDeathPunish_PK10(0)
		end;
	else
		SetDeathPunish_PK10(0);
	end;
end;

-- AÐÍÐÂÁ·¼¶µØÍ¼
function NewPractice_A(bIn)
	
	if (bIn == 1) then
		SetFightState(1);
		SetTask(tbNewPracticeMap.TimeLeft_A, GetTask(tbNewPracticeMap.TimeLeft_A)-1);
		TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);	
	else
		SetFightState(0);
	end
end


-- BÐÍÐÂÁ·¼¶µØÍ¼
function NewPractice_B(bIn)

	if (bIn == 1) then
		SetFightState(1);
		SetTask(tbNewPracticeMap.TimeLeft_B, GetTask(tbNewPracticeMap.TimeLeft_B)-1);
		TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);
	else
		SetFightState(0);
	end
end

-- ½øÈë/Àë¿ª¿ÉÒÔÐÞÁ¶¾«Á¦µÄµØÍ¼
--function JingliEntrance(bIn)
--	DynamicExecute("\\script\\global\\jingli.lua", "WorldEntrance", PlayerIndex, bIn)
--end

aryFuncStore["PARTNER_OFF"] = SetPartnerSwitch
aryFuncStore["CD_Forbid_OFF"] = CD_ForbidEnemy
aryFuncStore["CreateTeam_OFF"] = forbidCreateTeam
-- aryFuncStore["USETOWNP_OFF"] = UseTownPSwitch	-- ¹¦ÄÜÍ¬ forbidUseTownP
aryFuncStore["LOGINREVOUT_OFF"] = setLogoutRevOut
aryFuncStore["PUNISH_OFF"] = noPunish
aryFuncStore["TISHENZHIREN"] = setTiShenZhiFu
aryFuncStore["USETOWNP_OFF"] = forbidUseTownP
aryFuncStore["FIGHTSTATE_OFF"] = setPeaceState

aryFuncStore["SJFIGHTSTATE_OFF"] = sjFightState
aryFuncStore["HEART_OFF"] = forbidHeart
aryFuncStore["TONG_MAP"] = TongMap
aryFuncStore["RESTORECURCAMP"] = restoreCurCamp
aryFuncStore["STALL_OFF"] = forbidStall
aryFuncStore["PUNISH_PK10"] = PK10_InPrison
aryFuncStore["NATIONALWAR"] = nationalwar_mapevent
aryFuncStore["NEWPRACTICE_A"] = NewPractice_A
aryFuncStore["NEWPRACTICE_B"] = NewPractice_B
--aryFuncStore["JINGLI"] = JingliEntrance
