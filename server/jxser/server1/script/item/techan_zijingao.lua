--//////////////////
--紫金镐
--每次购买8小时(8*60)，时间记到TaskID1739
--当角色在桃花岛时，有程序给与挖出的物品，并扣除时间，同普通矿镐
VALUE_ZIJIGAO_CONTRIBUTION = 200	--紫金镐需要的个人贡献度
TASKID_TECHAN_ZIJINGAO = 1739	--紫金镐使用时间

function addzijingao_main(nCount)
	if (not nCount) then
		nCount = 1
	end;
	local nCurValue = GetTask(TASKID_TECHAN_ZIJINGAO);
	if (nCurValue < 0) then
		nCurValue = 0;
	end;
	nCurValue = nCurValue + 8 * 60 * nCount;
	SetTask(TASKID_TECHAN_ZIJINGAO, nCurValue);
	nRestH, nRestM = GetMinAndSec(nCurValue);
	return nRestH, nRestM;
end;
