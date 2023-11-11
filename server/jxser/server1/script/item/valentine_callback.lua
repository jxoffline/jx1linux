function doBlessValentine(szParam)
	local aryParam = split(szParam, " ")
	local targetname = aryParam[1]
	local targetmapid = aryParam[2]
	local rolename = aryParam[3]
	if (SubWorldID2Idx(targetmapid) < 0) then
		return
	end
	local oldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(targetmapid)
	local oldPlayerIndex = PlayerIndex
	pidx = SearchPlayer(targetname)
	if (pidx > 0) then
		PlayerIndex = pidx
		AddSkillState(703, 1, 0, 1080 *30)	--2min
		CastSkill(285, 1)
		if (GetSex() == 0) then	--ÄÐ
			Msg2Player("<#> H¶o h÷u cña b¹n <color=yellow>"..rolename.."<color> tÆng cho b¹n mét miÕng <color=yellow>S« c« la t×nh yªu")
			AddItem(6, 1, 1060, 1, 1, 1)
		else
			Msg2Player("<#> H¶o h÷u cña b¹n <color=yellow>"..rolename.."<color> tÆng cho b¹n mét ®ãa <color=yellow>Hoa Hång t×nh ý ")
			AddItem(6, 1, 1059, 1, 1, 1)
		end
	end
	PlayerIndex = oldPlayerIndex
	SubWorld = oldSubWorld
end

--½«×Ö·û´®²ð·Ö³ÉÊý×éÐÎÊÆ
function split(str, str_sep)
	if (not str_sep) then
		str_sep = ","
	end
	local tb = {}
	local n_seplen = strlen(str_sep)
	local n_start = 1
	local n_at = strfind(str, str_sep, n_start)
	while n_at do
		tb[getn(tb)+1] = strsub(str, n_start, n_at - 1)
		n_start = n_at + n_seplen
		n_at = strfind(str, str_sep, n_start)
	end
	tb[getn(tb)+1] = strsub(str, n_start)
	return tb
end