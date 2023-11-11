function checkbattlerule(totalpoint)
	if (BT_GetData(PL_BATTLEID) == 16) then
		mar_addmissionpoint(totalpoint)
	end
end

function mar_addmissionpoint(totalpoint)
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(19, GetMissionV(19)+totalpoint)
	else
		SetMissionV(20, GetMissionV(20)+totalpoint)
	end
end