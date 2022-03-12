-------------------------------------------------------------------------
-- FileName		:	reward_partner.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-18 14:43:15
-- Desc			:  	同伴修炼任务卷轴右键触发脚本
-------------------------------------------------------------------------
Include("\\script\\task\\partner\\reward\\partner_reward.lua")
Include("\\script\\task\\partner\\reward\\partner_reward2.lua")
Include("\\script\\task\\partner\\reward\\partner_reward3.lua")
Include("\\script\\task\\partner\\reward\\partner_getrealpara.lua")

function main( nItemIdx )
	local ItemGenre,DetailType,ParticualrType=GetItemProp( nItemIdx )
	local RewardTaskId,RewardTaskLevel = getrealreward ( ItemGenre,DetailType,ParticualrType )
	if ( nt_getTask(1245) <= 3 ) then
		if ( reward_startreward(RewardTaskId,RewardTaskLevel) == 1 ) then
			return 1
		end
	elseif ( nt_getTask(1245) == 4 ) then
		if ( reward_startreward2(RewardTaskId,RewardTaskLevel) == 1 ) then
			return 1
		end
	elseif ( nt_getTask(1245) == 5 ) then
		if ( reward_startreward3(RewardTaskId,RewardTaskLevel) == 1 ) then
			return 1
		end
	end
end