--nhan diem lanh dao, by: ThanhLD 20130612
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\event\\bingo_machine\\bingo_machine_gs.lua")

tbDiemLanhDao = tbDiemLanhDao or {}

tbTSK_LIMIT = {nTaskID = 3000,nStartBit = 24,nBitCount = 1,nMaxValue = 1}-- nhan 1 lan diem thong soai

function tbDiemLanhDao:AddLeadPoint()
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbTSK_LIMIT)
	if (nCurTskVal ==1) then
		Talk (1,"","MÁi nh©n vÀt chÿ nhÀn Æ≠Óc 1 l«n duy nh t")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(tbTSK_LIMIT, 1)
	AddLeadExp(10011100)
	Msg2Player("ChÛc mıng bπn nhÀn Æ≠Óc kinh nghi÷m l∑nh Æπo")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."NhanDiemLanhDao"..GetAccount().."\t"..GetName().."\t".."NhanThanhCongDiemLanhDaoi")
end

--EventSys:GetType("AddNpcOption"):Reg("Chi’n T©m T´n Gi∂","N©ng c p tµi l∑nh Æπo", tbDiemLanhDao.AddLeadPoint, {tbDiemLanhDao})

