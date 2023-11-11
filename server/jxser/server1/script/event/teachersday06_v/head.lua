--Ô½ÄÏ½ÌÊ¦½Ú»î¶¯Í·ÎÄ¼ş

if (not __H_V_TEACHER__) then
	__H_V_TEACHER__ = 1;
Include([[\script\lib\gb_taskfuncs.lua]]);

tab_material = {
{	"“NhÊt”"	,	1289	,	25	}	,
{	"“Tù”"	,	1290	,	25	}	,
{	"“Vi”"	,	1291	,	25	}	,
{	"“S­”"	,	1292	,	25	}	,
}

VT06_EXPLIMIT = 50000000;
TK_EXPLIMIT = 1780;
VT06_DATEBEGIN = 20061118;
VT06_DATEEND = 50000000;
	
--Ôö¼ÓÒ»×ÖÎªÊ¦¿¨
function vt06_addzi()
	if (vt06_item_isactive() == 0) then
		return 0;
	end;
	
--	if (GetLevel() >= 80) then --80¼¶ÒÔÏÂÍæ¼Ò²ÅÄÜ»ñµÃ
--		return 0;
--	end;
	
	local nSeed = random(1, 100);
	local nSum = 0;
	for i = 1, getn(tab_material) do
		nSum = nSum + tab_material[i][3];
		if (nSeed <= nSum) then
			AddItem(6, 1, tab_material[i][2], 1, 0, 0, 0);
			Msg2Player("B¹n nhËn ®­îc <color=yellow>"..tab_material[i][1]..". <color>");
			return 0;
		end;
	end;
	AddItem(6, 1, tab_material[1][2], 1, 0, 0, 0);
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..tab_material[1][1]..". <color>");
end;

--»î¶¯Ê±¼äÅĞ¶Ï(ËùÓĞÕÆÃÅÈË)
function vt06_isactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate > 20061231 or nDate < VT06_DATEBEGIN or gb_GetTask("teacherday2006_all", 1) ~= 0) then
		return 0;
	end;
	return 1;
end;

--»î¶¯Ê±¼äÅĞ¶Ï£¨¸ø×Ö£©
function vt06_item_isactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate > 20061125 or nDate < VT06_DATEBEGIN or gb_GetTask("teacherday2006_all", 1) ~= 0) then
		return 0;
	end;
	return 1;
end;

--»î¶¯Ê±¼äÅĞ¶Ï£¨¸øÊ¦¸¸ËÍÀñ£©
function vt06_shifu_isactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate > 20061231 or nDate < VT06_DATEBEGIN or gb_GetTask("teacherday2006_all", 1) ~= 0) then
		Say("Ho¹t ®éng ®· kÕt thóc.", 0);
		return 0;
	end;
	return 1;
end;

--¸øÒ»¸ö×é¶¼·¢½±
function vt06_team_addzi()
	local nOld = PlayerIndex;
	local Uworld1082;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		Uworld1082 = GetTask(1082);
		if ( Uworld1082 >= 1 and Uworld1082 <= 120 ) then
			vt06_addzi();
		end;
	end;
	PlayerIndex = nOld;
end;

function no()

end;

end;--__H_V_TEACHER__