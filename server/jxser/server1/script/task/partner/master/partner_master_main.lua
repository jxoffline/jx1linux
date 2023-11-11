
-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本实体处理文件 - 总索引文件
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

-- 同伴系统的头文件
IncludeLib("PARTNER");

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main_01.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_02.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_04.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_05.lua");

-- 与龙五对话的总选项
taskProcess_000 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
	
		local strMain = {
			"<npc>宋金乱战，蒙古崛起，西北蛮荒之地的夏国感受到了前所未有的危机。屡次与南宋暗通款曲的密谋，都被金国劫获，西夏国主终于发觉我大宋王朝已逐渐走向覆亡的边缘。于是他秘遣一品堂武士进入中原，寻找一件失踪已久的东西。具体是什么东西不得而知，不过我们却从这件事上顺藤摸瓜找出了一些线索。不过义军得力干将纷纷在各战场上帮助朝廷抗击金国，目前我实在人手短缺。希望你能帮忙做几件调查。这些任务分别列举了下来。在你完成了相应剧情任务后，今后每天，每位同伴都可以选择两个已完成的剧情任务继续做一次，我会对你进行补偿的，重重的补偿。国家处于危难之中，希望你千万帮我一把！",
			"侍郎之死/#taskProcess_001:doTaskEntity()",
			"控蛇人之秘/#taskProcess_002_01:doTaskEntity()",
			"珠宝商人/#taskProcess_003_Main:doTaskEntity()",
			"异族武士/#taskProcess_004_Main:doTaskEntity()",
			"我都不想接，迟些再来吧/OnTaskExit"
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	
	end,

});

