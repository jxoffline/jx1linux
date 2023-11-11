
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 任务系统 DEBUG 输出文件
-- Edited by peres
-- 2005/06/27 PM 14:04

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================


-- 任务系统库支持
IncludeLib("TASKSYS");

CDebug = {

	-- 是否开启 DEBUG 模式
	-- 0 为不开启
	-- 1 为开启
	DebugMode = 0,
	
	-- 用于输出的模式
	-- 1 为 print
	-- 2 为 Msg2player
	OutputMode = 1,

	-- 输出到游戏屏幕或者调试背景的信息
	-- strOut：需要输出的信息文本
	-- nMode：1 为用 print 输出，2 为用 Msg2Player 输出，默认为 1。
	MessageOut = function(self, strOut, nMode)
		if nMode==nil then nMode=self.OutputMode; end;
		
		if self.DebugMode==1 then
		
			if nMode==1 then
				print ("Debug:"..strOut);
			else
				Msg2Player("Debug:"..strOut);
			end;
			
		end;
	end,

}


function OnTaskExit()
	
end;
