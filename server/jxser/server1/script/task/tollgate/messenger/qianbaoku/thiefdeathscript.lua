Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua")

function OnDeath( nNpcIndex )
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 5);
end;