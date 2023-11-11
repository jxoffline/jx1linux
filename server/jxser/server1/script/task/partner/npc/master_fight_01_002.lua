
-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本实体处理文件 - 侍朗之死 - 贼婆子
-- Edited by peres
-- 2005/09/09 PM 11:19

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

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main_01.lua");

function OnDeath()
	DoTeamProcess(funDeath);
end;


function funDeath()
	if taskProcess_001_02_03:doTaskEntity(1)~=0 then return end;
	if rewindProcess_001_02_03:doTaskEntity(1)~=0 then return end;
end;