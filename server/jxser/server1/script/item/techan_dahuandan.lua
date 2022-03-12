--////////////////////
--大还丹
--
--////////////////////

VALUE_HUANDAN_CONTRIBUTION = 30
tbHUANDAN_ADDEXP = {
[4] = 1.25,
[5] = 1.3,
[6] = 1.35,
[7] = 1.4,
[8] = 1.45,
[9] = 1.5,
[10] = 1.6,
}
TASKID_TECHAN_HUANDAN_EXP = 1741	--大还丹每次给与经验值
TASKID_TECHAN_HUANDAN_TIME = 1742	--大还丹剩余使用时间
function adddahuandan_main(nUseLevel, nCount)
	if (not nCount) then
		nCount = 1;
	end;
	local nResttime = GetTask(TASKID_TECHAN_HUANDAN_TIME)
	local nExtpre = GetTask(TASKID_TECHAN_HUANDAN_EXP)
	local nExtpreTotal = floor(nExtpre / 5) * nResttime
	nResttime = nResttime + 360 * nCount	--nCount个6小时
	nExtpreTotal = ( (tbHUANDAN_ADDEXP[nUseLevel] - 1) * sl_gethuandan_exp(GetLevel()) ) * 360 + nExtpreTotal
	nExtpre = ceil((nExtpreTotal / nResttime) * 5)
	SetTask(TASKID_TECHAN_HUANDAN_TIME, nResttime)
	SetTask(TASKID_TECHAN_HUANDAN_EXP, nExtpre)
	local nRestH, nRestM = GetMinAndSec(nResttime)
	return nRestH, nRestM;
end;
	
	
	function sl_gethuandan_exp(nLevel)
	local nExp = 0
	if (nLevel == 50) then 	-- 50
		nExp = 700; -- 每分钟获得的经验值
	elseif (nLevel < 100) then 	-- 51~99
		nExp = 700 + floor((nLevel - 50)/5)*100; -- 每分钟获得的经验值
	else -- 100级及100级以上
		nExp = 1700; -- 每分钟获得的经验值[700 + floor((100 - 50)/5)*100]
	end
	nExp = nExp * 12
	return nExp
end

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
	local nRestMin = floor(nSec / 60);
	local nRestSec = mod(nSec,60)
	return nRestMin, nRestSec;
end;