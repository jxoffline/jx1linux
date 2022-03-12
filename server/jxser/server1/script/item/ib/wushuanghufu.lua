-- 无双虎符

IncludeLib("TONG");
IncludeLib("TIMER");
Include("\\script\\tong\\tong_header.lua");


SECOND_FRAME_SUM			=	18;										-- 1秒的帧数
HOUR_FRAME_SUM				=	SECOND_FRAME_SUM * 60 * 60;				-- 1小时的帧数

WUSHUANG_DURATION			=	1;										-- 生效持续时间 1小时
WUSHUANG_DURATION_FRAME		=	WUSHUANG_DURATION * HOUR_FRAME_SUM;
WUSHUANG_EFFECT_FRAME		=	SECOND_FRAME_SUM * 15 * 60;				-- 每次Timer触发的生效时间

TIMERID_WUSHUANG			=	78;										-- ID，填写在\settings\timertask.txt
TIMER_WUSHUANG_FREQ			=	10;										-- 释放频率(10秒)
TIMER_WUSHUANG_FREQ_FRAME	=	TIMER_WUSHUANG_FREQ * SECOND_FRAME_SUM;
TIMER_WUSHUANG_COUNT		=	WUSHUANG_DURATION_FRAME / TIMER_WUSHUANG_FREQ_FRAME;

PK_PUNISH_REDUCE_ADD		=	50										-- PK不增加几率%
PK_PUNISH_REDUCE_EXP 		=	50										-- PK经验惩罚减少比率%
PK_PUNISH_REDUCE_MONEY		=	50										-- PK金钱惩罚减少比率%

TASKID_FEATURE_ID			=	1759;									-- 无双虎符的FeatureId
TMPTASKID_WUSHUANG_IDX		=	116;									-- 记录使用的无双虎符的ItemIdx


function main(nItemIdx)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) > TONG_ELDER) then
		Say("只有帮主和长老可以使用", 1, "好的/cancel");
		return 1;
	end
	SetTaskTemp(TMPTASKID_WUSHUANG_IDX, nItemIdx);
	GiveItemUI("无双虎符", "放入面具", "process", "cancel");
	return 1;
end

function process(nItemCount)
	if (nItemCount ~= 1) then
		Say("放入物品数量不对", 0);
		return
	end
	local nMaskItemIdx = GetGiveItemUnit(1);
	local nItemGenre, nDetailType, nParticualrType = GetItemProp(nMaskItemIdx);
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("你放入的不是面具吧。", 0);
		return
	end
	if (nParticualrType == 366) then
		Say("<color=yellow>伪装面具<color>不能做无双杀阵造型。", 0);
		return
	end
	local nWuShuangItemIdx = GetTaskTemp(TMPTASKID_WUSHUANG_IDX);
	local nFeatureId = GetMaskFeature(nMaskItemIdx);
	Describe("<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nFeatureId).."?ACTION="..tostring(0).."><link>你确认使用，变成这模样"..WUSHUANG_DURATION.."小时？", 2, "确定/#process_confirm("..nWuShuangItemIdx..","..nMaskItemIdx..","..nFeatureId..")", "取消/cancel");
end

function process_confirm(nWuShuangItemIdx, nMaskItemIdx, nFeatureId)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) > TONG_ELDER) then
		return
	end
	if (RemoveItemByIndex(nWuShuangItemIdx) ~= 1 or
		RemoveItemByIndex(nMaskItemIdx) ~= 1) then
		WriteLog("[ERR] 异常！无双虎符删除材料失败！\t"..GetAccount().."("..GetName()..")");
		return
	end
	SetTask(TASKID_FEATURE_ID, nFeatureId);
	TM_SetTimer(TIMER_WUSHUANG_FREQ_FRAME, TIMERID_WUSHUANG, TIMER_WUSHUANG_COUNT, 1);
	OnTimer();
end

function cancel()
end

function OnTimer()
	local nOrgPlayerIdx = PlayerIndex;
	local nCamp = GetCamp();
	local nFeatureId = GetTask(TASKID_FEATURE_ID);
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		Msg2Player("你已经离开了帮会，无双虎符无法继续生效。");
		SetTask(TASKID_FEATURE_ID, 0);
		return
	end
	local nRestCount = TM_GetRestCount(TIMERID_WUSHUANG);
	if (nRestCount <= 0) then
		Msg2Player("无双虎符已经耗尽。");
		SetTask(TASKID_FEATURE_ID, 0);
		return
	end
	if (mod(nRestCount * TIMER_WUSHUANG_FREQ, 300) == 0) then
		Msg2Player("<color=yellow>无双虎符<color>还可以作用<color=yellow>"..floor(nRestCount * TIMER_WUSHUANG_FREQ / 3600).."<color>小时<color=yellow>"..mod(floor(nRestCount * TIMER_WUSHUANG_FREQ / 60), 60).."<color>分钟。");
	end
	local tTongPlayer = GetMapPlayerList(nCamp, 1, nTongID);
	-- 遍历，然后再设上技能
	for i = 1, getn(tTongPlayer) do
		PlayerIndex = tTongPlayer[i];
		if (PlayerIndex > 0) then
			SetPkReduceState(WUSHUANG_EFFECT_FRAME, PK_PUNISH_REDUCE_ADD, PK_PUNISH_REDUCE_EXP, PK_PUNISH_REDUCE_MONEY);
			ChangeOwnFeature(1, WUSHUANG_EFFECT_FRAME, nFeatureId);
		end
	end
	PlayerIndex = nOrgPlayerIdx;
end