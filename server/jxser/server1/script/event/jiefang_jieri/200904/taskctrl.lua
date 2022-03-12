jf0904_TSK_version		= 1760	-- 活动版本号
jf0904_TSK_jiuexp		= 1761	-- 酒葫芦和葡萄酒使用后获得的经验
jf0904_TSK_jiuexplt		= 1762	-- 酒葫芦和葡萄酒使用后获得的经验上限

jf0904_TSK_jinnangsj	= 1763;	-- 是否已经使用过锦囊事件

jf0904_TSK_shuizei_GetTask 			= 1764;		-- 是否已经接受了水贼任务
jf0904_TSK_shuizei_FulfilTaskTime 	= 1765; 	-- 上次交水贼任务的时间
jf0904_TSK_hailongzhu_ndate			= 1936;		-- 每天只能用两个海龙珠
jf0904_TSK_hailongzhu_UseTime		= 2625;		-- 每天第几次使用海龙珠

jf0904_TSK_denggao_ndate		= 1937;		-- 每天最多获得500积分，判断是不是当天的任务变量
jf0904_TSK_denggao_curscore		= 1938;		-- 登高活动每天已经获得的积分
jf0904_TSK_denggao_totscore		= 1940;		-- 登高活动一共获得的积分
jf0904_TSK_denggao_totexp		= 1941;		-- 登高活动中一共获得的经验
jf0904_TSK_denggao_nidx			= 1942;		-- 目前兑换到了第几层奖励
jf0904_TSK_denggao_gettoptimes	= 1943;		-- 第几次达到峰值
jf0904_TSK_denggao_getaward		= 1944;		-- 是否已经领奖

jf0904_item_expiredtime	= 20090601
jf0904_jiu_expiredtime	= 20090608

jf0904_act_dateS 	= 20090428; 
jf0904_act_dateE	= 20090601;

function jf0904_InitTaskctrl()	
	if (GetTask(jf0904_TSK_version) ~= 200904) then
		SetTask(jf0904_TSK_version, 200904);
		
		SetTask(jf0904_TSK_jiuexp, 0);
		SetTask(jf0904_TSK_jiuexplt, 15000);	-- 全都除以10w
		
		SetTask(jf0904_TSK_jinnangsj, 0);
		
		SetTask(jf0904_TSK_shuizei_GetTask, 0);
		SetTask(jf0904_TSK_shuizei_FulfilTaskTime, 0);
		
		SetTask(jf0904_TSK_denggao_ndate, 0);
		SetTask(jf0904_TSK_denggao_curscore, 0);
		SetTask(jf0904_TSK_denggao_totscore, 0);
		SetTask(jf0904_TSK_denggao_totexp, 0);
		SetTask(jf0904_TSK_denggao_nidx, 1);
		SetTask(jf0904_TSK_denggao_gettoptimes, 0);
		SetTask(jf0904_TSK_denggao_getaward, 0);
	end
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate~= GetTask(jf0904_TSK_denggao_ndate)) then
		SetTask(jf0904_TSK_denggao_ndate, ndate);
		SetTask(jf0904_TSK_shuizei_FulfilTaskTime, 1);
	end
end

