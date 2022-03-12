Include("\\script\\event\\beidoulingpai\\beidouactivity.lua")
function main()
	if GetBitTask(tbBeidouActivity.TSK_AWARD_STATE, tbBeidouActivity.TSK_BIT_XUELINGDAN, 1) == 1 then
		Talk(1, "", %MSG_ALREADY_DOUBLE_AWARD)
		return 1
	end
	SetBitTask(tbBeidouActivity.TSK_AWARD_STATE, tbBeidouActivity.TSK_BIT_XUELINGDAN, 1,1)
	Msg2Player(%MSG_DOUBLE_AWARD_TIP)
end