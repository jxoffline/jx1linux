Include("\\script\\maps\\newworldscript_default.lua")
Include("\\script\\event\\birthday_jieri\\200905\\class.lua")
function OnNewWorld(szParam)
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
--	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	OnLeaveWorldDefault(szParam)
end
